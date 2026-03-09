document.addEventListener("DOMContentLoaded", () => {
    document.addEventListener("click", (e) => {
        const btn = e.target.closest("button");
        if (!btn)
            return;

        // Handle "Add New" button which is outside the table
        if (btn.textContent.trim().startsWith("+ Add New")) {
            const container = btn.closest(".main-content");
            if (!container)
                return;

            const table = container.querySelector(".data-table");
            if (!table)
                return;

            const tbody = table.querySelector("tbody");
            if (!tbody)
                return;

            const ths = table.querySelectorAll("thead th");
            const newTr = document.createElement("tr");

            // Infer status type based on existing text content in the table
            let statusOptions = `<input type="text" class="filter-input" value="">`;
            const tableText = tbody.textContent.toLowerCase();
            if (tableText.includes("active") || tableText.includes("inactive")) {
                statusOptions = `<select class="filter-input filter-select">
            <option value="Active">Active</option>
            <option value="Inactive">Inactive</option>
          </select>`;
            } else if (
                tableText.includes("occupied") ||
                tableText.includes("available")
            ) {
                statusOptions = `<select class="filter-input filter-select">
            <option value="Available">Available</option>
            <option value="Occupied">Occupied</option>
          </select>`;
            }

            // Add form fields for each column except Actions
            for (let i = 0; i < ths.length - 1; i++) {
                const td = document.createElement("td");
                const columnName = ths[i].textContent.trim().toLowerCase();

                if (columnName === "status") {
                    td.innerHTML = statusOptions;
                } else {
                    td.innerHTML = `<input type="text" class="filter-input" value="">`;
                }
                newTr.appendChild(td);
            }

            // Append Actions column including Save and Delete
            const actionTd = document.createElement("td");
            actionTd.innerHTML = `
        <button class="btn btn-sm btn-success"><i class="fa-solid fa-floppy-disk"></i> Save</button>
        <button class="btn btn-danger btn-sm"><i class="fa-solid fa-trash"></i> Delete</button>
      `;
            newTr.appendChild(actionTd);

            tbody.appendChild(newTr);
            return;
        }

        // Now proceed with row-based buttons (Edit, Save, Delete)
        const tr = btn.closest("tr");
        if (!tr)
            return;

        if (btn.textContent.includes("Edit")) {
            const tds = tr.querySelectorAll("td");
            const table = tr.closest("table");
            const ths = table ? table.querySelectorAll("th") : [];

            // Skip the first (ID) and last (Actions) columns
            for (let i = 0; i < tds.length - 1; i++) {
                const td = tds[i];
                // Get the text content, avoiding any existing HTML structure
                const text = td.innerText.trim();

                // Keep original innerHTML on dataset to potentially restore later
                td.dataset.originalHtml = td.innerHTML;

                const columnName = ths[i]
                    ? ths[i].textContent.trim().toLowerCase()
                    : "";

                if (columnName === "status") {
                    if (text === "Active" || text === "Inactive") {
                        const isActive = text === "Active" ? "selected" : "";
                        const isInactive = text === "Inactive" ? "selected" : "";
                        td.innerHTML = `<select class="filter-input filter-select">
                <option value="Active" ${isActive}>Active</option>
                <option value="Inactive" ${isInactive}>Inactive</option>
              </select>`;
                    } else if (text === "Occupied" || text === "Available") {
                        const isOccupied = text === "Occupied" ? "selected" : "";
                        const isAvailable = text === "Available" ? "selected" : "";
                        td.innerHTML = `<select class="filter-input filter-select">
                <option value="Occupied" ${isOccupied}>Occupied</option>
                <option value="Available" ${isAvailable}>Available</option>
              </select>`;
                    } else {
                        // Default input field if status value is unrecognized
                        td.innerHTML = `<input type="text" class="filter-input" value="${text}">`;
                    }
                } else {
                    // Replace content with an input field
                    td.innerHTML = `<input type="text" class="filter-input" value="${text}">`;
                }
            }

            // Change button to Save
            btn.innerHTML = '<i class="fa-solid fa-floppy-disk"></i> Save';
            btn.classList.add("btn-success");
        } else if (btn.textContent.includes("Save")) {
            const tds = tr.querySelectorAll("td");

            for (let i = 0; i < tds.length - 1; i++) {
                const td = tds[i];
                const input = td.querySelector("input, select");
                if (input) {
                    const newValue = input.value.trim();
                    // Basic attempt to preserve span wrappers if it's a known status
                    if (
                        td.dataset.originalHtml &&
                        td.dataset.originalHtml.includes("span")
                    ) {
                        if (newValue.toLowerCase() === "occupied") {
                            td.innerHTML = `<span class="status-occupied">${newValue}</span>`;
                        } else if (newValue.toLowerCase() === "available") {
                            td.innerHTML = `<span class="status-available">${newValue}</span>`;
                        } else {
                            td.textContent = newValue;
                        }
                    } else {
                        td.textContent = newValue;
                    }
                }
            }

            // Change button back to Edit
            btn.innerHTML = '<i class="fa-solid fa-pen-to-square"></i> Edit';
            btn.classList.remove("btn-success");
        } else if (btn.textContent.includes("Delete")) {
            if (confirm("Are you sure you want to delete this record?")) {
                tr.remove();
            }
        }
    });
});

// Common Modal Functions for Admin Pages
function openAddModal() {
    const addModal = document.getElementById('addModal');
    if (addModal) addModal.style.display = 'block';
}

function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) modal.style.display = 'none';
}

function openEditModal(...args) {
    if (document.getElementById('editSlotID')) {
        // Slot editing
        const [id, name, zone, type, status] = args;
        document.getElementById('editSlotID').value = id;
        document.getElementById('editSlotName').value = name;
        document.getElementById('editZoneID').value = zone;
        document.getElementById('editTypeID').value = type;
        document.getElementById('editStatus').value = status;
    } else if (document.getElementById('editZoneID') && document.getElementById('editZoneName')) {
        // Zone editing
        const [id, name, typeName, desc] = args;
        document.getElementById('editZoneID').value = id;
        document.getElementById('editZoneName').value = name;
        document.getElementById('editVehicleTypeName').value = typeName;
        document.getElementById('editDescription').value = desc !== 'null' && desc !== '' ? desc : '';
    }

    const editModal = document.getElementById('editModal');
    if (editModal) editModal.style.display = 'block';
}

function openDetailModal(...args) {
    if (document.getElementById('detailSlotName')) {
        // Slot details
        const [name, zone, status, plate, owner, phone, time] = args;
        document.getElementById('detailSlotName').textContent = name;
        document.getElementById('detailZoneName').textContent = zone;
        document.getElementById('detailStatus').textContent = status ? status.toLowerCase() : '';

        document.getElementById('detailLicensePlate').textContent = plate ? plate : 'N/A';
        document.getElementById('detailOwnerName').textContent = owner ? owner : 'N/A';
        document.getElementById('detailOwnerPhone').textContent = phone ? phone : 'N/A';
        document.getElementById('detailEntryTime').textContent = time ? time.substring(0, 19) : 'N/A';

        // Toggle owner info visiblity based on occupied status
        // the original element only existed in slot_list.jsp
        const ownerInfo = document.getElementById('detailOwnerInfo');
        const emptyInfo = document.getElementById('detailEmptyInfo');
        if (ownerInfo && emptyInfo) {
            if (status && status.toLowerCase() === 'occupied') {
                ownerInfo.style.display = 'block';
                emptyInfo.style.display = 'none';
            } else {
                ownerInfo.style.display = 'none';
                emptyInfo.style.display = 'block';
            }
        }
    } else if (document.getElementById('detailCapacity')) {
        // Zone details
        const [name, cap, vtypes, desc] = args;
        document.getElementById('detailZoneName').textContent = name;
        document.getElementById('detailCapacity').textContent = cap;
        document.getElementById('detailVehicleTypes').textContent = vtypes;
        document.getElementById('detailDescription').textContent = desc !== 'null' && desc !== '' ? desc : 'N/A';
    }

    const detailModal = document.getElementById('detailModal');
    if (detailModal) detailModal.style.display = 'block';
}

// Close modal if user clicks outside of it
window.onclick = function (event) {
    if (event.target.className === 'modal' || event.target.classList.contains('modal')) {
        event.target.style.display = 'none';
    }
}

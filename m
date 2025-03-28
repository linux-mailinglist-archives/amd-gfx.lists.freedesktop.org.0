Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E90A74535
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Mar 2025 09:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6537110E992;
	Fri, 28 Mar 2025 08:18:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 28 Mar 2025 02:51:39 UTC
Received: from irl.hu (irl.hu [95.85.9.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7377110E96F
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Mar 2025 02:51:39 +0000 (UTC)
Received: from fedori.lan (51b692a2.dsl.pool.telekom.hu
 [::ffff:81.182.146.162]) (AUTH: CRAM-MD5 soyer@irl.hu, )
 by irl.hu with ESMTPSA
 id 00000000000800FA.0000000067E60D82.0006A495; Fri, 28 Mar 2025 03:46:26 +0100
From: Gergo Koteles <soyer@irl.hu>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
 stable@vger.kernel.org
Subject: [PATCH] ACPI: video: Handle fetching EDID as ACPI_TYPE_PACKAGE
Date: Fri, 28 Mar 2025 03:44:00 +0100
Message-ID: <4cef341fdf7a0e877c50b502fc95ee8be28aa811.1743129387.git.soyer@irl.hu>
X-Mailer: git-send-email 2.49.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
X-Mailman-Approved-At: Fri, 28 Mar 2025 08:18:38 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Some Lenovo laptops incorrectly return EDID as
buffer in ACPI package (instead of just a buffer)
when calling _DDC.

Calling _DDC generates this ACPI Warning:
ACPI Warning: \_SB.PCI0.GP17.VGA.LCD._DDC: Return type mismatch - \
found Package, expected Integer/Buffer (20240827/nspredef-254)

Use the first element of the package to get the EDID buffer.

The DSDT:

Name (AUOP, Package (0x01)
{
	Buffer (0x80)
	{
	...
	}
})

...

Method (_DDC, 1, NotSerialized)  // _DDC: Display Data Current
{
	If ((PAID == AUID))
        {
		Return (AUOP) /* \_SB_.PCI0.GP17.VGA_.LCD_.AUOP */
	}
	ElseIf ((PAID == IVID))
	{
		Return (IVOP) /* \_SB_.PCI0.GP17.VGA_.LCD_.IVOP */
	}
	ElseIf ((PAID == BOID))
	{
		Return (BOEP) /* \_SB_.PCI0.GP17.VGA_.LCD_.BOEP */
	}
	ElseIf ((PAID == SAID))
	{
		Return (SUNG) /* \_SB_.PCI0.GP17.VGA_.LCD_.SUNG */
	}

	Return (Zero)
}

Cc: stable@vger.kernel.org
Fixes: c6a837088bed ("drm/amd/display: Fetch the EDID from _DDC if available for eDP")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4085
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 drivers/acpi/acpi_video.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index efdadc74e3f4..65cf36796506 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -649,6 +649,9 @@ acpi_video_device_EDID(struct acpi_video_device *device, void **edid, int length
 
 	obj = buffer.pointer;
 
+	if (obj && obj->type == ACPI_TYPE_PACKAGE && obj->package.count == 1)
+		obj = &obj->package.elements[0];
+
 	if (obj && obj->type == ACPI_TYPE_BUFFER) {
 		*edid = kmemdup(obj->buffer.pointer, obj->buffer.length, GFP_KERNEL);
 		ret = *edid ? obj->buffer.length : -ENOMEM;
@@ -658,7 +661,7 @@ acpi_video_device_EDID(struct acpi_video_device *device, void **edid, int length
 		ret = -EFAULT;
 	}
 
-	kfree(obj);
+	kfree(buffer.pointer);
 	return ret;
 }
 
-- 
2.49.0


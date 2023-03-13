Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C136B6B7858
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Mar 2023 14:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C167B10E511;
	Mon, 13 Mar 2023 13:02:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DCB10E4DB;
 Mon, 13 Mar 2023 10:57:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABBD1611CC;
 Mon, 13 Mar 2023 10:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE141C433EF;
 Mon, 13 Mar 2023 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1678705028;
 bh=dzid3AOct63MVlrkCg/dDgzaLRlt2EhD3OpRgsV1ZH0=;
 h=Subject:To:Cc:From:Date:From;
 b=O9cfxhJw/F4GODQKEOO4dtdSrhrpYYXnemaDABRXbHeVsVg0W3zeyTFX1xz/oGs2j
 onJNwmPUKrZR6yOuYhS2LQvJOmL0ZFSEGNZVMtnRPFPrBXL/YvmOzzn7uKr3Eibww8
 Ax2CmUCrK7JENTET89br9iGvFzVAi0bh4CnVaE18=
Subject: Patch "drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF"
 has been added to the 6.2-stable tree
To: Vitaly.Prosyak@amd.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, harry.wentland@amd.com,
 jani.nikula@linux.intel.com, joshua@froggi.es, pekka.paalanen@collabora.com,
 ppaalanen@gmail.com, sebastian.wick@redhat.com, uma.shankar@intel.com,
 ville.syrjala@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 13 Mar 2023 11:55:21 +0100
Message-ID: <167870492122588@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-Mailman-Approved-At: Mon, 13 Mar 2023 13:02:28 +0000
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
Cc: stable-commits@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF

to the 6.2-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-display-don-t-block-hdr_output_metadata-on-unknown-eotf.patch
and it can be found in the queue-6.2 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From e5eef23e267c72521d81f23f7f82d1f523d4a253 Mon Sep 17 00:00:00 2001
From: Harry Wentland <harry.wentland@amd.com>
Date: Fri, 13 Jan 2023 11:24:08 -0500
Subject: drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Harry Wentland <harry.wentland@amd.com>

commit e5eef23e267c72521d81f23f7f82d1f523d4a253 upstream.

The EDID of an HDR display defines EOTFs that are supported
by the display and can be set in the HDR metadata infoframe.
Userspace is expected to read the EDID and set an appropriate
HDR_OUTPUT_METADATA.

In drm_parse_hdr_metadata_block the kernel reads the supported
EOTFs from the EDID and stores them in the
drm_connector->hdr_sink_metadata. While doing so it also
filters the EOTFs to the EOTFs the kernel knows about.
When an HDR_OUTPUT_METADATA is set it then checks to
make sure the EOTF is a supported EOTF. In cases where
the kernel doesn't know about a new EOTF this check will
fail, even if the EDID advertises support.

Since it is expected that userspace reads the EDID to understand
what the display supports it doesn't make sense for DRM to block
an HDR_OUTPUT_METADATA if it contains an EOTF the kernel doesn't
understand.

This comes with the added benefit of future-proofing metadata
support. If the spec defines a new EOTF there is no need to
update DRM and an compositor can immediately make use of it.

Bug: https://gitlab.freedesktop.org/wayland/weston/-/issues/609

v2: Distinguish EOTFs defind in kernel and ones defined
    in EDID in the commit description (Pekka)

v3: Rebase; drm_hdmi_infoframe_set_hdr_metadata moved
    to drm_hdmi_helper.c

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-By: Joshua Ashton <joshua@froggi.es>
Link: https://patchwork.freedesktop.org/patch/msgid/20230113162428.33874-2-harry.wentland@amd.com
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -44,10 +44,8 @@ int drm_hdmi_infoframe_set_hdr_metadata(
 
 	/* Sink EOTF is Bit map while infoframe is absolute values */
 	if (!is_eotf_supported(hdr_metadata->hdmi_metadata_type1.eotf,
-	    connector->hdr_sink_metadata.hdmi_type1.eotf)) {
-		DRM_DEBUG_KMS("EOTF Not Supported\n");
-		return -EINVAL;
-	}
+	    connector->hdr_sink_metadata.hdmi_type1.eotf))
+		DRM_DEBUG_KMS("Unknown EOTF %d\n", hdr_metadata->hdmi_metadata_type1.eotf);
 
 	err = hdmi_drm_infoframe_init(frame);
 	if (err < 0)


Patches currently in stable-queue which might be from harry.wentland@amd.com are

queue-6.2/drm-connector-print-max_requested_bpc-in-state-debugfs.patch
queue-6.2/drm-display-don-t-block-hdr_output_metadata-on-unknown-eotf.patch

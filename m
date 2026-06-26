Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nCz4IYG2PmqHKgkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 19:27:29 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E171B6CF6A2
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 19:27:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=alerinaldi.it header.s=default header.b="bMdFF/Cp";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=alerinaldi.it (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12A010F6D0;
	Fri, 26 Jun 2026 17:27:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 2776 seconds by postgrey-1.36 at gabe;
 Fri, 26 Jun 2026 15:22:45 UTC
Received: from server22.dominiok.net (server22.dominiok.net [198.136.49.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED8910E3AE;
 Fri, 26 Jun 2026 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=alerinaldi.it; s=default; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mE1OMUqnSgvpT6rWa4HUfXLZAPWVbKlraUuGYFi42p4=; b=bMdFF/Cpu6AzlHbplO98QQrmN6
 d7vwj43kH3Le2EMTJHpvNw7OnmgSpeled91CBo3MvQLdjzjS+kl4GvbTIs9JGwYmW5GCp556kLFyL
 fdeOIFc6ZXOROM/DvJbftCuGZL3cYTfGW7gqy9P/5tfd5C6ejyMgVtW3MRn+o3pSCa3UxR0UY91IE
 NNFfl2fqdGd61FXdIwvRiqppclk4ctfVsrMNFk8gb4czqZARcfDTpylfcpeXT2F6b6gaUH+wpQK+E
 Nh+42CQMphNImFUZZTmi9/JAO7kPSyGvT8/IIFwyNgRGyb8jRPMBPV/zQxMZiyO7k6EkcO0Db81w7
 IhCvH2oA==;
Received: from mailnull by server22.dominiok.net with spam-scanner (Exim
 4.99.4) (envelope-from <ale@alerinaldi.it>)
 id 1wd7fQ-00000002VCb-0m1s; Fri, 26 Jun 2026 16:36:28 +0200
X-ImunifyEmail-Filter-Score: -0.64
X-ImunifyEmail-Filter-Version: 3.8.25/202606241025
X-ImunifyEmail-Filter-Action: no action
X-ImunifyEmail-Filter-Info: Ul9NSVNTSU5HX0NIQVJTRVQgTUlNRV9UUkFDRSBSQ1ZEX1RM
 U19BTEw
 gVE9fRE5fU09NRSBSQ1ZEX1ZJQV9TTVRQX0FVVEggTUlNRV9VTktOT1
 dOIFZFUklMT0NLX0NCIEZST01fSEFTX0ROIFJDUFRfQ09VTlRfU0VWR
 U4gQVNOIEJBWUVTX0hBTSBBUkNfTkEgUkNWRF9DT1VOVF9PTkUgRlJP
 TV9FUV9FTlZGUk9NIFRPX01BVENIX0VOVlJDUFRfU09NRSBNSURfQ09
 OVEFJTlNfRlJPTQ==
Received: from [45.137.234.149] (port=56066
 helo=alerinaldi-legion.tail281c59.ts.net)
 by server22.dominiok.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.4) (envelope-from <ale@alerinaldi.it>)
 id 1wd7fQ-00000002VA4-32Zy; Fri, 26 Jun 2026 16:36:27 +0200
From: Alessandro Rinaldi <ale@alerinaldi.it>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Werner Sembach <wse@tuxedocomputers.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alessandro Rinaldi <ale@alerinaldi.it>
Subject: [PATCH] drm/amd/display: Force PWM backlight on Lenovo Legion 5
 15ARH05
Date: Fri, 26 Jun 2026 16:36:00 +0200
Message-ID: <20260626143600.13531-1-ale@alerinaldi.it>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server22.dominiok.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - alerinaldi.it
X-Get-Message-Sender-Via: server22.dominiok.net: authenticated_id:
 ale@alerinaldi.it
X-Authenticated-Sender: server22.dominiok.net: ale@alerinaldi.it
X-Mailman-Approved-At: Fri, 26 Jun 2026 17:27:20 +0000
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[alerinaldi.it:s=default];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[alerinaldi.it : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	HAS_X_GMSV(0.00)[ale@alerinaldi.it];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_X_AS(0.00)[ale@alerinaldi.it];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[alerinaldi.it:-];
	HAS_X_ANTIABUSE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ale@alerinaldi.it,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,alerinaldi.it:email,alerinaldi.it:mid,alerinaldi.it:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E171B6CF6A2

The Lenovo Legion 5 15ARH05 (Renoir) ships a BOE 0x08DF eDP panel that
advertises AUX/DPCD backlight control, so amdgpu's automatic detection
(amdgpu_backlight == -1) selects AUX. On this panel the AUX backlight
path has no effect: brightness writes are accepted but the panel level
never changes, the display is stuck at a fixed brightness and
max_brightness is reported as a bogus 511000. As a result neither the
desktop brightness slider nor the brightness hotkeys do anything.

Forcing PWM backlight (amdgpu.backlight=0) restores working control:
max_brightness becomes 65535 and the level tracks writes. This has long
been applied by users as a manual kernel-parameter workaround.

Extend the generic panel backlight quirk with a force_pwm flag, add an
entry for the Legion 5 15ARH05 / BOE 0x08DF panel, and have amdgpu
disable AUX backlight (use PWM) when the quirk matches and the user
lets the driver auto-select the backlight type.

Signed-off-by: Alessandro Rinaldi <ale@alerinaldi.it>
Tested-by: Alessandro Rinaldi <ale@alerinaldi.it>
---
This overlaps with the "force backlight type" patches for TUXEDO devices
(amd and i915). If a single shared mechanism for forcing PWM is preferred,
I'm happy to respin on top of it.

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c  | 7 +++++--
 drivers/gpu/drm/drm_panel_backlight_quirks.c             | 9 +++++++++
 include/drm/drm_utils.h                                  | 1 +
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
index f19092a32..9ae1c1b0f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
@@ -486,6 +486,8 @@ void amdgpu_dm_update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
 	caps->aux_support = false;
 
+	panel_backlight_quirk = drm_get_panel_backlight_quirk(aconnector->drm_edid);
+
 	if (caps->ext_caps->bits.oled == 1
 	    /*
 	     * ||
@@ -498,6 +500,9 @@ void amdgpu_dm_update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 		caps->aux_support = false;
 	else if (amdgpu_backlight == 1)
 		caps->aux_support = true;
+	else if (!IS_ERR_OR_NULL(panel_backlight_quirk) &&
+		 panel_backlight_quirk->force_pwm)
+		caps->aux_support = false;
 	if (caps->aux_support)
 		aconnector->dc_link->backlight_control_type = BACKLIGHT_CONTROL_AMD_AUX;
 
@@ -513,8 +518,6 @@ void amdgpu_dm_update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	else
 		caps->aux_min_input_signal = 1;
 
-	panel_backlight_quirk =
-		drm_get_panel_backlight_quirk(aconnector->drm_edid);
 	if (!IS_ERR_OR_NULL(panel_backlight_quirk)) {
 		if (panel_backlight_quirk->min_brightness) {
 			caps->min_input_signal =
diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index 537dc6dd0..2d0238382 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -21,6 +21,15 @@ struct drm_get_panel_backlight_quirk {
 };
 
 static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks[] = {
+	/* Lenovo Legion 5 15ARH05, AUX backlight non-functional, force PWM */
+	{
+		.dmi_match.field = DMI_SYS_VENDOR,
+		.dmi_match.value = "LENOVO",
+		.dmi_match_other.field = DMI_PRODUCT_VERSION,
+		.dmi_match_other.value = "Lenovo Legion 5 15ARH05",
+		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x08df),
+		.quirk = { .force_pwm = true, },
+	},
 	/* 13 inch matte panel */
 	{
 		.dmi_match.field = DMI_BOARD_VENDOR,
diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
index 6a46f755d..7e077484c 100644
--- a/include/drm/drm_utils.h
+++ b/include/drm/drm_utils.h
@@ -19,6 +19,7 @@ int drm_get_panel_orientation_quirk(int width, int height);
 struct drm_panel_backlight_quirk {
 	u16 min_brightness;
 	u32 brightness_mask;
+	bool force_pwm;
 };
 
 const struct drm_panel_backlight_quirk *
-- 
2.53.0



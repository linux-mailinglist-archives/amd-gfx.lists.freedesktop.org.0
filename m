Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A132181339
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Mar 2020 09:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371766E935;
	Wed, 11 Mar 2020 08:36:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Wed, 11 Mar 2020 05:13:44 UTC
Received: from smtprelay.hostedemail.com (smtprelay0155.hostedemail.com
 [216.40.44.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F3A6E0D4
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2020 05:13:44 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 37B111802E2C2
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2020 05:07:36 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 568831802E2B9;
 Wed, 11 Mar 2020 05:07:35 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:541:800:960:967:973:982:988:989:1260:1311:1314:1345:1359:1437:1515:1534:1542:1711:1730:1747:1777:1792:1981:2194:2199:2393:2525:2560:2563:2682:2685:2859:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3865:3866:3867:3868:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4605:5007:6261:9025:10004:10848:11026:11473:11657:11658:11914:12043:12296:12297:12438:12555:12679:12895:12986:13894:14096:14181:14394:14721:21080:21433:21627:21811:21939:21990:30054:30080,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:0, LUA_SUMMARY:none
X-HE-Tag: bell19_24f02882e935b
X-Filterd-Recvd-Size: 3579
Received: from joe-laptop.perches.com (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Wed, 11 Mar 2020 05:07:33 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next 024/491] AMD DISPLAY CORE: Use fallthrough;
Date: Tue, 10 Mar 2020 21:51:38 -0700
Message-Id: <4ee79adcba4e5ea80b3ef6271caeef6df4bf8ca7.1583896349.git.joe@perches.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1583896344.git.joe@perches.com>
References: <cover.1583896344.git.joe@perches.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Mar 2020 08:36:13 +0000
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Convert the various uses of fallthrough comments to fallthrough;

Done via script
Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 4 ++--
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       | 2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 2f1c958..37fa7b 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -267,7 +267,7 @@ static struct atom_display_object_path_v2 *get_bios_object(
 					&& id.enum_id == obj_id.enum_id)
 				return &bp->object_info_tbl.v1_4->display_path[i];
 		}
-		/* fall through */
+		fallthrough;
 	case OBJECT_TYPE_CONNECTOR:
 	case OBJECT_TYPE_GENERIC:
 		/* Both Generic and Connector Object ID
@@ -280,7 +280,7 @@ static struct atom_display_object_path_v2 *get_bios_object(
 					&& id.enum_id == obj_id.enum_id)
 				return &bp->object_info_tbl.v1_4->display_path[i];
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
index 68c4049..743042 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
@@ -645,7 +645,7 @@ bool dce_aux_transfer_with_retries(struct ddc_service *ddc,
 			case AUX_TRANSACTION_REPLY_AUX_DEFER:
 			case AUX_TRANSACTION_REPLY_I2C_OVER_AUX_DEFER:
 				retry_on_defer = true;
-				/* fall through */
+				fallthrough;
 			case AUX_TRANSACTION_REPLY_I2C_OVER_AUX_NACK:
 				if (++aux_defer_retries >= AUX_MAX_DEFER_RETRIES) {
 					goto fail;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
index 8aa937f..51481e 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
@@ -479,7 +479,7 @@ static void program_grph_pixel_format(
 	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
 		sign = 1;
 		floating = 1;
-		/* fall through */
+		fallthrough;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F: /* shouldn't this get float too? */
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
 		grph_depth = 3;
-- 
2.24.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

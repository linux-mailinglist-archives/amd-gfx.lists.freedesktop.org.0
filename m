Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7E57E5869
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Nov 2023 15:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE7210E777;
	Wed,  8 Nov 2023 14:11:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1801 seconds by postgrey-1.36 at gabe;
 Wed, 08 Nov 2023 07:33:34 UTC
Received: from 6.mo575.mail-out.ovh.net (6.mo575.mail-out.ovh.net
 [46.105.63.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB69210E3B8
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Nov 2023 07:33:34 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.146.132])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4DE6628EFD
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Nov 2023 06:55:20 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-lv8ff (unknown [10.110.208.62])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 15B4C1FE12;
 Wed,  8 Nov 2023 06:55:17 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.109])
 by ghost-submission-6684bf9d7b-lv8ff with ESMTPSA
 id uGgwOtUwS2X3fAAAN287Lg
 (envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 08 Nov 2023 06:55:17 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003812ecbba-255d-4a16-800e-086f660595b3,
 CA30051851D9204B2894E18F048F6C805596AA31)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 87.94.109.40
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 skhan@linuxfoundation.org
Subject: [PATCH] drm/amdgpu: remove unused MES_LOG_BUFFER struct
Date: Wed,  8 Nov 2023 08:55:12 +0200
Message-Id: <20231108065512.14087-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3519281634429019841
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddukedguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnheptddutefhgefhgeffhfdtueehudekudduueeiieetgeektddugedvkeetffetvdffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeejrdelgedruddtledrgedtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
X-Mailman-Approved-At: Wed, 08 Nov 2023 14:11:48 +0000
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
Cc: Jack.Xiao@amd.com, jonathan.kim@amd.com, felix.kuehling@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 linux-kernel-mentees@lists.linux.dev
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The mention struct seems not to be used along the driver, and is also
triggering a warning to migrate to flexible array. This patch will
remove the full structure and get rid of the warning.

drivers/gpu/drm/amd/include/mes_v11_api_def.h:192:27-34: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
---
 drivers/gpu/drm/amd/include/mes_v11_api_def.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/mes_v11_api_def.h b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
index b1db2b190187..e032ee262fa9 100644
--- a/drivers/gpu/drm/amd/include/mes_v11_api_def.h
+++ b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
@@ -187,11 +187,6 @@ struct MES_LOG_ENTRY_DATA {
 	};
 };
 
-struct MES_LOG_BUFFER {
-	struct MES_LOG_ENTRY_HEADER	header;
-	struct MES_LOG_ENTRY_DATA	entries[1];
-};
-
 enum MES_SWIP_TO_HWIP_DEF {
 	MES_MAX_HWIP_SEGMENT = 8,
 };
-- 
2.39.2


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA035179BC6
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Mar 2020 23:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B796EB73;
	Wed,  4 Mar 2020 22:36:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39216E129
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Mar 2020 22:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583361388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkHNoF1LiLaOFBDXS0D+ocY6/bt/y7PoObvSuoIt6kI=;
 b=VO7CzJGxxg/g66yCA1LP5JjqwDJzselH1+LtHoF1UdAhQaydiR1jV7pOkq/phrvBN/rra7
 eUZBQUiRFOAlCECNZU4Nks7fEQopIk7Huxter4czg/ljL9UZDbzNMfvwziP3X8fRNbDLtM
 d+CaVvisKDTUoPnHaCNQ5qxqV08bTZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-xMuv8gZLMNqn0oLC9IXmPw-1; Wed, 04 Mar 2020 17:36:27 -0500
X-MC-Unique: xMuv8gZLMNqn0oLC9IXmPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F42D800053;
 Wed,  4 Mar 2020 22:36:25 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B724B60BE0;
 Wed,  4 Mar 2020 22:36:23 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH 1/3] drm/dp_mst: Rename drm_dp_mst_is_dp_mst_end_device() to
 be less redundant
Date: Wed,  4 Mar 2020 17:36:11 -0500
Message-Id: <20200304223614.312023-2-lyude@redhat.com>
In-Reply-To: <20200304223614.312023-1-lyude@redhat.com>
References: <20200304223614.312023-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@google.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

It's already prefixed by dp_mst, so we don't really need to repeat
ourselves here. One of the changes I should have picked up originally
when reviewing MST DSC support.

There should be no functional changes here

Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Sean Paul <seanpaul@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 61e7beada832..207eef08d12c 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1937,7 +1937,7 @@ static u8 drm_dp_calculate_rad(struct drm_dp_mst_port *port,
 	return parent_lct + 1;
 }
 
-static bool drm_dp_mst_is_dp_mst_end_device(u8 pdt, bool mcs)
+static bool drm_dp_mst_is_end_device(u8 pdt, bool mcs)
 {
 	switch (pdt) {
 	case DP_PEER_DEVICE_DP_LEGACY_CONV:
@@ -1967,13 +1967,13 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
 
 	/* Teardown the old pdt, if there is one */
 	if (port->pdt != DP_PEER_DEVICE_NONE) {
-		if (drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
+		if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 			/*
 			 * If the new PDT would also have an i2c bus,
 			 * don't bother with reregistering it
 			 */
 			if (new_pdt != DP_PEER_DEVICE_NONE &&
-			    drm_dp_mst_is_dp_mst_end_device(new_pdt, new_mcs)) {
+			    drm_dp_mst_is_end_device(new_pdt, new_mcs)) {
 				port->pdt = new_pdt;
 				port->mcs = new_mcs;
 				return 0;
@@ -1993,7 +1993,7 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
 	port->mcs = new_mcs;
 
 	if (port->pdt != DP_PEER_DEVICE_NONE) {
-		if (drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
+		if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 			/* add i2c over sideband */
 			ret = drm_dp_mst_register_i2c_bus(&port->aux);
 		} else {
@@ -2169,7 +2169,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
 	}
 
 	if (port->pdt != DP_PEER_DEVICE_NONE &&
-	    drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
+	    drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 		port->cached_edid = drm_get_edid(port->connector,
 						 &port->aux.ddc);
 		drm_connector_set_tile_property(port->connector);
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

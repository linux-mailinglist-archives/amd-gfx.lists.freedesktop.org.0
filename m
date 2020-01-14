Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3624813A431
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jan 2020 10:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD076E329;
	Tue, 14 Jan 2020 09:48:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0796E329
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jan 2020 09:48:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so11470413wrh.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jan 2020 01:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1fv3pyPwdgR9YD7bygWUQUrB5fLS6/OeXepJ5OusQw=;
 b=fQtCPetg6GHe5pUYwj51Tcn3DbGUHktB87nOKUvFpkYoKoYcjLjR7e3zq1+XsHYl9Q
 RBpeXH7Msa0dQ2dSsqazKURdtmuByH9sSN3u38MkUB/3mmsPQ9WjP2kwyUT+hJtjqT2y
 LcUKF0TU8HHJtFDtEUkhBAuapS8NOCZWbNniyug0WO7XbDAUGxoRZGhDPkzUykSdG1LY
 LVSgSPe5mybavuWphpSUOd8O/hrXG7a9++7CRxmE0CPweCQ0uRdxp98VMAVlh0bdM0TA
 HG0iFiYP41x2jGWgJSyGi3mQ3zgRr8gWCcv3pWUij5ICxF/UzhFRYJiPEXbJYA77b6cU
 YD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1fv3pyPwdgR9YD7bygWUQUrB5fLS6/OeXepJ5OusQw=;
 b=F2vITodm3nA+q3u/dRGzfBhPoyvUSshQnCYu8u7qbLYL1KCOBSAGWxz+nNNYPvdHTb
 a07ThdIRaogW/meFqPCJ2QwtFq9a8sIVEzEoqmgTExdqNcBjcOdqoiUT9o5QO0aqXLIx
 Hx6gnzdzCrjW8pOADcXz3skXHW427NC9YZzXVKp5znImvktJeA0ff6R1OgIDAe8trHl6
 VIyYkLpNwgFpxRqWMXNZDk91lTi3JndmqC4Vw1CBAayZOjJX3p/BJU0+w/MJr5Mti+GH
 9DNEW/B4GgGEq9V3rGEsXSFOILIlv2jnKx+m96nz7CmXUvfHoZ/wbMFDqT30vqV3kyER
 I5LQ==
X-Gm-Message-State: APjAAAWpaTs3/QPoUjWpWTk+48jo7EU3ACWYGv0Bof7TxI+UQPxxzFXl
 qIBQAp5sfBG27yPHyRugzJj2atOOQSIkwqyP
X-Google-Smtp-Source: APXvYqzvMculYeB7LjiWWMRFj6WAyhsJR5k8LZ3WIp5M8ARUjjX4gVkeI1Blybhe1lQwuEETg5Fpqw==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr25134423wrr.340.1578995336556; 
 Tue, 14 Jan 2020 01:48:56 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F343700CDDF573F1071AE40.dip0.t-ipconnect.de.
 [2003:c5:8f34:3700:cddf:573f:1071:ae40])
 by smtp.gmail.com with ESMTPSA id o1sm18815691wrn.84.2020.01.14.01.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 01:48:55 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH RESEND] drm/amdgpu: error out on entity with no run queue
Date: Tue, 14 Jan 2020 10:50:19 +0100
Message-Id: <20200114095020.7854-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: alexander.deucher@amd.com, kenny.ho@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Disabled HW IP's entity initialized with NULL rq. We should not
process any submit request from userspace for a disabled HW IP.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 614919f265b9..943e6075bdf9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -913,6 +913,11 @@ static int amdgpu_cs_ib_fill(struct amdgpu_device *adev,
 		if (parser->entity && parser->entity != entity)
 			return -EINVAL;
 
+		/* Return if there is no run queue associated with this entity.
+		 * Possibly because of disabled HW IP*/
+		if (entity->rq == NULL)
+			return -EINVAL;
+
 		parser->entity = entity;
 
 		ring = to_amdgpu_ring(entity->rq->sched);
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

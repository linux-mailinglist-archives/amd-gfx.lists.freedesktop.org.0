Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2230E1709BB
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Feb 2020 21:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447FE6EBCC;
	Wed, 26 Feb 2020 20:34:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6466F6EBC1
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Feb 2020 20:34:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z3so441736wru.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Feb 2020 12:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m/RAZYnW3JjdN37M/WTuu4y/VS2HGZAOr3PT0IAQ4kY=;
 b=tZ81hTsd7iz9yNHqd8RS4cgdeCBgqcvqmVANd170s4Pv0k9/H+PtCCYmtiHs5LmqDm
 ZFo6+c0nQYAxXgXDO7TfRxH0H6mmxJuejMu9aqgvFwk7QH9wgb/6oPa8wlonQYe1D122
 NcNznvc3LDcj85snM0BkNvIJ1R+BLrp0YdjlCLgJds5e9HdfXwgRiaSySHY5ADCgcSIu
 8JE/joAof4s++e4vnmG3jwXqvj10c22DIkGqljKMzHTcRuawym06Xy7+LohEhcnDmzSv
 njOLR3ReuvMH5dFe5TEZalBDKIPLzgryvbfz5uTjhEQHdKnxhklPUlXhizn08Z80/FNV
 YXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m/RAZYnW3JjdN37M/WTuu4y/VS2HGZAOr3PT0IAQ4kY=;
 b=a0zVUP6zyEtUK1TdKDQBXjA3oTl+LFSX+woplIYSpT0oWfpfiUv80Nic6BGJ9IdhGz
 gZIa8cstb8bJFYKVZwuA1gLWfWBPa2VQPeLQtc6fPaL3JV+t4c9S1s4rl9GmUoc/F2i7
 gqBcQp95CcbiOOzOiUvNkikvufCZi0GLhVfe7aUYUHHgO/tZSkfpgD1DEKx09qLmuft7
 MupAB43dKmq/9f1vDzp7NVuk9iPTahoB/4sDfRkkCaEq5I9h/tGMrsHt4+kX7fRYUqUK
 N29uLufF8WIcO0eUGo7A+DkoXhfar3ZkhiFOy/2AsezAI+y+43+C3pbr33v3lfCH9CCS
 Vghw==
X-Gm-Message-State: APjAAAWpUdFcydkVJgrZcCZL0/QpUD8uR7tEDCiuDWeWB9zsF3KoPrQV
 OBcOov5kkMOLfNXBtzTiqP0kQMQb3j0=
X-Google-Smtp-Source: APXvYqy841jwI5qjGUa9heu0D0meMFvbvHgmWk1Lnk9nvco2ItKS9GpK8dfixw1F7wMvQbN44c1u+A==
X-Received: by 2002:adf:f846:: with SMTP id d6mr410654wrq.125.1582749272305;
 Wed, 26 Feb 2020 12:34:32 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F275300BB8A7FF1D96B1B54.dip0.t-ipconnect.de.
 [2003:c5:8f27:5300:bb8a:7ff1:d96b:1b54])
 by smtp.gmail.com with ESMTPSA id d76sm4406191wmd.39.2020.02.26.12.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 12:34:31 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [RFC PATCH 0/3] cleanup compute queue priority setting
Date: Wed, 26 Feb 2020 21:37:27 +0100
Message-Id: <20200226203730.4621-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
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
Cc: alexander.deucher@amd.com, Ray.Huang@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is my initial idea which sets half compute queues to normal priority and
other half to high priority. I am reusing existing set_priority codes
here.

My understanding of gfx_v*_0_pipe_reserve_resources is very low so I am
probably doing some mistake at init_priority()

Nirmoy Das (3):
  drm/amdgpu: implement ring init_priority for compute ring
  drm/amdgpu: change hw sched list on ctx priority override
  drm/amdgpu: remove unused functions

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  4 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c  | 57 ++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h  |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  6 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 74 ++----------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |  5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c    | 14 +++++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c    | 13 +++++
 8 files changed, 86 insertions(+), 89 deletions(-)

--
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D6D9A00F
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 21:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6E86EA84;
	Thu, 22 Aug 2019 19:31:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207BF6EA5F
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 19:31:02 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x4so9011653qts.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hBJw9RacZpyZ1Nz2E2B5Ic/dJqlth6Zu81ciRg0g9ng=;
 b=O4aKZvtwoc8yJ/AxZn/TFaWchpUxDh2Jz48LZ24z+fcwHx22ay5hTcV5bvwlV0ECsL
 SoD2k4s2mxcurvf+LzR+qm9bIfovcruSC8vRTlFNhwtkRu+BR8pfztLjlEe3Nyo92wY8
 /WmPeY7u0aBuGJ+fbFr96XgUztvKC1kJ2qsgYr2JaMR5s0izvdd+n6mLLGjrmKJ26EkB
 VhzHNuTE/DEtMZd4JdhCa0My++hGZyR/nVZk9/+GdBrTm5klZ4qCy15xhTicbZExHJ5B
 YlzOlLPNGqVTlwj/mUoYL+UrSKABzMkyPd/TSe1WhWiFMq05aGXJfEjD+AoGmKB6Eo5j
 XLfA==
X-Gm-Message-State: APjAAAVoKnve76iOJ92JmwtQcYY+0EvXszQsUD+7yKwTAC9Hhy7o59Qv
 s9cMHgiDiAhvXwOMSbCHiZ3XIDZU
X-Google-Smtp-Source: APXvYqxY2Wnmu/+JVQIlNz5zhyDEpvUfNwABZuaozaw8A5XkyXjzXwFS6dyZSwQ09oezEPKKItqXBw==
X-Received: by 2002:ad4:4a14:: with SMTP id m20mr991785qvz.58.1566502260805;
 Thu, 22 Aug 2019 12:31:00 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id h1sm337140qkh.101.2019.08.22.12.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 12:31:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] Support mclk switching when monitors are in sync (v2)
Date: Thu, 22 Aug 2019 14:30:46 -0500
Message-Id: <20190822193050.3107-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hBJw9RacZpyZ1Nz2E2B5Ic/dJqlth6Zu81ciRg0g9ng=;
 b=Qv8/H2cRBoNbKLHBW8TLww9WqVQ3rO1HfpTIaK+QOgTJT5iF9WwKCAgkN9RccWriGm
 ZF2c2ynz/VQh9I2oOScZFxfMhUVrem4kh9vXf4PfX1HK109GuySczzf4EHMFZMNqjMQ3
 m9WBBvPqERGSxfMTV9wjS4B3n0oU8/kIvj9OYQlWCTBmEq166/0+Gylra2Qem613t26u
 wJrfZh2R7iLaIuVK6ca06lHy0ennHTbrpYzbbKFF/gDIQ3qcrU8y+VirdyvF/ODHizI0
 ktmgbH0P3qVIqA/Lvukfjq0aHSE4lPNoM1VsqRJT2s8zhbNLvnihrJp44calopxqFPlP
 VOFA==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXQgZW5hYmxlcyBtY2xrIHN3aXRjaGluZyB3aXRoIG11bHRpcGxlIG1vbml0
b3JzIHdoZW4gYWxsCm1vbml0b3JzIGFyZSBzeW5jLiAgTm9ybWFsbHkgbWNsayBzd2l0Y2hpbmcg
aXMgbm90IGF2YWlsYWJsZSB3aXRoCm11bHRpcGxlIG1vbml0b3JzIGJlY2F1c2UgdGhlIHZibGFu
ayB0aW1pbmcgZG9lcyBub3QgbGluZSB1cC4gIEhvd2V2ZXIsCmlmIHRoZSB0aW1pbmcgaXMgaWRl
bnRpY2FsLCB0aGUgZGlzcGxheSBkcml2ZXIgY2FuIHN5bmMgdXAgdGhlIGRpc3BsYXlzCmluIHNv
bWUgY2FzZXMuICBDaGVjayBmb3IgdGhlc2UgY2FzZXMgYW5kIGFsbG93IG1jbGsgc3dpdGNoIHdo
ZW4KcG9zc2libGUuCgpBbGV4IERldWNoZXIgKDQpOgogIGRybS9hbWRncHUvcG93ZXJwbGF5L3Nt
dTc6IGVuYWJsZSBtY2xrIHN3aXRjaGluZyBpZiBtb25pdG9ycyBhcmUKICAgIHN5bmNlZAogIGRy
bS9hbWRncHUvcG93ZXJwbGF5L3ZlZ2ExMDogZW5hYmxlIG1jbGsgc3dpdGNoaW5nIGlmIG1vbml0
b3JzIGFyZQogICAgc3luY2VkCiAgZHJtL2FtZC9kaXNwbGF5OiB1cGRhdGUgYndfY2FsY3MgdG8g
dGFrZSBwaXBlIHN5bmMgaW50byBhY2NvdW50ICh2MykKICBkcm0vYW1kZ3B1L2Rpc3BsYXk6IGFk
ZCBmbGFnIGZvciBtdWx0aS1kaXNwbGF5IG1jbGsgc3dpdGNoaW5nCgogLi4uL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgIDMgKysKIC4uLi9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jICB8IDMzICsrKysrKysrKysrKysrKysrLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oICAgICAgICAgICB8ICAyICstCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oICAgICAgfCAgMSArCiAuLi4vZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYyAgfCAgNyArKy0tCiAuLi4vZHJt
L2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMgICAgfCAgMyArLQogNiBmaWxlcyBj
aGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

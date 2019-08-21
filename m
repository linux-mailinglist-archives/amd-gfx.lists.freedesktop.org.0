Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252809872F
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14E56EA25;
	Wed, 21 Aug 2019 22:24:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1C36E3A2
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:35 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d23so3370218qko.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ZSOriH7OrH4PbU4KZld4xHEV/iI7lAOtyQILOWV9DY=;
 b=H/P0hKMZY0Kt5KQd1Mvh8uIVJMz1rsUtkBauc9pdBwXmkxONYbPmPSsF3Lypb3rWfT
 s4PFWOcOh3nBw3iDdPY8awpcZsNN6ZaTa/OEi05qZOO6KLcpvRSb6HKGvifb0ES0wkMr
 sVoo8PMS0AQr3vxTDyeU18PDOrK6URycUacVL3lPErI7XFSH8VDfJ9txrFZc6OACJB9G
 LyslAqGtLyZLZH2vCz0CtsNMvAkKL1j2NesXkSnQnaHwrLHmR9tJYI1DIwtuAyQbxAY4
 8ZFn0mKnDYhgMs626pGJxh3B6+eylBoOKVC6i+kbdcFwCZ6PfRKmSAglc6ajvnCc+nMi
 PZ+w==
X-Gm-Message-State: APjAAAU8aPhiNhmr2/Yfqf+T2Wi+UFMWZ+ZGheRwNIGdZkwDk6r5f6Tz
 UAsFhZQNKjz1kataVf7ViRPrbryj
X-Google-Smtp-Source: APXvYqzhoQO4W74W5y6fphstCyxEXRsAAbeEbDwYoZ1SgYmNn5zAUiUwOFpoEudO2eL4922W7dnh/Q==
X-Received: by 2002:ae9:ef0b:: with SMTP id d11mr32797968qkg.295.1566426274206; 
 Wed, 21 Aug 2019 15:24:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 26/37] drm/amdgpu: enable IH clock gating for rn
Date: Wed, 21 Aug 2019 17:23:48 -0500
Message-Id: <20190821222359.13578-27-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ZSOriH7OrH4PbU4KZld4xHEV/iI7lAOtyQILOWV9DY=;
 b=ID9yglMfoe9+v/y/eGMbetmotJMtclhPZ5nqLGP22e6ioZMbo5OPnRutcElFq/H8NL
 osxY1bFMbNXGPxwx+4cJ6GKxzoVjihW4enEHwW/AsJELhIkJsve1qeEgqevt5yawEsNw
 76LxYG91nd2xRmB2urTByE3iKnVJjpk4VoYGo0jbRtXgYbKDOlTT2Es4ja3v46N1UVKe
 jOFHF3kfyXvVzgXuZUhUSX4xrQ2hBOumjByL+PVDl78a3iiwisYeNe6lZfWndZ3okKE8
 Er9UOzlpYQMjYczuswB+gi3pEnxJbmGMQNINElu1XvesLVkQbYl+LYThlRz4hij8VOpC
 mGJw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpFbmFibGUgSUggY2xvY2sg
Z2F0aW5nIGR1cmluZyBJSCBibG9jayBpbml0aWFsaXplZC4KClNpZ25lZC1vZmYtYnk6IFByaWtl
IExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c29jMTUuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggM2I5MmRhNGZmNjljLi44
MWRkMWFjNjA4NmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtMTE2OCw3ICsx
MTY4LDggQEAgc3RhdGljIGludCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUp
CiAJCQkJIEFNRF9DR19TVVBQT1JUX0JJRl9MUyB8CiAJCQkJIEFNRF9DR19TVVBQT1JUX0hEUF9M
UyB8CiAJCQkJIEFNRF9DR19TVVBQT1JUX1JPTV9NR0NHIHwKLQkJCQkgQU1EX0NHX1NVUFBPUlRf
VkNOX01HQ0c7CisJCQkJIEFNRF9DR19TVVBQT1JUX1ZDTl9NR0NHIHwKKwkJCQkgQU1EX0NHX1NV
UFBPUlRfSUhfQ0c7CiAJCWFkZXYtPnBnX2ZsYWdzID0gMDsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2
X2lkID0gYWRldi0+cmV2X2lkICsgMHg5MTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A4498737
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7D089823;
	Wed, 21 Aug 2019 22:24:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8FC896E4
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:30 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id v38so5154675qtb.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xb9EMXqO8I2on7avM9g7Z4zjbbEWnd4NJik+rLFoLcc=;
 b=Z8+qmsptVOccJLoByFEIndaOLR0+viK3MlPYEpU8bKvS/y6KCRAgRQT+SRweRE8/19
 Ny1uebLnBG1JMkBRyNT8/AuhA754GI856YEmHLu351C697jnRpuwgNFBmkCO330hUO52
 ryOtM1755sj/33CN0N4ZP6ttB4NiGYPlcoOPhZ/3YZRnEBT5ggw7HIoraa3XBBFml3BY
 rNcBetApLXQ8ob7BMtmrhh7bYNoEG5pC3/mz8MWNc5vef3oyciZzhS0ND51wG08wK0l6
 oo5tAad5t1hqWt4hqODMzXyIFhSAwZeT2/nyT4QuBwXoDYxCCQYzrWjY7uvU2QxMb6+3
 +QcQ==
X-Gm-Message-State: APjAAAWjIkrIM+p3mcSl689lgS19CWHIC/OTtIL6VsUolkc42jMfaM/D
 xbTRbmAZXOIKIfwVTvE3EroqHJtT
X-Google-Smtp-Source: APXvYqzk1p0k5qdLalbQNk3H+irfNxWU4XNtizw3MQXIIbHEm4hLi4AJ5tzzASFTXpfcNMB5RAD0og==
X-Received: by 2002:ac8:748a:: with SMTP id v10mr33257934qtq.386.1566426269375; 
 Wed, 21 Aug 2019 15:24:29 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 20/37] drm/amdgpu: enable mmhub clock gating for rn
Date: Wed, 21 Aug 2019 17:23:42 -0500
Message-Id: <20190821222359.13578-21-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xb9EMXqO8I2on7avM9g7Z4zjbbEWnd4NJik+rLFoLcc=;
 b=iNYsXdbuOCMHqPdMSpAPxmXD41I6Pyt1+48gHGzFb7fGr7pbZxogYWAw49ejRCfrsY
 hKI8azriqsoWyziwfYOFFBwvXC2BU7Yu11MaMZZR1bvVSHYIO8iHrZhpoMLuBA+Alm/B
 i3cicaLNkEyruJz74MOcZRTL7DADJqWCgiivp6110jCmMt3WEk/DN0BDYkoAuFvFBRZB
 HsqiJRQZtXyfoB/vfJoKSFqnXAKQz7OsZaCZDBJxEQ+VwZn7MtgGHb7ACcNsc9+IDR3e
 X4/naYsRtaoHxhIF1Xa5bS8OLtUfXH9qpP7Vop55M1Ho2HN4AwACRjT4YH6QFFZUxCzV
 bB/A==
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

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpFbmFibGUgbW1odWIgbWlk
bGUgZ3JhaW4gYW5kIGxpZ2h0IHNsZWVwIGNsb2NrIGdhdGluZy4KClNpZ25lZC1vZmYtYnk6IFBy
aWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IGQ0Y2I3YTY2MDI0
ZS4uN2E3MTAwYTVkYzFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTExNjAs
NyArMTE2MCw5IEBAIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFu
ZGxlKQogCQkJCSBBTURfQ0dfU1VQUE9SVF9HRlhfM0RfQ0dMUyB8CiAJCQkJIEFNRF9DR19TVVBQ
T1JUX0dGWF9DR0NHIHwKIAkJCQkgQU1EX0NHX1NVUFBPUlRfR0ZYX0NHTFMgfAotCQkJCSBBTURf
Q0dfU1VQUE9SVF9HRlhfQ1BfTFM7CisJCQkJIEFNRF9DR19TVVBQT1JUX0dGWF9DUF9MUyB8CisJ
CQkJIEFNRF9DR19TVVBQT1JUX01DX01HQ0cgfAorCQkJCSBBTURfQ0dfU1VQUE9SVF9NQ19MUzsK
IAkJYWRldi0+cGdfZmxhZ3MgPSAwOwogCQlhZGV2LT5leHRlcm5hbF9yZXZfaWQgPSBhZGV2LT5y
ZXZfaWQgKyAweDkxOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==

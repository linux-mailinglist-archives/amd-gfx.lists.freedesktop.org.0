Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E103B87E9B
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AC66EE45;
	Fri,  9 Aug 2019 15:53:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534246EE48
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:26 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id y26so96273679qto.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nv4+7t5WHt1ahIfMExj0fOofqiI+K0Xgo4QUHjJYcrY=;
 b=pzQubQ4uZjyIlIF+kxrLOBhtYMszbzre2N5AW47aY+r9nwPsm7W/G9WUdWW4OVmtPZ
 u21JU28ouwdk0aaAa05H+QyUvxXU6qAE62ATCZgpA9jV9fe4ll7YVWA6RR8+8GTZhTkC
 Hz19/byFal62j7w879DGXNuo1sF5TRbqnTp+qk0jGgkRf9Y3ViJhWyHV3iSR53gYnLN0
 /zq8dxrv3OG+o4pbnAZZijt94hmtnIjvELtrumK1otB4/9zX6/ne/Gbe1dd05gfTk6aC
 1+eUpRbLFy4h1lLO6v1BCM8qPkxPe/LhAGxnH7yKgUIRoW9DR+6EluAcGu3wNHZfQWox
 BRMQ==
X-Gm-Message-State: APjAAAV4rq+M1/9OAcWM14QvB+GpcjIh42Yzni5FzyfkbTk4JfL4ijIy
 W+RUHq8Fp52W/uYNqtNU3ONrPxgc
X-Google-Smtp-Source: APXvYqyp1vxUb3kzHNavxvvt7FPcZoe3Lr4FHTVtQ/a5VP2+XEN++6/NDqdHqX3vv6TqtLCsiSOTOg==
X-Received: by 2002:ad4:498d:: with SMTP id t13mr1765206qvx.60.1565366004955; 
 Fri, 09 Aug 2019 08:53:24 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 17/27] drm/amdgpu: add sdma golden settings for renoir
Date: Fri,  9 Aug 2019 10:52:52 -0500
Message-Id: <20190809155302.4733-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nv4+7t5WHt1ahIfMExj0fOofqiI+K0Xgo4QUHjJYcrY=;
 b=L/nFMFNnoNtDBXca+gpcW4f/P4IYNNAurH++LOQFdlNDT9q8kvLLPY0pyVcRqVgTAO
 Shl2pLIZAt9yIPSrtMuHWJoThCzxpYtbBNHnXzPQbeorlO4HdBOsGq052gwPd1zo6Qn7
 gbQpjIw0sdXLCVd2qTC46PtOhfwxruuZUvh/s9rGNxZxDNR165Xfyz6oQ2S8Wr4SW1k6
 qMf92PF2uQZ9dmSzfU8tFDErC4UpbzpwJTNDX9EdyyENxsADHG0DtEa8iBWVbIjGtDp/
 ol+adacPPK3qeXQTHA4qMQOG37VvV1W68ltlBWpy4rCNPjj1cIeeKs2tDBuqk4O/bUdw
 aJGw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggYWRkcyBzZG1h
IGdvbGRlbiBzZXR0aW5ncyBmb3IgcmVub2lyIGFzaWMuCgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBS
dWkgPHJheS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2Rt
YV92NF8wLmMgfCAxNyArKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCmluZGV4IGVmMzBm
ODc3NDc3ZS4uNDI4ZjM3YTI1Yzg3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zZG1hX3Y0XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0
XzAuYwpAQCAtMjQxLDYgKzI0MSwxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19n
b2xkZW4gZ29sZGVuX3NldHRpbmdzX3NkbWFfYXJjdFtdID0KIAlTT0MxNV9SRUdfR09MREVOX1ZB
TFVFKFNETUE3LCAwLCBtbVNETUE3X0dCX0FERFJfQ09ORklHX1JFQUQsIDB4MDAwMDc3M2YsIDB4
MDAwMDQwMDIpCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29s
ZGVuX3NldHRpbmdzX3NkbWFfNF8zW10gPSB7CisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShTRE1B
MCwgMCwgbW1TRE1BMF9DSElDS0VOX0JJVFMsIDB4ZmU5MzFmMDcsIDB4MDI4MzFmMDcpLAorCVNP
QzE1X1JFR19HT0xERU5fVkFMVUUoU0RNQTAsIDAsIG1tU0RNQTBfQ0xLX0NUUkwsIDB4ZmZmZmZm
ZmYsIDB4M2YwMDAxMDApLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoU0RNQTAsIDAsIG1tU0RN
QTBfR0JfQUREUl9DT05GSUcsIDB4MDAxODc3M2YsIDB4MDAwMDMwMDIpLAorCVNPQzE1X1JFR19H
T0xERU5fVkFMVUUoU0RNQTAsIDAsIG1tU0RNQTBfR0JfQUREUl9DT05GSUdfUkVBRCwgMHgwMDE4
NzczZiwgMHgwMDAwMzAwMiksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShTRE1BMCwgMCwgbW1T
RE1BMF9HRlhfUkJfV1BUUl9QT0xMX0NOVEwsIDB4ZmZmZmZmZjcsIDB4MDA0MDMwMDApLAorCVNP
QzE1X1JFR19HT0xERU5fVkFMVUUoU0RNQTAsIDAsIG1tU0RNQTBfUE9XRVJfQ05UTCwgMHgwMDNm
ZmYwNywgMHg0MDAwMDA1MSksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShTRE1BMCwgMCwgbW1T
RE1BMF9STEMwX1JCX1dQVFJfUE9MTF9DTlRMLCAweGZmZmZmZmY3LCAweDAwNDAzMDAwKSwKKwlT
T0MxNV9SRUdfR09MREVOX1ZBTFVFKFNETUEwLCAwLCBtbVNETUEwX1JMQzFfUkJfV1BUUl9QT0xM
X0NOVEwsIDB4ZmZmZmZmZjcsIDB4MDA0MDMwMDApLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUo
U0RNQTAsIDAsIG1tU0RNQTBfVVRDTDFfUEFHRSwgMHgwMDAwMDNmZiwgMHgwMDAwMDNjMCksCit9
OworCiBzdGF0aWMgdTMyIHNkbWFfdjRfMF9nZXRfcmVnX29mZnNldChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAkJdTMyIGluc3RhbmNlLCB1MzIgb2Zmc2V0KQogewpAQCAtMzY1LDYgKzM3
NywxMSBAQCBzdGF0aWMgdm9pZCBzZG1hX3Y0XzBfaW5pdF9nb2xkZW5fcmVnaXN0ZXJzKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJCQkJCWdvbGRlbl9zZXR0aW5nc19zZG1hX3J2MSwK
IAkJCQkJCQlBUlJBWV9TSVpFKGdvbGRlbl9zZXR0aW5nc19zZG1hX3J2MSkpOwogCQlicmVhazsK
KwljYXNlIENISVBfUkVOT0lSOgorCQlzb2MxNV9wcm9ncmFtX3JlZ2lzdGVyX3NlcXVlbmNlKGFk
ZXYsCisJCQkJCQlnb2xkZW5fc2V0dGluZ3Nfc2RtYV80XzMsCisJCQkJCQlBUlJBWV9TSVpFKGdv
bGRlbl9zZXR0aW5nc19zZG1hXzRfMykpOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlicmVhazsK
IAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

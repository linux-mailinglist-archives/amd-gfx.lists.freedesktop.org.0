Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C01771ED
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 21:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB70C6EE3C;
	Fri, 26 Jul 2019 19:16:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230A56EE3B
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 19:16:25 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id l9so53651774qtu.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 12:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CREzCzXOAFxKJhLU/UJrjni6bPQ6l/uSYif5qoOpm4I=;
 b=EdG85FuTr8eX3fS0oaUpMRtWIdQoTqGk2g0DRUH/QJWYBVlg/9Lu818zM+XaXg7wLP
 NFoWIszd84N7o5uyp58JgrL5gdhAsWcTAaKrNUFfyJ0WmDWMZfy3LuZFeiK8kTqMgCx0
 KV9s/VQYdt9z4pPnCt0XdX9htzyFehDWNvDcFZXmtzSz67toPSHpUu6CvdI49LW9Tvnb
 8kauTVbYt699wfWZbVW+EBokh5q5uEfjBdzsRXI7YVPjvJfMZd38PLQscXKXyVLM/G21
 3Ut6cUK6zt0M7WR/djAJL+Gqh/QhwQKnKsFm/svcL3n/stZpVFbz9wX/O8uf/LHHBfBx
 q02A==
X-Gm-Message-State: APjAAAXBPkfqwAwpDOFNWoRxjNNy2fHxdTJSfZbjj1KnG5ifCRIUHOKz
 pCxTuXsypnRNOUfXIGuiiHak7D65
X-Google-Smtp-Source: APXvYqxZqyDdtVDtCJwgPZzjcydDjcc//m95LWagvdoJR9cWdee2LeZZYEZWC83K83u1RA9XB1HPlg==
X-Received: by 2002:a0c:b115:: with SMTP id q21mr69772514qvc.68.1564168583883; 
 Fri, 26 Jul 2019 12:16:23 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id r14sm25836243qke.47.2019.07.26.12.16.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 12:16:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu/gfx10: update golden settings for navi14
Date: Fri, 26 Jul 2019 14:16:14 -0500
Message-Id: <20190726191615.20351-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CREzCzXOAFxKJhLU/UJrjni6bPQ6l/uSYif5qoOpm4I=;
 b=dodscBjymZmKUHayZ8IEe+FpDj8wV0Aqv3MuizVrYUZd97DAfXOAYtbuQ+dRPVQmBQ
 9AszjpZ56ABzuHvcp1XFdJ4KivIQ148u+wxrsyp2y+ncL8I2+oZJuMp9WUpS5/q6mRDY
 AzjwXz9t+h6X35ucHiGYjM0lXbvj0nel7keVfVRZj+GBHFodPtr8NxkdcHjeg3SCPUY/
 l7y2l9XHfeugz3AtsNUs5Tw6uZsilsasOwmRCKdbQpDsZ+zmjBGXzbZLWT8ut8U7Aecq
 iZXhMZJaYm957jo6pySfxt/NWMqoOCf2aoaWFRlz/PEINDAxRo+mEXB8614LHBjmyWsq
 On1A==
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

VXBkYXRlZCBzZXR0aW5ncyBmb3IgaHcgdGVhbS4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjEwXzAuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4IDYxNjI3MDNlMjBkMi4uOGU3
ZTYyNDkyYmZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEw
XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwpAQCAtMTM4
LDcgKzEzOCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5f
c2V0dGluZ3NfZ2NfMTBfMV8xW10gPQogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1t
REJfREVCVUc0LCAweGZmZmZmZmZmLCAweDA0OTAwMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZB
TFVFKEdDLCAwLCBtbURCX0RGU01fVElMRVNfSU5fRkxJR0hULCAweDAwMDBmZmZmLCAweDAwMDAw
MDNmKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbURCX0xBU1RfT0ZfQlVSU1Rf
Q09ORklHLCAweGZmZmZmZmZmLCAweDAzODYwMjA0KSwKLQlTT0MxNV9SRUdfR09MREVOX1ZBTFVF
KEdDLCAwLCBtbUdCX0FERFJfQ09ORklHLCAweDBjMTgwMGZmLCAweDAwMDAwMDQzKSwKIAlTT0Mx
NV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUdDUl9HRU5FUkFMX0NOVEwsIDB4MWZmMGZmZmYs
IDB4MDAwMDA1MDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tR0VfUFJJVl9D
T05UUk9MLCAweDAwMDAwN2ZmLCAweDAwMDAwMWZlKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVF
KEdDLCAwLCBtbUdMMV9QSVBFX1NURUVSLCAweGZmZmZmZmZmLCAweGU0ZTRlNGU0KSwKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

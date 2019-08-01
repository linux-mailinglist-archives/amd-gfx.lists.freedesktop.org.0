Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 216587E432
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA49E6E7F3;
	Thu,  1 Aug 2019 20:30:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76E86E7E3
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:27 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d23so71710136qto.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fa21KTFkbtUYrDb0kEoRpAOkWmeTC39CwVf/3KTevCY=;
 b=IQBbvwsJpdxuj/1ZuY0nhZJV0b0GKfERVPAiO2xfL0f4CIwislWwEckBtLyh/1bA/7
 r25yP6pdSP4DDc2EuGkTNdy4tWwtyRFBulY1mU/8XLNWQMb+I5kO6kjsJNkBqnEPJQMw
 txxLWnkTQ7Sy0ILGTffurZe51JKBxHN2HNUb3x6hFdFR4pvjNUmeSTiBstC34cfmNhQz
 hT1wthxu4wZOuQMs87h6unGWHDkC8C1cEqcaG7AsG5aZXagFo6hq8TfU4DARB2wQRGe3
 DECy/N4hNknxsrbStvgZz0qXgG1kVkB+W04Jz2zdul14e3voIcrsVj3sIGSb5ktu5SR9
 nssw==
X-Gm-Message-State: APjAAAXZ60ijXgw75ZR9Vgc073CDzswjox/QWawobnKIwze+1/otexQg
 F7ZRYyoa5FiV3Z0ltAv+9V9Y0Alz
X-Google-Smtp-Source: APXvYqyzpzvrnFYm1n95Fp8x5wYD/baoPdn582mg8sMpNYUjUDwvEOFfui5Wg2j2u9fyHQOE3Wxu9g==
X-Received: by 2002:ac8:18fa:: with SMTP id o55mr93642902qtk.275.1564691426780; 
 Thu, 01 Aug 2019 13:30:26 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 24/36] drm/amdgpu: correct smu rlc handshake enablement bit
Date: Thu,  1 Aug 2019 15:29:45 -0500
Message-Id: <20190801202957.29791-25-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fa21KTFkbtUYrDb0kEoRpAOkWmeTC39CwVf/3KTevCY=;
 b=ou/eeAGlSicwjMN/vnyuy6Sw/D5iRQLJGxkPNcbRk/qInTU3l9NyZ0v1Or9dmoO6Ft
 paYotUO4wTnlVmZ8j1vRWbGI92gBKbdFYuySP8UpSnALhV1yxsBtKLJ8IIac9d6IN+cR
 HGoTpFDxW07peguhTBrn04WsvV/QPkOV5Agy4q2U7PcVqzWGsJeZOgVzOIk9Jtcml0oU
 Lbrf6exPDEW+OzFBKGzBfk7R3dqEiaTxh8HOIBqrwaCxMHd5KC4GxnQpy/eah57xihNZ
 rt46jXu/d1vMAJEYXheH6tOb2LjqBWoZnUis4qcrjyIPm7hV2wuxOUXhrR5KG5TpVEHQ
 j7yw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkNvcnJlY3QgdGhlIGVuYWJsZW1l
bnQgYml0IG9mIFNNVSBSTEMgaGFuZHNoYWtlLgoKU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxK
YWNrLlhpYW9AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5j
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKaW5kZXggNzdmZDMzY2YwNzI1
Li4yNmQ5MGIzMjNiNTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCkBA
IC0xNzc1LDkgKzE3NzUsOSBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfcmxjX3NtdV9oYW5kc2hh
a2VfY250bChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJICogaGVuY2Ugbm8gaGFuZHNo
YWtlIGJldHdlZW4gU01VICYgUkxDCiAJCSAqIEdGWE9GRiB3aWxsIGJlIGRpc2FibGVkCiAJCSAq
LwotCQlybGNfcGdfY250bCB8PSAweDgwMDAwOworCQlybGNfcGdfY250bCB8PSAweDgwMDAwMDsK
IAl9IGVsc2UKLQkJcmxjX3BnX2NudGwgJj0gfjB4ODAwMDA7CisJCXJsY19wZ19jbnRsICY9IH4w
eDgwMDAwMDsKIAlXUkVHMzJfU09DMTUoR0MsIDAsIG1tUkxDX1BHX0NOVEwsIHJsY19wZ19jbnRs
KTsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=

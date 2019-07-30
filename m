Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAEE7A3DB
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 11:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B556E454;
	Tue, 30 Jul 2019 09:18:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7116E454
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 09:18:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y4so64931866wrm.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 02:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2fxCOl4wjqzbwS+5YoragOMWGfWr01wwNTcZXjcWJhE=;
 b=TU8bOFktymXpY459fVNtIPvLHszxxG5DurWHL9gzBt0yGBPeFOBX1SswMgxFGn4hov
 xC3g8ytwzkud5hhvAWw2ZtDXnV0d+4AYfAwMy63/TBdQPdFUTXcM/ZCjgbhAwUW4MbhH
 ZyTqiEfQzuWm/XYYzQKy7gZ+Y6PF5r5dNnwMV3N/Qtnf2+P8W2TFxBWf4IHxFPMoPAGk
 FmCtmES0kghEnzkqlHt91zcDtQ4uL9AO331xWlKr/v1U1wMVdu1bp/o6x0wIX4HT90iX
 jgv1MjrRKzfsAmRV3izHzTVtPsgaIUlnTBK/+KKqqnFWm26EwIpEmIuoOCrDVpWpcYzo
 QSsQ==
X-Gm-Message-State: APjAAAWUOvNqBtJ6crYR0MjKkTMpwTxWKZ8z1E6YQJIDOiW5OEw2HGRM
 6O9rspCct63kRjGHJ5jdLZw5OHs/
X-Google-Smtp-Source: APXvYqxT2BRYVMWXUh+BmyPMg4GLdYos5IcSxDPwZX47EToYBUdAgNkhy0vBRyIQovEbnovRsjmuGA==
X-Received: by 2002:a5d:670b:: with SMTP id o11mr6766706wru.311.1564478296152; 
 Tue, 30 Jul 2019 02:18:16 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:30e2:d562:3041:c580])
 by smtp.gmail.com with ESMTPSA id h14sm62411286wrs.66.2019.07.30.02.18.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 02:18:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix error handling in amdgpu_cs_process_fence_dep
Date: Tue, 30 Jul 2019 11:18:14 +0200
Message-Id: <20190730091814.77974-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2fxCOl4wjqzbwS+5YoragOMWGfWr01wwNTcZXjcWJhE=;
 b=pT6Im/NQryvcODitDq+e+q3ehX4/c5/MT46Gjz04uHBJp+nZG1DsbXOSTnGmSltBtD
 hBrpLm5PJTEY7LE0+fvAye5dASHYguWwYt14ayOqcxP5P+CCMG7rZACQmelADNxDbEe5
 +ubedGiV2/xa9mwHA9A3GIlPd91ROCkskdhibaRUBabDdlLfJ+Fioz0V80Ndb+DXvGeI
 HmEVtgaoGhWv2PI3ZDu25jr0HWaj7R5SfQt2Ypm2+puOq/J8FzhZ/3siJ3rk+huotS1s
 CByiwJHT/rPqPDyp5CJPMBazv26l5G2te45N4uxsTfrSL+Yc9rrlRYU5MpJAWEXSEPNU
 IL/w==
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
Cc: David1.Zhou@amd.com, teroincn@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgYWx3YXlzIG5lZWQgdG8gZHJvcCB0aGUgY3R4IHJlZmVyZW5jZSBhbmQgc2hvdWxkIGNoZWNr
CmZvciBlcnJvcnMgZmlyc3QgYW5kIHRoZW4gZGVyZWZlcmVuY2UgdGhlIGZlbmNlIHBvaW50ZXIu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgfCAyNiArKysr
KysrKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9jcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKaW5k
ZXggYzY5MWRmNmY3YTU3Li5kZWYwMjlhYjU2NTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9jcy5jCkBAIC0xMDQyLDI5ICsxMDQyLDI3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Nz
X3Byb2Nlc3NfZmVuY2VfZGVwKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAogCQkJcmV0dXJu
IHI7CiAJCX0KIAotCQlmZW5jZSA9IGFtZGdwdV9jdHhfZ2V0X2ZlbmNlKGN0eCwgZW50aXR5LAot
CQkJCQkgICAgIGRlcHNbaV0uaGFuZGxlKTsKKwkJZmVuY2UgPSBhbWRncHVfY3R4X2dldF9mZW5j
ZShjdHgsIGVudGl0eSwgZGVwc1tpXS5oYW5kbGUpOworCQlhbWRncHVfY3R4X3B1dChjdHgpOwor
CisJCWlmIChJU19FUlIoZmVuY2UpKQorCQkJcmV0dXJuIFBUUl9FUlIoZmVuY2UpOworCQllbHNl
IGlmICghZmVuY2UpCisJCQljb250aW51ZTsKIAogCQlpZiAoY2h1bmstPmNodW5rX2lkID09IEFN
REdQVV9DSFVOS19JRF9TQ0hFRFVMRURfREVQRU5ERU5DSUVTKSB7Ci0JCQlzdHJ1Y3QgZHJtX3Nj
aGVkX2ZlbmNlICpzX2ZlbmNlID0gdG9fZHJtX3NjaGVkX2ZlbmNlKGZlbmNlKTsKKwkJCXN0cnVj
dCBkcm1fc2NoZWRfZmVuY2UgKnNfZmVuY2U7CiAJCQlzdHJ1Y3QgZG1hX2ZlbmNlICpvbGQgPSBm
ZW5jZTsKIAorCQkJc19mZW5jZSA9IHRvX2RybV9zY2hlZF9mZW5jZShmZW5jZSk7CiAJCQlmZW5j
ZSA9IGRtYV9mZW5jZV9nZXQoJnNfZmVuY2UtPnNjaGVkdWxlZCk7CiAJCQlkbWFfZmVuY2VfcHV0
KG9sZCk7CiAJCX0KIAotCQlpZiAoSVNfRVJSKGZlbmNlKSkgewotCQkJciA9IFBUUl9FUlIoZmVu
Y2UpOwotCQkJYW1kZ3B1X2N0eF9wdXQoY3R4KTsKKwkJciA9IGFtZGdwdV9zeW5jX2ZlbmNlKHAt
PmFkZXYsICZwLT5qb2ItPnN5bmMsIGZlbmNlLCB0cnVlKTsKKwkJZG1hX2ZlbmNlX3B1dChmZW5j
ZSk7CisJCWlmIChyKQogCQkJcmV0dXJuIHI7Ci0JCX0gZWxzZSBpZiAoZmVuY2UpIHsKLQkJCXIg
PSBhbWRncHVfc3luY19mZW5jZShwLT5hZGV2LCAmcC0+am9iLT5zeW5jLCBmZW5jZSwKLQkJCQkJ
dHJ1ZSk7Ci0JCQlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKLQkJCWFtZGdwdV9jdHhfcHV0KGN0eCk7
Ci0JCQlpZiAocikKLQkJCQlyZXR1cm4gcjsKLQkJfQogCX0KIAlyZXR1cm4gMDsKIH0KLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

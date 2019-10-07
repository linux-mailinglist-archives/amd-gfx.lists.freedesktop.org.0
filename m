Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C6CE88B
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2019 18:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE636E140;
	Mon,  7 Oct 2019 16:03:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29AA6E140
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Oct 2019 16:03:06 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 4so13093488qki.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 07 Oct 2019 09:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+GmfzILfxIS4W8FX6GbomdoKUg6LoPcKNo8KP7Y4pk=;
 b=fFrNBVzntSCVPRyOPw1D1HwMJRzfrmLCXZW46r2KO88AfCEedhle0rjEc7T1YYlC0i
 IkHKtGGEKEFtuC2Hoyi/OIECq38QGqN+Wpnzaeb8JiIV26ApndkXOwNomzt9GU5klQGQ
 WeAz/tihv87SASHJAwt691N9ymtPnPgMgFdbwWeRZfLoe9k42UzurTpvsAGTJtayi4GJ
 P+meMyOHG/ulMBR2XCwET2IVo3V/ReTaZzgFzJIRGBQS5y9lmvauB/b/LT+ONb5NFDg5
 65bYWV+WY9MP4xVqtF+Ijw+UK4R/kmcfCtSI4iz5YaRy5EPbMLRadBKAUfnkDOtAOKFr
 N8Lg==
X-Gm-Message-State: APjAAAXj8sj2/zknCmOsk6CtOPdPzMZR8JJRbzYFoaxArnfk5gXYVPuo
 ffxLzQbqm1IOJFIRRhJUVChCLYln
X-Google-Smtp-Source: APXvYqy6W6/2IrZfr6oCRdDMbBldt3biEotIQ9STq2AnFJ+wRKII7jQ3ytKA//IM6e7UEtdd30qkAw==
X-Received: by 2002:a05:620a:147:: with SMTP id
 e7mr24127037qkn.227.1570464185516; 
 Mon, 07 Oct 2019 09:03:05 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id 207sm8961568qkh.33.2019.10.07.09.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 09:03:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: move pci_save_state into suspend path
Date: Mon,  7 Oct 2019 11:02:54 -0500
Message-Id: <20191007160255.24966-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+GmfzILfxIS4W8FX6GbomdoKUg6LoPcKNo8KP7Y4pk=;
 b=PaqLYNfQOaCttXxaHoKm8cDTSnvfRoJwuHpDydCWYAPl2tGwQEYeYGsRh6dtYycsML
 UnLFKRtbi7INutAhkVVvoW3tjkUgHqkVLvPk+mzg7yvuaoIntMor3ByqEHMSNJaK6p2h
 WIFKJI+7nAGy91I5NkE8yDrv92H5f/81fN4FKzpzoJuF+rgTEArlJd6NOAJkidrydtGJ
 ybFNWUzBJn+dQPoKBEYzYIyP3NLvKnegsMHTdqjbANWdUd3iIbKw87XvWB0nO5nuzj+l
 MCELTyQC3X/+U8i1w8+Wr6zk5VKJhjNgpgHkV7C4jN0QsIH7+9HD1XLuqDGRoXVsvgA0
 Mxqw==
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

Zm9yIGFtZGdwdV9kZXZpY2Vfc3VzcGVuZC4gIFRoaXMgZm9sbG93cyB0aGUgbG9naWMKaW4gdGhl
IHJlc3VtZSBwYXRoLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCBmMjUy
NzVhYmY0MDguLjliOWIxNTM2MDE5NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYwpAQCAtMzE2OCw4ICszMTY4LDggQEAgaW50IGFtZGdwdV9kZXZpY2Vfc3Vz
cGVuZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBib29sIHN1c3BlbmQsIGJvb2wgZmJjb24pCiAJ
ICovCiAJYW1kZ3B1X2JvX2V2aWN0X3ZyYW0oYWRldik7CiAKLQlwY2lfc2F2ZV9zdGF0ZShkZXYt
PnBkZXYpOwogCWlmIChzdXNwZW5kKSB7CisJCXBjaV9zYXZlX3N0YXRlKGRldi0+cGRldik7CiAJ
CS8qIFNodXQgZG93biB0aGUgZGV2aWNlICovCiAJCXBjaV9kaXNhYmxlX2RldmljZShkZXYtPnBk
ZXYpOwogCQlwY2lfc2V0X3Bvd2VyX3N0YXRlKGRldi0+cGRldiwgUENJX0QzaG90KTsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

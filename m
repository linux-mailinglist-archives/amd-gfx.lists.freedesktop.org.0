Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E133FB9804
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 21:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C476FDBA;
	Fri, 20 Sep 2019 19:49:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D616FDBB
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 19:49:15 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id y144so8488046qkb.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 12:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nnBB2zYf7iBF7H3wAL6C2HcBrBHWYJqBEGQLMYBJxWc=;
 b=e2rJwpA5i4ZtGi8am8UsASB2HaPcMYeuqtkP+hagXwoEK14RRWzWfn94Wwwld6qhwz
 EnYV906eb3H9stf0NXnhSgciu4GEhVR4q2fgSQvpKftK7lmPHgzbBinq9fNyZg9QmN+n
 jLYewnsNikXxp+uqvmnUN80cYHrLAo/uJjyNyl231fp+VMhqVw6SRUpbfurekllTSo1r
 6KshRp8Y4Q0vX4GQfOPg9vKD7IV5SejYo4jgx17SL0xd6vujSit0zDxHzSJsimxJ+ubU
 LKL8gEwz8+Q2erdoRvXgJnKN4YS4nuDzQnGa+QQ9RMujKcMTHph4cIiQWLy0NUswqCS3
 KaWA==
X-Gm-Message-State: APjAAAURlX52FEdsC7ZHy+K/btreIVD3wdpLi5sGtvIKk4wVPY3ZscQn
 MDojDb15oLWmE2kncBhC/g4j6E7U
X-Google-Smtp-Source: APXvYqy5TNBqYKV789V0KWKRwF7NUSP4EpwvHqGYWHQj8JF69kEDcBnyZNB7h2lj/WwsEfEdhrA/UQ==
X-Received: by 2002:ae9:c219:: with SMTP id j25mr3546735qkg.277.1569008954011; 
 Fri, 20 Sep 2019 12:49:14 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id b16sm1653351qtk.65.2019.09.20.12.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 12:49:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/atomfirmware: use proper index for querying vram
 type
Date: Fri, 20 Sep 2019 14:49:01 -0500
Message-Id: <20190920194901.15100-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nnBB2zYf7iBF7H3wAL6C2HcBrBHWYJqBEGQLMYBJxWc=;
 b=c6xLPrXOHT0qd4VrfVPHxT9Cbk9LKxExFLc/Fu0It8eM7iIeaD1yZk3wre/bltPUrF
 ntuMv9R/KVz4f149J2cxs17boJ+z+mEAhNpdw8CdqO4f2p6GA0rPQIG4xrluXYe9teF1
 Aoc2wWiTZV523xmfir+eTQMpIETBMtT/R14xs5jgnJbDiNRQVJBVWrfXRFUpWhiVU59M
 Q4/+hs515zs/5pbRranV+Zz88WXldAR9jO2HW7EPjoVYEUlwRwCINudbWxU585tbymBi
 Ux9Iqzax/0vdSf7jAocrMTlq7LFQh3v8osdaGB2nKlpVZtXbEFksusjw6NRxEL/2l3f/
 q6fg==
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

VGhlIGluZGV4IGlzIHN0b3JlZCBpbiBzY3JhdGNoIHJlZ2lzdGVyIDQgYWZ0ZXIgYXNpYyBpbml0
LiAgVXNlCnRoYXQgaW5kZXguICBObyBmdW5jdGlvbmFsIGNoYW5nZSBzaW5jZSBhbGwgYXNpY3Mg
aW4gYSBmYW1pbHkKdXNlIHRoZSBzYW1lIHR5cGUgb2YgdnJhbSAoRzUsIEc2LCBIQk0pIGFuZCB0
aGF0IGlzIGFsbCB3ZSB1c2UKYXQgdGhlIG1vbmVudCwgYnV0IGlmIHdlIGV2ZXIgbmVlZCB0byBx
dWVyeSBvdGhlciBpbmZvLCB3ZSB3aWxsCm5vdyBoYXZlIHRoZSBwcm9wZXIgaW5kZXguCgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0b21maXJtd2FyZS5jIHwgMTAgKysr
KysrKystLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWZpcm13
YXJlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWZpcm13YXJlLmMK
aW5kZXggZGFmNjg3NDI4Y2RiLi5hYWQ5YjM0MGYzYWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdG9tZmlybXdhcmUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWZpcm13YXJlLmMKQEAgLTIzMiw2ICsyMzIsNyBAQCBp
bnQgYW1kZ3B1X2F0b21maXJtd2FyZV9nZXRfdnJhbV90eXBlKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCXVuaW9uIHZyYW1faW5mbyAqdnJhbV9pbmZvOwogCXU4IGZyZXYsIGNyZXY7CiAJ
dTggbWVtX3R5cGU7CisJdTMyIHZyYW1faWR4OwogCiAJaWYgKGFkZXYtPmZsYWdzICYgQU1EX0lT
X0FQVSkKIAkJaW5kZXggPSBnZXRfaW5kZXhfaW50b19tYXN0ZXJfdGFibGUoYXRvbV9tYXN0ZXJf
bGlzdF9vZl9kYXRhX3RhYmxlc192Ml8xLApAQCAtMjU1LDEyICsyNTYsMTcgQEAgaW50IGFtZGdw
dV9hdG9tZmlybXdhcmVfZ2V0X3ZyYW1fdHlwZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAkJfSBlbHNlIHsKIAkJCXZyYW1faW5mbyA9ICh1bmlvbiB2cmFtX2luZm8gKikKIAkJCQkobW9k
ZV9pbmZvLT5hdG9tX2NvbnRleHQtPmJpb3MgKyBkYXRhX29mZnNldCk7CisJCQl2cmFtX2lkeCA9
IChSUkVHMzIoYWRldi0+Ymlvc19zY3JhdGNoX3JlZ19vZmZzZXQgKyA0KSAmIDB4MDBmZjAwMDAp
ID4+IDE2OwogCQkJc3dpdGNoIChjcmV2KSB7CiAJCQljYXNlIDM6Ci0JCQkJbWVtX3R5cGUgPSB2
cmFtX2luZm8tPnYyMy52cmFtX21vZHVsZVswXS5tZW1vcnlfdHlwZTsKKwkJCQlpZiAodnJhbV9p
ZHggPj0gdnJhbV9pbmZvLT52MjMudnJhbV9tb2R1bGVfbnVtKQorCQkJCQl2cmFtX2lkeCA9IDA7
CisJCQkJbWVtX3R5cGUgPSB2cmFtX2luZm8tPnYyMy52cmFtX21vZHVsZVt2cmFtX2lkeF0ubWVt
b3J5X3R5cGU7CiAJCQkJcmV0dXJuIGNvbnZlcnRfYXRvbV9tZW1fdHlwZV90b192cmFtX3R5cGUo
YWRldiwgbWVtX3R5cGUpOwogCQkJY2FzZSA0OgotCQkJCW1lbV90eXBlID0gdnJhbV9pbmZvLT52
MjQudnJhbV9tb2R1bGVbMF0ubWVtb3J5X3R5cGU7CisJCQkJaWYgKHZyYW1faWR4ID49IHZyYW1f
aW5mby0+djI0LnZyYW1fbW9kdWxlX251bSkKKwkJCQkJdnJhbV9pZHggPSAwOworCQkJCW1lbV90
eXBlID0gdnJhbV9pbmZvLT52MjQudnJhbV9tb2R1bGVbdnJhbV9pZHhdLm1lbW9yeV90eXBlOwog
CQkJCXJldHVybiBjb252ZXJ0X2F0b21fbWVtX3R5cGVfdG9fdnJhbV90eXBlKGFkZXYsIG1lbV90
eXBlKTsKIAkJCWRlZmF1bHQ6CiAJCQkJcmV0dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

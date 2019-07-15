Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DCD69E06
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA81589DDF;
	Mon, 15 Jul 2019 21:25:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5B089DDF
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:05 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w190so12866416qkc.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9VH3bys2S7QZy1K4Rhm7Jk+lppCsDMDm0oyflnSUOYw=;
 b=edHrLDa+Du2Lj2OqM3WO+Q8bcJ8xVcZTsM7lbfkuCOIEC7JgdDg6a1Y2C/IZM2MDkQ
 a+wc0g2EO32fNBxahlPIk/lgewtzEHYm51Fv+lAizjEXH0/OddH8op/2xhyT4KGcoDFR
 tA5Rer1FwHEEGLPRC2ngw/k40wxR6KZTzYMjh2MQDHouXgBypn32lIm0fTzs6Zu3P90X
 e/2tZHPxoh1s8pVf2PCl+hG+RJnpYkNjJPXl4WU09WIL5kwaYiSzmLLe0duZZTxOxvL6
 Ifh3XuPUhitVz5VHH4MRToXTJo3nJIYxVjwfr1jjSZb2mgVLimjL3O9tfbEXVJ/AxbLC
 ZTig==
X-Gm-Message-State: APjAAAXWKCOHnVusoRzZCkPb6Zjq242LGfj53452RnFQfOzB0552F/wt
 HhxG/LHPHsEsk5/3v9hngRAIjLiD
X-Google-Smtp-Source: APXvYqzEE8GXdNjam14dirlvz7y+A8efnjcT0+P8NXi6hhRt1pDHtqHaNostI9uBmvjD3oE7gWMhAQ==
X-Received: by 2002:ae9:e84b:: with SMTP id a72mr19182615qkg.355.1563225903602; 
 Mon, 15 Jul 2019 14:25:03 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 021/102] drm/amdgpu/soc15: add Arcturus common ip blocks
Date: Mon, 15 Jul 2019 16:23:16 -0500
Message-Id: <20190715212437.31793-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9VH3bys2S7QZy1K4Rhm7Jk+lppCsDMDm0oyflnSUOYw=;
 b=dl/e0bJkqyN4yQqmtUWeVjYFsMFUYLbnYMUsQO5ovYnQoetAnr7FRxjBkT1ou57W9J
 GR1WmsyNm8LwEMottGOhxh5hdN61tNmEEd7ecsmhPwH7mLE1uMp5vSSWsskg+opWSEY2
 Cnv2o3/E5eojI5PwGjBcb7RK8M262aVCA1cHkrdKodi3XSgjO1AoP9jmGaa23bXStw+X
 N0a0q75HfhpVbr9gVpmXRm5WUVXISRa+5xIh8yIUtOx4hsdih/0sfiA85xAG7w1AduMp
 BKq2HlaTtOQGtELkrNoSBj4ByCeBURzmB1m4ka189eHHKjFD+VEubER/xKbLJ4C+ZvFP
 3rZg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCAxOCArKysrKysr
KysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDgwMGRkNzZkY2Y5Mi4uYmI2
YWVkMjA2YzhlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTU5NywxMiArNTk3
LDEzIEBAIGludCBzb2MxNV9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogCiAJaWYgKGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSkKIAkJYWRldi0+bmJpb19mdW5jcyA9
ICZuYmlvX3Y3XzBfZnVuY3M7Ci0JZWxzZSBpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfVkVH
QTIwKQorCWVsc2UgaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1ZFR0EyMCB8fAorCQlhZGV2
LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykKIAkJYWRldi0+bmJpb19mdW5jcyA9ICZuYmlv
X3Y3XzRfZnVuY3M7CiAJZWxzZQogCQlhZGV2LT5uYmlvX2Z1bmNzID0gJm5iaW9fdjZfMV9mdW5j
czsKIAotCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjApCisJaWYgKGFkZXYtPmFz
aWNfdHlwZSA9PSBDSElQX1ZFR0EyMCB8fCBhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJV
UykKIAkJYWRldi0+ZGZfZnVuY3MgPSAmZGZfdjNfNl9mdW5jczsKIAllbHNlCiAJCWFkZXYtPmRm
X2Z1bmNzID0gJmRmX3YxXzdfZnVuY3M7CkBAIC02NzQsNiArNjc1LDE1IEBAIGludCBzb2MxNV9z
ZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogI2VuZGlmCiAJCWFtZGdw
dV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZ2Y25fdjFfMF9pcF9ibG9jayk7CiAJCWJyZWFr
OworCWNhc2UgQ0hJUF9BUkNUVVJVUzoKKwkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRl
diwgJnZlZ2ExMF9jb21tb25faXBfYmxvY2spOworCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2Fk
ZChhZGV2LCAmZ21jX3Y5XzBfaXBfYmxvY2spOworCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2Fk
ZChhZGV2LCAmdmVnYTEwX2loX2lwX2Jsb2NrKTsKKwkJaWYgKGFkZXYtPmVuYWJsZV92aXJ0dWFs
X2Rpc3BsYXkgfHwgYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQorCQkJYW1kZ3B1X2RldmljZV9pcF9i
bG9ja19hZGQoYWRldiwgJmRjZV92aXJ0dWFsX2lwX2Jsb2NrKTsKKwkJYW1kZ3B1X2RldmljZV9p
cF9ibG9ja19hZGQoYWRldiwgJmdmeF92OV8wX2lwX2Jsb2NrKTsKKwkJYW1kZ3B1X2RldmljZV9p
cF9ibG9ja19hZGQoYWRldiwgJnNkbWFfdjRfMF9pcF9ibG9jayk7CisJCWJyZWFrOwogCWRlZmF1
bHQ6CiAJCXJldHVybiAtRUlOVkFMOwogCX0KQEAgLTEwMDAsNiArMTAxMCwxMCBAQCBzdGF0aWMg
aW50IHNvYzE1X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJCQlBTURfUEdfU1VQ
UE9SVF9DUCB8CiAJCQkJQU1EX1BHX1NVUFBPUlRfUkxDX1NNVV9IUzsKIAkJYnJlYWs7CisJY2Fz
ZSBDSElQX0FSQ1RVUlVTOgorCQlhZGV2LT5jZ19mbGFncyA9IDA7CisJCWFkZXYtPnBnX2ZsYWdz
ID0gMDsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJLyogRklYTUU6IG5vdCBzdXBwb3J0ZWQgeWV0
ICovCiAJCXJldHVybiAtRUlOVkFMOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=

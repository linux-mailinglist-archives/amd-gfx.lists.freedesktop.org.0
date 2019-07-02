Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B45D787
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48B66E08A;
	Tue,  2 Jul 2019 20:29:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2612C6E084
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:43 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m14so15480729qka.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=boZA++tXeSMTMS3SqxqYZFX/YC+A0efZEkf4Mz6QPmc=;
 b=M+WMUNAKF57ZL0l01/WAGP6/jrn+mSi8GBIjBvXnEYwi8Sms1JzCrCbs1+9deH/JfR
 8C2bGEB0qtclkuMqDlPSMMJ4hniP8p7bghAJIZwci5Jw8nsMsc5A2PM4T1BGXwQbegb1
 EC1GUY/O5i4NH0ErqTwez987sgpjR1gv9BJMaA7l31TqRXDS/r3Y2Sy4Paty3tB3/73/
 cITswLXFeAdel1I8lWOUHqhTYYHc5iMoXAJI0/aBGcBmE+UuwOWCKV56lPm+W/4WOTkB
 rpNIzsXkeAmodOufGaDIS4GZAGyOsyh2YkA7xyb11v3GJ1hOUapW6CkRmLB6H1vKdy+A
 i91Q==
X-Gm-Message-State: APjAAAVLmbeL280mYGoTetc1AZRiXfQQUWZJaYvmay8LMoVgAHNQrm89
 nzhplIc7N8MOanedIuTr2byC1+DJwSA=
X-Google-Smtp-Source: APXvYqy3ck6iqE/JZY+aGeUx6Ql0dZE/iuuc8hMp25SdUhD8D4UcqNnfUAc/ctbAZuJ/No/uGdu0yA==
X-Received: by 2002:a37:a643:: with SMTP id p64mr27764819qke.36.1562099382133; 
 Tue, 02 Jul 2019 13:29:42 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 53/53] drm/amdgpu: consolidate navi14 IP init
Date: Tue,  2 Jul 2019 15:28:44 -0500
Message-Id: <20190702202844.17001-54-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=boZA++tXeSMTMS3SqxqYZFX/YC+A0efZEkf4Mz6QPmc=;
 b=gWJrpN9l2ABY8mRJ/3d0twO18cwyLq6dBYgTMhdski33rD26/ZRiFaV0c/oOC9Cj4o
 A4rNr3WGerGfX0HlYPUjMJIv2sKHMZB6nhhVRtToMs+Q/r75O5Q09NMdXYaC4qEnQpwX
 0xSJeiwUmSGcsHT3GSC3VuQ6PI8IK+noxYvRw9QQW1dyVSCC62RFfEYrZjLZnnaYsHiZ
 YWz5hc27CjwclfVgIoGRSCuFYK99/kyhT9MpwbAnH33C52qXOjPmDrSftK3ukvz7GboT
 jxhiOwgjgZIMXKYC8F7B6PFRKV1bBxIV4UDUylCAbZ3jLcfskSgR6CIayX2DnyCGToiR
 BHbA==
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

SXQncyB0aGUgc2FtZSBhcyBuYXZpMTAuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bnYuYyB8IDE2ICstLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKaW5kZXggOWUyMWUyMjNl
N2JiLi40NzYwODBlMzg5ZmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwpAQCAtMzQyLDYgKzM0
Miw3IEBAIGludCBudl9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
CiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2Ug
Q0hJUF9OQVZJMTQ6CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZudl9jb21t
b25faXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZ21jX3Yx
MF8wX2lwX2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJm5hdmkx
MF9paF9pcF9ibG9jayk7CkBAIC0zNjIsMjEgKzM2Myw2IEBAIGludCBudl9zZXRfaXBfYmxvY2tz
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlpZiAoYWRldi0+ZW5hYmxlX21lcykKIAkJ
CWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZtZXNfdjEwXzFfaXBfYmxvY2spOwog
CQlicmVhazsKLQljYXNlIENISVBfTkFWSTE0OgotCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2Fk
ZChhZGV2LCAmbnZfY29tbW9uX2lwX2Jsb2NrKTsKLQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19h
ZGQoYWRldiwgJmdtY192MTBfMF9pcF9ibG9jayk7Ci0JCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tf
YWRkKGFkZXYsICZuYXZpMTBfaWhfaXBfYmxvY2spOwotCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2Nr
X2FkZChhZGV2LCAmcHNwX3YxMV8wX2lwX2Jsb2NrKTsKLQkJaWYgKGlzX3N1cHBvcnRfc3dfc211
KGFkZXYpKQotCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNtdV92MTFfMF9p
cF9ibG9jayk7Ci0JCWlmIChhZGV2LT5lbmFibGVfdmlydHVhbF9kaXNwbGF5IHx8IGFtZGdwdV9z
cmlvdl92ZihhZGV2KSkKLQkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkY2Vf
dmlydHVhbF9pcF9ibG9jayk7Ci0JCWVsc2UgaWYgKGFtZGdwdV9kZXZpY2VfaGFzX2RjX3N1cHBv
cnQoYWRldikpCi0JCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZG1faXBfYmxv
Y2spOwotCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZ2Z4X3YxMF8wX2lwX2Js
b2NrKTsKLQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNkbWFfdjVfMF9pcF9i
bG9jayk7Ci0JCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZ2Y25fdjJfMF9pcF9i
bG9jayk7Ci0JCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXJldHVybiAtRUlOVkFMOwogCX0KLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

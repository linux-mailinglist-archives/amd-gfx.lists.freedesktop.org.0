Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A779972
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA2B6E248;
	Mon, 29 Jul 2019 20:15:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A476389DD8
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:26 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id m23so41886766vso.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bkd1b3bmOqBapg9QIz0QJ9IF5f4c3hRhGECZXvLjzds=;
 b=i5UX6AyrfEIlQg2o5Ev/9n3X1q3ZUEOPGVpu1G9y7QbfzUSem0LmrAWStJwGA+7sf1
 IMILrEAmWs1oOoejb9UlG31/5nCy/DPgWVDxlMyjs0+RgyEBRJi6pGstyyQw4vsxmh2o
 EK1aKjPbsfRH82x/8cqKTYYYc7N3azn21CXzgkWEEd3pPHBTKsymgkc4hXTeDT5CQ2vT
 EX5Jlk53CTx+t13hHPryubyUYYMeragAuJT+Wi0s+ted2pumpMw8Wi8DhiQX2Jv7TCsp
 7OnSEXoQIWqmWjibL5VwhvopKoDoOjyMtZLgEgf5GoxGYTOfVuhTt4XlaYgI3y10nbTn
 gcTA==
X-Gm-Message-State: APjAAAVOuOJg2L35UU1JE048Ty9N3SlZOAkj83KeSbqEpgxlUcq03S8a
 TeEegXy+X7IAufm3CxzJn0uPVUjv
X-Google-Smtp-Source: APXvYqyamrTj8SEFrluHRhHcIB6eMFxzpzqdoViP04F4DDFsihMNTjs661cyltXPp/1jAGEQLSMB9w==
X-Received: by 2002:a67:c496:: with SMTP id d22mr30733414vsk.205.1564431325510; 
 Mon, 29 Jul 2019 13:15:25 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/30] drm/amd/powerplay: enable SW SMU routine support for
 arcturus
Date: Mon, 29 Jul 2019 15:14:44 -0500
Message-Id: <20190729201508.16136-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bkd1b3bmOqBapg9QIz0QJ9IF5f4c3hRhGECZXvLjzds=;
 b=ENI2Dp6lXi+pd6RIBoP0P6kjwfMd+lJHf4uIPhfDlG9jLClU4hj0M4zJDZGuajnZIC
 GWKyYk1xR4jGxDWsnTqGYAn4wXst2hl0FCZOujCuH9nGPMDDvaTorGTEKXybhyBxvOoz
 ahw/UP6OEyFlCnLc7LYZOzmdYzOjUfkv9LEPZxqa9QxLaAFiMnEpuMDrkytqRzE/ZBmF
 6HtYLVvz+McCn0P/2qd6cNGBUr9RKARIvSKpsn0Yl9UuQpOJTq63j/Sj+6QBpE/kP6vM
 CPkgWnZUYPRDy4JgkfV+lhGzLvMRyhMb9B99v3cdzP7dv7RVlb8bAxYJUGWWyVX8lccM
 GqWQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCkVuYWJsZSBhcmN0dXJ1cyBTVyBT
TVUgcm91dGluZXMuCgpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29t
PgpSZXZpZXdlZC1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDQ5ICsrKysrKysrKysr
KystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVf
c211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXgg
YzQ1ZmEyZmI0ZGE5Li44ZWJmZTQxYTRkYzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hbWRncHVfc211LmMKQEAgLTQ3Niw3ICs0NzYsNyBAQCBib29sIGlzX3N1cHBvcnRfc3df
c211KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCWlmIChhZGV2LT5hc2ljX3R5cGUg
PT0gQ0hJUF9WRUdBMjApCiAJCXJldHVybiAoYW1kZ3B1X2RwbSA9PSAyKSA/IHRydWU6IGZhbHNl
OwotCWVsc2UgaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX05BVkkxMCkKKwllbHNlIGlmIChh
ZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9BUkNUVVJVUykKIAkJcmV0dXJuIHRydWU7CiAJZWxzZQog
CQlyZXR1cm4gZmFsc2U7CkBAIC03MDgsNiArNzA4LDcgQEAgc3RhdGljIGludCBzbXVfc2V0X2Z1
bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWNhc2UgQ0hJUF9WRUdBMjA6CiAJY2Fz
ZSBDSElQX05BVkkxMDoKIAljYXNlIENISVBfTkFWSTE0OgorCWNhc2UgQ0hJUF9BUkNUVVJVUzoK
IAkJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQUF9PVkVSRFJJVkVfTUFTSykKIAkJCXNtdS0+
b2RfZW5hYmxlZCA9IHRydWU7CiAJCXNtdV92MTFfMF9zZXRfc211X2Z1bmNzKHNtdSk7CkBAIC0x
MDEzLDkgKzEwMTQsMTEgQEAgc3RhdGljIGludCBzbXVfc21jX3RhYmxlX2h3X2luaXQoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUsCiAJCXJldHVybiAwOwogCX0KIAotCXJldCA9IHNtdV9pbml0X2Rp
c3BsYXlfY291bnQoc211LCAwKTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OworCWlmIChhZGV2
LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJVUykgeworCQlyZXQgPSBzbXVfaW5pdF9kaXNwbGF5
X2NvdW50KHNtdSwgMCk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCX0KIAogCWlmIChp
bml0aWFsaXplKSB7CiAJCS8qIGdldCBib290X3ZhbHVlcyBmcm9tIHZiaW9zIHRvIHNldCByZXZp
c2lvbiwgZ2Z4Y2xrLCBhbmQgZXRjLiAqLwpAQCAtMTA5MSwxNyArMTA5NCwxOSBAQCBzdGF0aWMg
aW50IHNtdV9zbWNfdGFibGVfaHdfaW5pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlpZiAo
cmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0ID0gc211X25vdGlmeV9kaXNwbGF5X2NoYW5nZShz
bXUpOwotCWlmIChyZXQpCi0JCXJldHVybiByZXQ7CisJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBD
SElQX0FSQ1RVUlVTKSB7CisJCXJldCA9IHNtdV9ub3RpZnlfZGlzcGxheV9jaGFuZ2Uoc211KTsK
KwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CiAKLQkvKgotCSAqIFNldCBtaW4gZGVlcCBzbGVl
cCBkY2UgZmNsayB3aXRoIGJvb3R1cCB2YWx1ZSBmcm9tIHZiaW9zIHZpYQotCSAqIFNldE1pbkRl
ZXBTbGVlcERjZWZjbGsgTVNHLgotCSAqLwotCXJldCA9IHNtdV9zZXRfbWluX2RjZWZfZGVlcF9z
bGVlcChzbXUpOwotCWlmIChyZXQpCi0JCXJldHVybiByZXQ7CisJCS8qCisJCSAqIFNldCBtaW4g
ZGVlcCBzbGVlcCBkY2UgZmNsayB3aXRoIGJvb3R1cCB2YWx1ZSBmcm9tIHZiaW9zIHZpYQorCQkg
KiBTZXRNaW5EZWVwU2xlZXBEY2VmY2xrIE1TRy4KKwkJICovCisJCXJldCA9IHNtdV9zZXRfbWlu
X2RjZWZfZGVlcF9zbGVlcChzbXUpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CiAK
IAkvKgogCSAqIFNldCBpbml0aWFsaXplZCB2YWx1ZXMgKGdldCBmcm9tIHZiaW9zKSB0byBkcG0g
dGFibGVzIGNvbnRleHQgc3VjaCBhcwpAQCAtMTIxMiwxNCArMTIxNywyMCBAQCBzdGF0aWMgaW50
IHNtdV9od19pbml0KHZvaWQgKmhhbmRsZSkKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKIAlzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSA9ICZhZGV2LT5zbXU7CiAKLQlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQ
VV9GV19MT0FEX1BTUCkgewotCQlyZXQgPSBzbXVfY2hlY2tfZndfc3RhdHVzKHNtdSk7Ci0JCWlm
IChyZXQpIHsKLQkJCXByX2VycigiU01DIGZpcm13YXJlIHN0YXR1cyBpcyBub3QgY29ycmVjdFxu
Iik7Ci0JCQlyZXR1cm4gcmV0OworCWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgIT0gQU1E
R1BVX0ZXX0xPQURfUFNQKSB7CisJCWlmIChhZGV2LT5hc2ljX3R5cGUgPCBDSElQX05BVkkxMCkg
eworCQkJcmV0ID0gc211X2xvYWRfbWljcm9jb2RlKHNtdSk7CisJCQlpZiAocmV0KQorCQkJCXJl
dHVybiByZXQ7CiAJCX0KIAl9CiAKKwlyZXQgPSBzbXVfY2hlY2tfZndfc3RhdHVzKHNtdSk7CisJ
aWYgKHJldCkgeworCQlwcl9lcnIoIlNNQyBmaXJtd2FyZSBzdGF0dXMgaXMgbm90IGNvcnJlY3Rc
biIpOworCQlyZXR1cm4gcmV0OworCX0KKwogCWlmICghc211LT5wbV9lbmFibGVkKQogCQlyZXR1
cm4gMDsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=

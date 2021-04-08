Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD80D3581C4
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Apr 2021 13:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69016EA9A;
	Thu,  8 Apr 2021 11:29:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A304C6EA9A
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Apr 2021 11:29:51 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id r12so2430551ejr.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 08 Apr 2021 04:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=j/mtQ2LWIYzyDLG0MdAUH7+Z1pgDnFbSiObrdymEWqk=;
 b=SSfXpxzNJpYEXowDzgJSDGxzls4NroUpoXPZAOs4C5STZXn8vHTZ5ZLcgkWlpFntzX
 9/e04Jss9V12+51hb6WHTw0SBfDEdVzVVcbmOFyG3rYRyuD6DYW3Fq2DDrgd3EaJ2iOw
 akGXynxLC84VwCQIg8Sv9EqAW/Swz7g0Fbl0C/56jKMwJJHAmll8slWVecuT8Uipplf+
 DrdjxzXHLr1tjErMy6tyq+rurVkLknO3pvJlKRXscTvjbiWrmshTyEofXkG1X1uj8gDD
 AYL0kIHuKZUfWJ6OqyN3OpEm6XgK1LPVo6G9EIc7zcRebNzrr/+MP1UsTRnb6OfUPYS9
 cyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/mtQ2LWIYzyDLG0MdAUH7+Z1pgDnFbSiObrdymEWqk=;
 b=PBlMW66iOdVoEfKOC8aXmoE1q12ry1mVpIlAEAsIr+aCm7ymhdF55b9xW4O2u0lCw8
 cAACIHL4vxvROIF3vC++ZzI/UzNBeSaUIa7SnH2rwPO5QMX/vFnS3KQo1BfOP0PwGKGq
 vqBBaquTWFPOX2RvKtY1D15RAF1MK0wsHnDA5uWACRyxiPndoMKwRKLLhj8/+FD2gL/v
 h6oTC2lzZyaEtn+V1JDn8IM/+EWmgB/GpJPiNIzU1uR+zTcB3sY4K+a+6fd3USLDzMeo
 zZghNLsujLBErX8aPrn8eQngpSUqT+7PT5ChCnmzFh4S8Cd3We+3MRJlX/JowUGk6ljR
 cArA==
X-Gm-Message-State: AOAM533FlmBGuzhbBgSSU+ll+8CZfotgdSzZWvjPCU2xSdLoUQL1pJee
 z05ATlNI4eUoKVuo0s4SnmtFpfiwpR8=
X-Google-Smtp-Source: ABdhPJzkLScuDt/rg/+0HxiK1fIumAOx26qVf2GsjbyTFrDoh4epeRPt2Tdt78TRFmBOGDmSO8E/wA==
X-Received: by 2002:a17:906:4cc6:: with SMTP id
 q6mr9536676ejt.131.1617881390264; 
 Thu, 08 Apr 2021 04:29:50 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8439:31b5:dcf6:9aef])
 by smtp.gmail.com with ESMTPSA id c12sm18485996edx.54.2021.04.08.04.29.49
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:29:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: fix coding style and documentation in
 amdgpu_vram_mgr.c
Date: Thu,  8 Apr 2021 13:29:48 +0200
Message-Id: <20210408112948.4441-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408112948.4441-1-christian.koenig@amd.com>
References: <20210408112948.4441-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzLCBqdXN0IGNsZWFuaW5nIHVwIHNvbWUgbGVmdG92ZXJzIGFu
ZCBpbXByb3ZlCmRvY3VtZW50YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZyYW1fbWdyLmMgfCAxNzMgKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDkzIGluc2VydGlvbnMoKyksIDgwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKaW5kZXggNTkyYTJkZDE2NDkzLi4xODc5
ZTQ2YmRhMWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
cmFtX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21n
ci5jCkBAIC0yOCwxMiArMjgsMTQgQEAKICNpbmNsdWRlICJhbWRncHVfYXRvbWZpcm13YXJlLmgi
CiAjaW5jbHVkZSAiYXRvbS5oIgogCi1zdGF0aWMgaW5saW5lIHN0cnVjdCBhbWRncHVfdnJhbV9t
Z3IgKnRvX3ZyYW1fbWdyKHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuKQorc3RhdGlj
IGlubGluZSBzdHJ1Y3QgYW1kZ3B1X3ZyYW1fbWdyICoKK3RvX3ZyYW1fbWdyKHN0cnVjdCB0dG1f
cmVzb3VyY2VfbWFuYWdlciAqbWFuKQogewogCXJldHVybiBjb250YWluZXJfb2YobWFuLCBzdHJ1
Y3QgYW1kZ3B1X3ZyYW1fbWdyLCBtYW5hZ2VyKTsKIH0KIAotc3RhdGljIGlubGluZSBzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqdG9fYW1kZ3B1X2RldmljZShzdHJ1Y3QgYW1kZ3B1X3ZyYW1fbWdyICpt
Z3IpCitzdGF0aWMgaW5saW5lIHN0cnVjdCBhbWRncHVfZGV2aWNlICoKK3RvX2FtZGdwdV9kZXZp
Y2Uoc3RydWN0IGFtZGdwdV92cmFtX21nciAqbWdyKQogewogCXJldHVybiBjb250YWluZXJfb2Yo
bWdyLCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSwgbW1hbi52cmFtX21ncik7CiB9CkBAIC04MSwxMiAr
ODMsMTQgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X21lbV9pbmZvX3Zpc192cmFtX3RvdGFsX3No
b3coc3RydWN0IGRldmljZSAqZGV2LAogICogYW1vdW50IG9mIGN1cnJlbnRseSB1c2VkIFZSQU0g
aW4gYnl0ZXMKICAqLwogc3RhdGljIHNzaXplX3QgYW1kZ3B1X21lbV9pbmZvX3ZyYW1fdXNlZF9z
aG93KHN0cnVjdCBkZXZpY2UgKmRldiwKLQkJc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIs
IGNoYXIgKmJ1ZikKKwkJCQkJICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCisJ
CQkJCSAgICAgIGNoYXIgKmJ1ZikKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOwogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZHJtX3RvX2Fk
ZXYoZGRldik7Ci0Jc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4gPSB0dG1fbWFuYWdl
cl90eXBlKCZhZGV2LT5tbWFuLmJkZXYsIFRUTV9QTF9WUkFNKTsKKwlzdHJ1Y3QgdHRtX3Jlc291
cmNlX21hbmFnZXIgKm1hbjsKIAorCW1hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoJmFkZXYtPm1tYW4u
YmRldiwgVFRNX1BMX1ZSQU0pOwogCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVsbHVcbiIsIGFt
ZGdwdV92cmFtX21ncl91c2FnZShtYW4pKTsKIH0KIApAQCAtOTksMTggKzEwMywyOCBAQCBzdGF0
aWMgc3NpemVfdCBhbWRncHVfbWVtX2luZm9fdnJhbV91c2VkX3Nob3coc3RydWN0IGRldmljZSAq
ZGV2LAogICogYW1vdW50IG9mIGN1cnJlbnRseSB1c2VkIHZpc2libGUgVlJBTSBpbiBieXRlcwog
ICovCiBzdGF0aWMgc3NpemVfdCBhbWRncHVfbWVtX2luZm9fdmlzX3ZyYW1fdXNlZF9zaG93KHN0
cnVjdCBkZXZpY2UgKmRldiwKLQkJc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIg
KmJ1ZikKKwkJCQkJCSAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCisJCQkJCQkgIGNo
YXIgKmJ1ZikKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOwogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZHJtX3RvX2FkZXYoZGRldik7Ci0J
c3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4gPSB0dG1fbWFuYWdlcl90eXBlKCZhZGV2
LT5tbWFuLmJkZXYsIFRUTV9QTF9WUkFNKTsKKwlzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIg
Km1hbjsKIAorCW1hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoJmFkZXYtPm1tYW4uYmRldiwgVFRNX1BM
X1ZSQU0pOwogCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVsbHVcbiIsIGFtZGdwdV92cmFtX21n
cl92aXNfdXNhZ2UobWFuKSk7CiB9CiAKKy8qKgorICogRE9DOiBtZW1faW5mb192cmFtX3ZlbmRv
cgorICoKKyAqIFRoZSBhbWRncHUgZHJpdmVyIHByb3ZpZGVzIGEgc3lzZnMgQVBJIGZvciByZXBv
cnRpbmcgdGhlIHZlbmRvciBvZiB0aGUKKyAqIGluc3RhbGxlZCBWUkFNCisgKiBUaGUgZmlsZSBt
ZW1faW5mb192cmFtX3ZlbmRvciBpcyB1c2VkIGZvciB0aGlzIGFuZCByZXR1cm5zIHRoZSBuYW1l
IG9mIHRoZQorICogdmVuZG9yLgorICovCiBzdGF0aWMgc3NpemVfdCBhbWRncHVfbWVtX2luZm9f
dnJhbV92ZW5kb3Ioc3RydWN0IGRldmljZSAqZGV2LAotCQkJCQkJIHN0cnVjdCBkZXZpY2VfYXR0
cmlidXRlICphdHRyLAotCQkJCQkJIGNoYXIgKmJ1ZikKKwkJCQkJICAgc3RydWN0IGRldmljZV9h
dHRyaWJ1dGUgKmF0dHIsCisJCQkJCSAgIGNoYXIgKmJ1ZikKIHsKIAlzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGRldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCXN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2ID0gZHJtX3RvX2FkZXYoZGRldik7CkBAIC0xNjEsNzggKzE3NSw2IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYXR0cmlidXRlICphbWRncHVfdnJhbV9tZ3JfYXR0cmlidXRlc1tdID0gewogCU5V
TEwKIH07CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXJfZnVuYyBh
bWRncHVfdnJhbV9tZ3JfZnVuYzsKLQotLyoqCi0gKiBhbWRncHVfdnJhbV9tZ3JfaW5pdCAtIGlu
aXQgVlJBTSBtYW5hZ2VyIGFuZCBEUk0gTU0KLSAqCi0gKiBAYWRldjogYW1kZ3B1X2RldmljZSBw
b2ludGVyCi0gKgotICogQWxsb2NhdGUgYW5kIGluaXRpYWxpemUgdGhlIFZSQU0gbWFuYWdlci4K
LSAqLwotaW50IGFtZGdwdV92cmFtX21ncl9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQotewotCXN0cnVjdCBhbWRncHVfdnJhbV9tZ3IgKm1nciA9ICZhZGV2LT5tbWFuLnZyYW1fbWdy
OwotCXN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuID0gJm1nci0+bWFuYWdlcjsKLQlp
bnQgcmV0OwotCi0JdHRtX3Jlc291cmNlX21hbmFnZXJfaW5pdChtYW4sIGFkZXYtPmdtYy5yZWFs
X3ZyYW1fc2l6ZSA+PiBQQUdFX1NISUZUKTsKLQotCW1hbi0+ZnVuYyA9ICZhbWRncHVfdnJhbV9t
Z3JfZnVuYzsKLQotCWRybV9tbV9pbml0KCZtZ3ItPm1tLCAwLCBtYW4tPnNpemUpOwotCXNwaW5f
bG9ja19pbml0KCZtZ3ItPmxvY2spOwotCUlOSVRfTElTVF9IRUFEKCZtZ3ItPnJlc2VydmF0aW9u
c19wZW5kaW5nKTsKLQlJTklUX0xJU1RfSEVBRCgmbWdyLT5yZXNlcnZlZF9wYWdlcyk7Ci0KLQkv
KiBBZGQgdGhlIHR3byBWUkFNLXJlbGF0ZWQgc3lzZnMgZmlsZXMgKi8KLQlyZXQgPSBzeXNmc19j
cmVhdGVfZmlsZXMoJmFkZXYtPmRldi0+a29iaiwgYW1kZ3B1X3ZyYW1fbWdyX2F0dHJpYnV0ZXMp
OwotCWlmIChyZXQpCi0JCURSTV9FUlJPUigiRmFpbGVkIHRvIHJlZ2lzdGVyIHN5c2ZzXG4iKTsK
LQotCXR0bV9zZXRfZHJpdmVyX21hbmFnZXIoJmFkZXYtPm1tYW4uYmRldiwgVFRNX1BMX1ZSQU0s
ICZtZ3ItPm1hbmFnZXIpOwotCXR0bV9yZXNvdXJjZV9tYW5hZ2VyX3NldF91c2VkKG1hbiwgdHJ1
ZSk7Ci0JcmV0dXJuIDA7Ci19Ci0KLS8qKgotICogYW1kZ3B1X3ZyYW1fbWdyX2ZpbmkgLSBmcmVl
IGFuZCBkZXN0cm95IFZSQU0gbWFuYWdlcgotICoKLSAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBv
aW50ZXIKLSAqCi0gKiBEZXN0cm95IGFuZCBmcmVlIHRoZSBWUkFNIG1hbmFnZXIsIHJldHVybnMg
LUVCVVNZIGlmIHJhbmdlcyBhcmUgc3RpbGwKLSAqIGFsbG9jYXRlZCBpbnNpZGUgaXQuCi0gKi8K
LXZvaWQgYW1kZ3B1X3ZyYW1fbWdyX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCi17
Ci0Jc3RydWN0IGFtZGdwdV92cmFtX21nciAqbWdyID0gJmFkZXYtPm1tYW4udnJhbV9tZ3I7Ci0J
c3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4gPSAmbWdyLT5tYW5hZ2VyOwotCWludCBy
ZXQ7Ci0Jc3RydWN0IGFtZGdwdV92cmFtX3Jlc2VydmF0aW9uICpyc3YsICp0ZW1wOwotCi0JdHRt
X3Jlc291cmNlX21hbmFnZXJfc2V0X3VzZWQobWFuLCBmYWxzZSk7Ci0KLQlyZXQgPSB0dG1fcmVz
b3VyY2VfbWFuYWdlcl9ldmljdF9hbGwoJmFkZXYtPm1tYW4uYmRldiwgbWFuKTsKLQlpZiAocmV0
KQotCQlyZXR1cm47Ci0KLQlzcGluX2xvY2soJm1nci0+bG9jayk7Ci0JbGlzdF9mb3JfZWFjaF9l
bnRyeV9zYWZlKHJzdiwgdGVtcCwgJm1nci0+cmVzZXJ2YXRpb25zX3BlbmRpbmcsIG5vZGUpCi0J
CWtmcmVlKHJzdik7Ci0KLQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocnN2LCB0ZW1wLCAmbWdy
LT5yZXNlcnZlZF9wYWdlcywgbm9kZSkgewotCQlkcm1fbW1fcmVtb3ZlX25vZGUoJnJzdi0+bW1f
bm9kZSk7Ci0JCWtmcmVlKHJzdik7Ci0JfQotCWRybV9tbV90YWtlZG93bigmbWdyLT5tbSk7Ci0J
c3Bpbl91bmxvY2soJm1nci0+bG9jayk7Ci0KLQlzeXNmc19yZW1vdmVfZmlsZXMoJmFkZXYtPmRl
di0+a29iaiwgYW1kZ3B1X3ZyYW1fbWdyX2F0dHJpYnV0ZXMpOwotCi0JdHRtX3Jlc291cmNlX21h
bmFnZXJfY2xlYW51cChtYW4pOwotCXR0bV9zZXRfZHJpdmVyX21hbmFnZXIoJmFkZXYtPm1tYW4u
YmRldiwgVFRNX1BMX1ZSQU0sIE5VTEwpOwotfQotCiAvKioKICAqIGFtZGdwdV92cmFtX21ncl92
aXNfc2l6ZSAtIENhbGN1bGF0ZSB2aXNpYmxlIG5vZGUgc2l6ZQogICoKQEAgLTI4Miw2ICsyMjQs
NyBAQCB1NjQgYW1kZ3B1X3ZyYW1fbWdyX2JvX3Zpc2libGVfc2l6ZShzdHJ1Y3QgYW1kZ3B1X2Jv
ICpibykKIAlyZXR1cm4gdXNhZ2U7CiB9CiAKKy8qIENvbW1pdCB0aGUgcmVzZXJ2YXRpb24gb2Yg
VlJBTSBwYWdlcyAqLwogc3RhdGljIHZvaWQgYW1kZ3B1X3ZyYW1fbWdyX2RvX3Jlc2VydmUoc3Ry
dWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4pCiB7CiAJc3RydWN0IGFtZGdwdV92cmFtX21n
ciAqbWdyID0gdG9fdnJhbV9tZ3IobWFuKTsKQEAgLTcxMywzICs2NTYsNzMgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlcl9mdW5jIGFtZGdwdV92cmFtX21ncl9mdW5j
ID0gewogCS5mcmVlCT0gYW1kZ3B1X3ZyYW1fbWdyX2RlbCwKIAkuZGVidWcJPSBhbWRncHVfdnJh
bV9tZ3JfZGVidWcKIH07CisKKy8qKgorICogYW1kZ3B1X3ZyYW1fbWdyX2luaXQgLSBpbml0IFZS
QU0gbWFuYWdlciBhbmQgRFJNIE1NCisgKgorICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRl
cgorICoKKyAqIEFsbG9jYXRlIGFuZCBpbml0aWFsaXplIHRoZSBWUkFNIG1hbmFnZXIuCisgKi8K
K2ludCBhbWRncHVfdnJhbV9tZ3JfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sK
KwlzdHJ1Y3QgYW1kZ3B1X3ZyYW1fbWdyICptZ3IgPSAmYWRldi0+bW1hbi52cmFtX21ncjsKKwlz
dHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiA9ICZtZ3ItPm1hbmFnZXI7CisJaW50IHJl
dDsKKworCXR0bV9yZXNvdXJjZV9tYW5hZ2VyX2luaXQobWFuLCBhZGV2LT5nbWMucmVhbF92cmFt
X3NpemUgPj4gUEFHRV9TSElGVCk7CisKKwltYW4tPmZ1bmMgPSAmYW1kZ3B1X3ZyYW1fbWdyX2Z1
bmM7CisKKwlkcm1fbW1faW5pdCgmbWdyLT5tbSwgMCwgbWFuLT5zaXplKTsKKwlzcGluX2xvY2tf
aW5pdCgmbWdyLT5sb2NrKTsKKwlJTklUX0xJU1RfSEVBRCgmbWdyLT5yZXNlcnZhdGlvbnNfcGVu
ZGluZyk7CisJSU5JVF9MSVNUX0hFQUQoJm1nci0+cmVzZXJ2ZWRfcGFnZXMpOworCisJLyogQWRk
IHRoZSB0d28gVlJBTS1yZWxhdGVkIHN5c2ZzIGZpbGVzICovCisJcmV0ID0gc3lzZnNfY3JlYXRl
X2ZpbGVzKCZhZGV2LT5kZXYtPmtvYmosIGFtZGdwdV92cmFtX21ncl9hdHRyaWJ1dGVzKTsKKwlp
ZiAocmV0KQorCQlEUk1fRVJST1IoIkZhaWxlZCB0byByZWdpc3RlciBzeXNmc1xuIik7CisKKwl0
dG1fc2V0X2RyaXZlcl9tYW5hZ2VyKCZhZGV2LT5tbWFuLmJkZXYsIFRUTV9QTF9WUkFNLCAmbWdy
LT5tYW5hZ2VyKTsKKwl0dG1fcmVzb3VyY2VfbWFuYWdlcl9zZXRfdXNlZChtYW4sIHRydWUpOwor
CXJldHVybiAwOworfQorCisvKioKKyAqIGFtZGdwdV92cmFtX21ncl9maW5pIC0gZnJlZSBhbmQg
ZGVzdHJveSBWUkFNIG1hbmFnZXIKKyAqCisgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVy
CisgKgorICogRGVzdHJveSBhbmQgZnJlZSB0aGUgVlJBTSBtYW5hZ2VyLCByZXR1cm5zIC1FQlVT
WSBpZiByYW5nZXMgYXJlIHN0aWxsCisgKiBhbGxvY2F0ZWQgaW5zaWRlIGl0LgorICovCit2b2lk
IGFtZGdwdV92cmFtX21ncl9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCXN0
cnVjdCBhbWRncHVfdnJhbV9tZ3IgKm1nciA9ICZhZGV2LT5tbWFuLnZyYW1fbWdyOworCXN0cnVj
dCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuID0gJm1nci0+bWFuYWdlcjsKKwlpbnQgcmV0Owor
CXN0cnVjdCBhbWRncHVfdnJhbV9yZXNlcnZhdGlvbiAqcnN2LCAqdGVtcDsKKworCXR0bV9yZXNv
dXJjZV9tYW5hZ2VyX3NldF91c2VkKG1hbiwgZmFsc2UpOworCisJcmV0ID0gdHRtX3Jlc291cmNl
X21hbmFnZXJfZXZpY3RfYWxsKCZhZGV2LT5tbWFuLmJkZXYsIG1hbik7CisJaWYgKHJldCkKKwkJ
cmV0dXJuOworCisJc3Bpbl9sb2NrKCZtZ3ItPmxvY2spOworCWxpc3RfZm9yX2VhY2hfZW50cnlf
c2FmZShyc3YsIHRlbXAsICZtZ3ItPnJlc2VydmF0aW9uc19wZW5kaW5nLCBub2RlKQorCQlrZnJl
ZShyc3YpOworCisJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHJzdiwgdGVtcCwgJm1nci0+cmVz
ZXJ2ZWRfcGFnZXMsIG5vZGUpIHsKKwkJZHJtX21tX3JlbW92ZV9ub2RlKCZyc3YtPm1tX25vZGUp
OworCQlrZnJlZShyc3YpOworCX0KKwlkcm1fbW1fdGFrZWRvd24oJm1nci0+bW0pOworCXNwaW5f
dW5sb2NrKCZtZ3ItPmxvY2spOworCisJc3lzZnNfcmVtb3ZlX2ZpbGVzKCZhZGV2LT5kZXYtPmtv
YmosIGFtZGdwdV92cmFtX21ncl9hdHRyaWJ1dGVzKTsKKworCXR0bV9yZXNvdXJjZV9tYW5hZ2Vy
X2NsZWFudXAobWFuKTsKKwl0dG1fc2V0X2RyaXZlcl9tYW5hZ2VyKCZhZGV2LT5tbWFuLmJkZXYs
IFRUTV9QTF9WUkFNLCBOVUxMKTsKK30KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4Cg==

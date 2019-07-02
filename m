Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2515D76B
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7DC6E062;
	Tue,  2 Jul 2019 20:29:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0EE6E059
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:20 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id s15so20109927qtk.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M5bme642tlI5/5RBbRVIEnTK5NceAGOcYuxkZAnw54Q=;
 b=VqZB2nt9pNh2nXBaKiWW0vp7tBAoj4EZz/lolBdNXz3dGyibtfEH67dDbeO2LcnaYe
 oaVr6eKFpbMfjcWIHZ/Eihe/1wv+L5zYUiBWGKYuTccwNPZlh4iPPFb5Z0A9VtGSR7ff
 7pixQaQsnIl+W8QZTmYCz+4u8DwPbqu1I5ixu8w0WyM7wrfgJElJ6gCNH+MvSqGQNuMf
 hWGqGicGybQFYjznwmKFPz0lrC4ioCb+gi/1GzgO53YTiEjkQl8ESSQCXjmFwZhomHBW
 s4Va5DR1Grxt+Ncp2qSKWP3qAQMuZq4q/oYB47KD6LYqByw7yYAIE1oNYMc+IOMn4cfJ
 t1ww==
X-Gm-Message-State: APjAAAXOtcQJhQvnNekTEx9KfJTjzEj3eYeSmZl3O6eK3gRqQaZ/qMM/
 WAxfbnvN7nh715siKEhQl+k1OZ8OghQ=
X-Google-Smtp-Source: APXvYqz2fCdbEXaBQOvxQhWm8NWQgG5Tnvnh+XFkbfHY9UBbMugz+ixteMIcVtyc0KPVi46q8zTzyQ==
X-Received: by 2002:ac8:828:: with SMTP id u37mr25346993qth.96.1562099359744; 
 Tue, 02 Jul 2019 13:29:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 27/53] drm/amdgpu/soc15: add support for navi14
Date: Tue,  2 Jul 2019 15:28:18 -0500
Message-Id: <20190702202844.17001-28-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5bme642tlI5/5RBbRVIEnTK5NceAGOcYuxkZAnw54Q=;
 b=gm0Gu2Pcw+mQ8XNd5D9YH9xXrxv2+jBCJzjDVIx4H7Ax+rKyBH98uYoNXdEVLGMB/L
 U3/Kqhxdj/t+i7jBoEYzWg8DOwfmueBE/C8o89G9hQFWDpmRzl8FhjKUP0OGjW6KMfTr
 1YUGoVTFiZl0RVMltdJSbIfi080MpeE8BTA+SCCaTGtJWMRiB73I/MqotQUWI8rRXaCj
 v71xB6751M5UPb3uOPtlWN0gW78np/vQB+P8rGfnB4xzE75Qzcs2+MEhTInOzzVjcZVj
 pZERAP510Hjn1tks47bxJ8PqyoZj8duSsLZJf6OnjtFZIQWn0ZecD7kXizbGOnkCqAYo
 Ehxw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnNhbWUgYXMgbmF2aTEw
CgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgpSZXZp
ZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdl
ZC1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L252LmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCmluZGV4IDY2MmNjZjJjNmIzZS4uNjQ5ZGM1YzAxZmY2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTUxNiw2ICs1MTYsMTEgQEAgc3RhdGljIGlu
dCBudl9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAJCQlBTURfUEdfU1VQUE9SVF9B
VEhVQjsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRldi0+cmV2X2lkICsgMHgxOwogCQli
cmVhazsKKwljYXNlIENISVBfTkFWSTE0OgorCQlhZGV2LT5jZ19mbGFncyA9IDA7CisJCWFkZXYt
PnBnX2ZsYWdzID0gMDsKKwkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRldi0+cmV2X2lkICsg
MHgxOyAvKiA/Pz8gKi8KKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJLyogRklYTUU6IG5vdCBzdXBw
b3J0ZWQgeWV0ICovCiAJCXJldHVybiAtRUlOVkFMOwpAQCAtNzA4LDYgKzcxMyw3IEBAIHN0YXRp
YyBpbnQgbnZfY29tbW9uX3NldF9jbG9ja2dhdGluZ19zdGF0ZSh2b2lkICpoYW5kbGUsCiAKIAlz
d2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewogCWNhc2UgQ0hJUF9OQVZJMTA6CisJY2FzZSBDSElQ
X05BVkkxNDoKIAkJYWRldi0+bmJpb19mdW5jcy0+dXBkYXRlX21lZGl1bV9ncmFpbl9jbG9ja19n
YXRpbmcoYWRldiwKIAkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUgOiBmYWxz
ZSk7CiAJCWFkZXYtPm5iaW9fZnVuY3MtPnVwZGF0ZV9tZWRpdW1fZ3JhaW5fbGlnaHRfc2xlZXAo
YWRldiwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

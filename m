Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 680C2344241
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Mar 2021 13:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C7189CD3;
	Mon, 22 Mar 2021 12:40:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D0E89CD3
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Mar 2021 12:40:50 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id e14so2789971ejz.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Mar 2021 05:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WN/tRYfBHS4jErp/hm+9dWTbMZl9AxJvBZADTRTNeW8=;
 b=oGjlACACcuyT4AhxngVw+ZEiz2E+7hxqP9Oohw0uSOPSEmRBfBit3Msj5Baqs6u30T
 3TyfH/6VL9k6wZNRV08oDVuIOmfuCN9mnmJqe3VwTXX94vZUx9+L/WzN3ctRJQBaMIm8
 EeWq024QKQRKOfc5LuJukclfyJTeDlGrRpn3iX59oAoVyk3OxJAS3Yo7/iXvgYCspnyF
 ASUngXSWSm1V9TEwSk7Bj+UQ9KvQeoGHE0KXK4lqYFfrcYHuJzKiTbXM9yH0asC8B0zy
 ZFvMu2cDAHp2/UpPrrptjX1cLu1syE2HeAEDewUo5372/8wQLyUAKLnI52kKvkydG7sV
 4Utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WN/tRYfBHS4jErp/hm+9dWTbMZl9AxJvBZADTRTNeW8=;
 b=sqi3xipz1JjhFb65AhOTHCpi86WT7xswvn9ti+Wxkr52cd4PD7fYNq47LzzMybr8dm
 JsR9eLwGbbTUhMR4J7ZwORGYA5uupN+Ep3u92w50YJDYn2yBgjHu+Li/jDcawlvfk4R1
 XGtcfyP1H0y+xAu+7g7r9xzR71bIrMj5/ap1dTUu7EUorjqORl/0PofrLj1kaDjD1Dvi
 94ObRyTwCcaalw1Eqlkx/Bbdq9A65tsMugSotJoLaWVIwmxSFqqo1TE9rhCQCZ0b4Hoi
 PCVnKhVROL4XNs0KE4nKshM1BL9nelFnuOtLQiok60v2Vyovp58v3Trzv83N4MQTwW9S
 ItEQ==
X-Gm-Message-State: AOAM531ymLEViywhfkajsl27qOwhhRNEnmn0zQTL1y7srwo3ZHDA5483
 /8etO+vil2H/KDZ8cIqsLqO8zioRiw8=
X-Google-Smtp-Source: ABdhPJxe5+/OuIsCK/020TRvC7nComHJk+ka6mQ/o31SCxYDcueGzt+vrLglT0PQUoBtQ/IEfYynCA==
X-Received: by 2002:a17:906:86c6:: with SMTP id
 j6mr18408895ejy.197.1616416849419; 
 Mon, 22 Mar 2021 05:40:49 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9d51:daf9:5d58:3f40])
 by smtp.gmail.com with ESMTPSA id p9sm11367280edu.79.2021.03.22.05.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 05:40:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: re-apply "use the new cursor in the VM code""
Date: Mon, 22 Mar 2021 13:40:48 +0100
Message-Id: <20210322124048.5546-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: nirmoy.das@amd.com, guchun.chen@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm93IHRoYXQgd2UgZm91bmQgdGhlIHVuZGVybHlpbmcgcHJvYmxlbSB3ZSBjYW4gcmUtYXBwbHkg
dGhpcyBwYXRjaC4KClRoaXMgcmV2ZXJ0cyBjb21taXQgODY3ZmVlN2Y4ODIxZmY0MmU3MzA4MDg4
Y2YwYzM0NTBhYzQ5YzE3Yy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm0uYyB8IDU1ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm0uYwppbmRleCA5MjY4ZGIxMTcyYmQuLmJjMzk1MWI3MTA3OSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKQEAgLTM3LDYgKzM3LDcgQEAKICNpbmNsdWRl
ICJhbWRncHVfZ21jLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X3hnbWkuaCIKICNpbmNsdWRlICJhbWRn
cHVfZG1hX2J1Zi5oIgorI2luY2x1ZGUgImFtZGdwdV9yZXNfY3Vyc29yLmgiCiAKIC8qKgogICog
RE9DOiBHUFVWTQpAQCAtMTU4Myw3ICsxNTg0LDcgQEAgc3RhdGljIGludCBhbWRncHVfdm1fdXBk
YXRlX3B0ZXMoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwYXJhbXMsCiAgKiBAbGFz
dDogbGFzdCBtYXBwZWQgZW50cnkKICAqIEBmbGFnczogZmxhZ3MgZm9yIHRoZSBlbnRyaWVzCiAg
KiBAb2Zmc2V0OiBvZmZzZXQgaW50byBub2RlcyBhbmQgcGFnZXNfYWRkcgotICogQG5vZGVzOiBh
cnJheSBvZiBkcm1fbW1fbm9kZXMgd2l0aCB0aGUgTUMgYWRkcmVzc2VzCisgKiBAcmVzOiB0dG1f
cmVzb3VyY2UgdG8gbWFwCiAgKiBAcGFnZXNfYWRkcjogRE1BIGFkZHJlc3NlcyB0byB1c2UgZm9y
IG1hcHBpbmcKICAqIEBmZW5jZTogb3B0aW9uYWwgcmVzdWx0aW5nIGZlbmNlCiAgKgpAQCAtMTU5
OCwxMyArMTU5OSwxMyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkgICAgICAgYm9vbCB1bmxvY2tlZCwgc3Ry
dWN0IGRtYV9yZXN2ICpyZXN2LAogCQkJCSAgICAgICB1aW50NjRfdCBzdGFydCwgdWludDY0X3Qg
bGFzdCwKIAkJCQkgICAgICAgdWludDY0X3QgZmxhZ3MsIHVpbnQ2NF90IG9mZnNldCwKLQkJCQkg
ICAgICAgc3RydWN0IGRybV9tbV9ub2RlICpub2RlcywKKwkJCQkgICAgICAgc3RydWN0IHR0bV9y
ZXNvdXJjZSAqcmVzLAogCQkJCSAgICAgICBkbWFfYWRkcl90ICpwYWdlc19hZGRyLAogCQkJCSAg
ICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2UpCiB7CiAJc3RydWN0IGFtZGdwdV92bV91cGRh
dGVfcGFyYW1zIHBhcmFtczsKKwlzdHJ1Y3QgYW1kZ3B1X3Jlc19jdXJzb3IgY3Vyc29yOwogCWVu
dW0gYW1kZ3B1X3N5bmNfbW9kZSBzeW5jX21vZGU7Ci0JdWludDY0X3QgcGZuOwogCWludCByOwog
CiAJbWVtc2V0KCZwYXJhbXMsIDAsIHNpemVvZihwYXJhbXMpKTsKQEAgLTE2MjIsMTQgKzE2MjMs
NiBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKIAllbHNlCiAJCXN5bmNfbW9kZSA9IEFNREdQVV9TWU5DX0VYUExJQ0lU
OwogCi0JcGZuID0gb2Zmc2V0ID4+IFBBR0VfU0hJRlQ7Ci0JaWYgKG5vZGVzKSB7Ci0JCXdoaWxl
IChwZm4gPj0gbm9kZXMtPnNpemUpIHsKLQkJCXBmbiAtPSBub2Rlcy0+c2l6ZTsKLQkJCSsrbm9k
ZXM7Ci0JCX0KLQl9Ci0KIAlhbWRncHVfdm1fZXZpY3Rpb25fbG9jayh2bSk7CiAJaWYgKHZtLT5l
dmljdGluZykgewogCQlyID0gLUVCVVNZOwpAQCAtMTY0OCwyMyArMTY0MSwxNyBAQCBzdGF0aWMg
aW50IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKIAlpZiAocikKIAkJZ290byBlcnJvcl91bmxvY2s7CiAKLQlkbyB7CisJYW1kZ3B1X3Jlc19m
aXJzdChyZXMsIG9mZnNldCwgKGxhc3QgLSBzdGFydCArIDEpICogQU1ER1BVX0dQVV9QQUdFX1NJ
WkUsCisJCQkgJmN1cnNvcik7CisJd2hpbGUgKGN1cnNvci5yZW1haW5pbmcpIHsKIAkJdWludDY0
X3QgdG1wLCBudW1fZW50cmllcywgYWRkcjsKIAotCi0JCW51bV9lbnRyaWVzID0gbGFzdCAtIHN0
YXJ0ICsgMTsKLQkJaWYgKG5vZGVzKSB7Ci0JCQlhZGRyID0gbm9kZXMtPnN0YXJ0IDw8IFBBR0Vf
U0hJRlQ7Ci0JCQludW1fZW50cmllcyA9IG1pbigobm9kZXMtPnNpemUgLSBwZm4pICoKLQkJCQlB
TURHUFVfR1BVX1BBR0VTX0lOX0NQVV9QQUdFLCBudW1fZW50cmllcyk7Ci0JCX0gZWxzZSB7Ci0J
CQlhZGRyID0gMDsKLQkJfQotCisJCW51bV9lbnRyaWVzID0gY3Vyc29yLnNpemUgPj4gQU1ER1BV
X0dQVV9QQUdFX1NISUZUOwogCQlpZiAocGFnZXNfYWRkcikgewogCQkJYm9vbCBjb250aWd1b3Vz
ID0gdHJ1ZTsKIAogCQkJaWYgKG51bV9lbnRyaWVzID4gQU1ER1BVX0dQVV9QQUdFU19JTl9DUFVf
UEFHRSkgeworCQkJCXVpbnQ2NF90IHBmbiA9IGN1cnNvci5zdGFydCA+PiBQQUdFX1NISUZUOwog
CQkJCXVpbnQ2NF90IGNvdW50OwogCiAJCQkJY29udGlndW91cyA9IHBhZ2VzX2FkZHJbcGZuICsg
MV0gPT0KQEAgLTE2ODQsMTYgKzE2NzEsMTggQEAgc3RhdGljIGludCBhbWRncHVfdm1fYm9fdXBk
YXRlX21hcHBpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQl9CiAKIAkJCWlmICgh
Y29udGlndW91cykgewotCQkJCWFkZHIgPSBwZm4gPDwgUEFHRV9TSElGVDsKKwkJCQlhZGRyID0g
Y3Vyc29yLnN0YXJ0OwogCQkJCXBhcmFtcy5wYWdlc19hZGRyID0gcGFnZXNfYWRkcjsKIAkJCX0g
ZWxzZSB7Ci0JCQkJYWRkciA9IHBhZ2VzX2FkZHJbcGZuXTsKKwkJCQlhZGRyID0gcGFnZXNfYWRk
cltjdXJzb3Iuc3RhcnQgPj4gUEFHRV9TSElGVF07CiAJCQkJcGFyYW1zLnBhZ2VzX2FkZHIgPSBO
VUxMOwogCQkJfQogCiAJCX0gZWxzZSBpZiAoZmxhZ3MgJiAoQU1ER1BVX1BURV9WQUxJRCB8IEFN
REdQVV9QVEVfUFJUKSkgewotCQkJYWRkciArPSBib19hZGV2LT52bV9tYW5hZ2VyLnZyYW1fYmFz
ZV9vZmZzZXQ7Ci0JCQlhZGRyICs9IHBmbiA8PCBQQUdFX1NISUZUOworCQkJYWRkciA9IGJvX2Fk
ZXYtPnZtX21hbmFnZXIudnJhbV9iYXNlX29mZnNldCArCisJCQkJY3Vyc29yLnN0YXJ0OworCQl9
IGVsc2UgeworCQkJYWRkciA9IDA7CiAJCX0KIAogCQl0bXAgPSBzdGFydCArIG51bV9lbnRyaWVz
OwpAQCAtMTcwMSwxNCArMTY5MCw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9t
YXBwaW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlpZiAocikKIAkJCWdvdG8gZXJy
b3JfdW5sb2NrOwogCi0JCXBmbiArPSBudW1fZW50cmllcyAvIEFNREdQVV9HUFVfUEFHRVNfSU5f
Q1BVX1BBR0U7Ci0JCWlmIChub2RlcyAmJiBub2Rlcy0+c2l6ZSA9PSBwZm4pIHsKLQkJCXBmbiA9
IDA7Ci0JCQkrK25vZGVzOwotCQl9CisJCWFtZGdwdV9yZXNfbmV4dCgmY3Vyc29yLCBudW1fZW50
cmllcyAqIEFNREdQVV9HUFVfUEFHRV9TSVpFKTsKIAkJc3RhcnQgPSB0bXA7Ci0KLQl9IHdoaWxl
ICh1bmxpa2VseShzdGFydCAhPSBsYXN0ICsgMSkpOworCX07CiAKIAlyID0gdm0tPnVwZGF0ZV9m
dW5jcy0+Y29tbWl0KCZwYXJhbXMsIGZlbmNlKTsKIApAQCAtMTczNyw3ICsxNzIxLDYgQEAgaW50
IGFtZGdwdV92bV9ib191cGRhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBh
bWRncHVfYm9fdmEgKmJvX3ZhLAogCXN0cnVjdCBhbWRncHVfYm9fdmFfbWFwcGluZyAqbWFwcGlu
ZzsKIAlkbWFfYWRkcl90ICpwYWdlc19hZGRyID0gTlVMTDsKIAlzdHJ1Y3QgdHRtX3Jlc291cmNl
ICptZW07Ci0Jc3RydWN0IGRybV9tbV9ub2RlICpub2RlczsKIAlzdHJ1Y3QgZG1hX2ZlbmNlICoq
bGFzdF91cGRhdGU7CiAJc3RydWN0IGRtYV9yZXN2ICpyZXN2OwogCXVpbnQ2NF90IGZsYWdzOwpA
QCAtMTc0Niw3ICsxNzI5LDYgQEAgaW50IGFtZGdwdV92bV9ib191cGRhdGUoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfYm9fdmEgKmJvX3ZhLAogCiAJaWYgKGNsZWFy
IHx8ICFibykgewogCQltZW0gPSBOVUxMOwotCQlub2RlcyA9IE5VTEw7CiAJCXJlc3YgPSB2bS0+
cm9vdC5iYXNlLmJvLT50Ym8uYmFzZS5yZXN2OwogCX0gZWxzZSB7CiAJCXN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqID0gJmJvLT50Ym8uYmFzZTsKQEAgLTE3NjEsNyArMTc0Myw2IEBAIGludCBh
bWRncHVfdm1fYm9fdXBkYXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1k
Z3B1X2JvX3ZhICpib192YSwKIAkJCQlibyA9IGdlbV90b19hbWRncHVfYm8oZ29iaik7CiAJCX0K
IAkJbWVtID0gJmJvLT50Ym8ubWVtOwotCQlub2RlcyA9IG1lbS0+bW1fbm9kZTsKIAkJaWYgKG1l
bS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RUKQogCQkJcGFnZXNfYWRkciA9IGJvLT50Ym8udHRtLT5k
bWFfYWRkcmVzczsKIAl9CkBAIC0xODEwLDcgKzE3OTEsNyBAQCBpbnQgYW1kZ3B1X3ZtX2JvX3Vw
ZGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV9ib192YSAqYm9f
dmEsCiAJCXIgPSBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcoYWRldiwgYm9fYWRldiwgdm0s
IGZhbHNlLCBmYWxzZSwKIAkJCQkJCXJlc3YsIG1hcHBpbmctPnN0YXJ0LAogCQkJCQkJbWFwcGlu
Zy0+bGFzdCwgdXBkYXRlX2ZsYWdzLAotCQkJCQkJbWFwcGluZy0+b2Zmc2V0LCBub2RlcywKKwkJ
CQkJCW1hcHBpbmctPm9mZnNldCwgbWVtLAogCQkJCQkJcGFnZXNfYWRkciwgbGFzdF91cGRhdGUp
OwogCQlpZiAocikKIAkJCXJldHVybiByOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngK

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A091645FD
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Feb 2020 14:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CF86EBEF;
	Wed, 19 Feb 2020 13:50:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E9F6EBEF;
 Wed, 19 Feb 2020 13:50:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n10so666105wrm.1;
 Wed, 19 Feb 2020 05:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2IXVDGpv1LWW0i5P2Dw6K77dUCtFyyfq4K86eQ0oZ8=;
 b=Up9Ps0MdYSLFmGOZ/EGiv43FpJlEmmjZaC1UYsRWF2oiR8ohx4KP2Xw/vNzA4MNU4A
 2Nzx0nqLgKliJXDL9FZSWBX0HXKyRQPYQ6MzgQLXiYU6RSxVw4mlUxMGPl6vr+ikaLKi
 02OaBA8YA2dhU0ncbdGX9OJI/3r3T+QdR3JGNHblBbxqa9aXHi9g+3z+KptPtq5eiKoz
 OlaUGAZ5zWmSt+C59Wq7P60p7SdbEE4dV6FARu3LA8MavTAZeiIO7p4FZVkcphrJ7Cfa
 SopTmdLl9rAGqFMPtmSDGyrE3iZYgjEgqebEptMT86dsEe6+98CbbnvV2o6lDssbSxj5
 ys+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E2IXVDGpv1LWW0i5P2Dw6K77dUCtFyyfq4K86eQ0oZ8=;
 b=WdQDBQue1E/GuAu8s1A848EchqEkZm1yj+WndgG9vkNZ2pf24T/MjI79sbrLP88K0e
 2kz0h3ZW7LwuXAZVMhkdHzzsmhyr9dQLAejXKUvkJ64/WPK9k1PhMoCHAKj4tfd9jw7o
 zABnY5cCeNH0CYwqTzLQI1m/H3jken3T931j2Vr2nvHNRwcaCioQn6pENuy8rJ1R7dl2
 0MUJ8/ZK/MWgAr51SqctJaRhc57K7pXqsmW0fFEitJV5EGbXjIMFujpIMYmhoQ/xffzZ
 XGydXX1yeYX3RP0M8VOZEU0rF/Gtf16ewbo1qYyk/jBIalIahXR0GhhGhRR7ofpo6pVd
 HyCw==
X-Gm-Message-State: APjAAAUUScFf+TaeaqQwAugsZRkYIh+e5Sc4M0dHMcxXaRFY4NXPqnNN
 Bp68CbIwb+rVvBAG9MJDp7PmJCWHUkaIPA==
X-Google-Smtp-Source: APXvYqz3SraG3qip0Mmla1vjNXg8bua+u61inhCmlaWRKSVi5Cpu/hl8UUsVYNKlrQ7HluUg3T8Q7g==
X-Received: by 2002:adf:fd43:: with SMTP id h3mr35742550wrs.169.1582120241265; 
 Wed, 19 Feb 2020 05:50:41 -0800 (PST)
Received: from brihaspati.fritz.box (p5DE53754.dip0.t-ipconnect.de.
 [93.229.55.84])
 by smtp.gmail.com with ESMTPSA id y1sm3061881wrq.16.2020.02.19.05.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 05:50:40 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] drm/amdgpu: move ttm bo->offset to amdgpu_bo
Date: Wed, 19 Feb 2020 14:53:15 +0100
Message-Id: <20200219135322.56463-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219135322.56463-1-nirmoy.das@amd.com>
References: <20200219135322.56463-1-nirmoy.das@amd.com>
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
Cc: David1.Zhou@amd.com, thellstrom@vmware.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, maarten.lankhorst@linux.intel.com,
 amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, Huang Rui <ray.huang@amd.com>, sean@poorly.run,
 christian.koenig@amd.com, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

R1BVIGFkZHJlc3Mgc2hvdWxkIGJlbG9uZyB0byBkcml2ZXIgbm90IGluIG1lbW9yeSBtYW5hZ2Vt
ZW50LgpUaGlzIHBhdGNoIG1vdmVzIHR0bSBiby5vZmZzZXQgYW5kIGdwdV9vZmZzZXQgY2FsY3Vs
YXRpb24gdG8gYW1kZ3B1IGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1v
eS5kYXNAYW1kLmNvbT4KQWNrZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIHwgMjIgKysrKysr
KysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIHwg
IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jICAgIHwgMjkgKysr
KysrKysrKysrKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5oICAgIHwgIDEgKwogNCBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwppbmRl
eCBlM2YxNmI0OWU5NzAuLjA0ZTc4Zjc4MzYzOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuYwpAQCAtOTE3LDcgKzkxNyw3IEBAIGludCBhbWRncHVfYm9fcGlu
X3Jlc3RyaWN0ZWQoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHUzMiBkb21haW4sCiAJCWJvLT5waW5f
Y291bnQrKzsKIAogCQlpZiAobWF4X29mZnNldCAhPSAwKSB7Ci0JCQl1NjQgZG9tYWluX3N0YXJ0
ID0gYm8tPnRiby5iZGV2LT5tYW5bbWVtX3R5cGVdLmdwdV9vZmZzZXQ7CisJCQl1NjQgZG9tYWlu
X3N0YXJ0ID0gYW1kZ3B1X3R0bV9kb21haW5fc3RhcnQoYWRldiwgbWVtX3R5cGUpOwogCQkJV0FS
Tl9PTl9PTkNFKG1heF9vZmZzZXQgPAogCQkJCSAgICAgKGFtZGdwdV9ib19ncHVfb2Zmc2V0KGJv
KSAtIGRvbWFpbl9zdGFydCkpOwogCQl9CkBAIC0xNDQ1LDcgKzE0NDUsMjUgQEAgdTY0IGFtZGdw
dV9ib19ncHVfb2Zmc2V0KHN0cnVjdCBhbWRncHVfYm8gKmJvKQogCVdBUk5fT05fT05DRShiby0+
dGJvLm1lbS5tZW1fdHlwZSA9PSBUVE1fUExfVlJBTSAmJgogCQkgICAgICEoYm8tPmZsYWdzICYg
QU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DT05USUdVT1VTKSk7CiAKLQlyZXR1cm4gYW1kZ3B1X2dt
Y19zaWduX2V4dGVuZChiby0+dGJvLm9mZnNldCk7CisJcmV0dXJuIGFtZGdwdV9ib19ncHVfb2Zm
c2V0X25vX2NoZWNrKGJvKTsKK30KKworLyoqCisgKiBhbWRncHVfYm9fZ3B1X29mZnNldF9ub19j
aGVjayAtIHJldHVybiBHUFUgb2Zmc2V0IG9mIGJvCisgKiBAYm86CWFtZGdwdSBvYmplY3QgZm9y
IHdoaWNoIHdlIHF1ZXJ5IHRoZSBvZmZzZXQKKyAqCisgKiBSZXR1cm5zOgorICogY3VycmVudCBH
UFUgb2Zmc2V0IG9mIHRoZSBvYmplY3Qgd2l0aG91dCByYWlzaW5nIHdhcm5pbmdzLgorICovCit1
NjQgYW1kZ3B1X2JvX2dwdV9vZmZzZXRfbm9fY2hlY2soc3RydWN0IGFtZGdwdV9ibyAqYm8pCit7
CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5i
ZGV2KTsKKwl1aW50NjRfdCBvZmZzZXQ7CisKKyAgICAgICAgb2Zmc2V0ID0gKGJvLT50Ym8ubWVt
LnN0YXJ0IDw8IFBBR0VfU0hJRlQpICsKKwkJIGFtZGdwdV90dG1fZG9tYWluX3N0YXJ0KGFkZXYs
IGJvLT50Ym8ubWVtLm1lbV90eXBlKTsKKworCXJldHVybiBhbWRncHVfZ21jX3NpZ25fZXh0ZW5k
KG9mZnNldCk7CiB9CiAKIC8qKgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29i
amVjdC5oCmluZGV4IDM2ZGVjNTFkMWVmMS4uMWQ4NmI0YzdhMWYyIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCkBAIC0yNzksNiArMjc5LDcgQEAgdm9pZCBh
bWRncHVfYm9fZmVuY2Uoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBkbWFfZmVuY2UgKmZl
bmNlLAogCQkgICAgIGJvb2wgc2hhcmVkKTsKIGludCBhbWRncHVfYm9fc3luY193YWl0KHN0cnVj
dCBhbWRncHVfYm8gKmJvLCB2b2lkICpvd25lciwgYm9vbCBpbnRyKTsKIHU2NCBhbWRncHVfYm9f
Z3B1X29mZnNldChzdHJ1Y3QgYW1kZ3B1X2JvICpibyk7Cit1NjQgYW1kZ3B1X2JvX2dwdV9vZmZz
ZXRfbm9fY2hlY2soc3RydWN0IGFtZGdwdV9ibyAqYm8pOwogaW50IGFtZGdwdV9ib192YWxpZGF0
ZShzdHJ1Y3QgYW1kZ3B1X2JvICpibyk7CiBpbnQgYW1kZ3B1X2JvX3Jlc3RvcmVfc2hhZG93KHN0
cnVjdCBhbWRncHVfYm8gKnNoYWRvdywKIAkJCSAgICAgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNl
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRleCAzYWI0NmQ0NjQ3
ZTQuLmUzMjlhMTA4ZTc2MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
YwpAQCAtOTcsNyArOTcsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9pbml0X21lbV90eXBlKHN0cnVj
dCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAogCWNhc2UgVFRNX1BMX1RUOgog
CQkvKiBHVFQgbWVtb3J5ICAqLwogCQltYW4tPmZ1bmMgPSAmYW1kZ3B1X2d0dF9tZ3JfZnVuYzsK
LQkJbWFuLT5ncHVfb2Zmc2V0ID0gYWRldi0+Z21jLmdhcnRfc3RhcnQ7CiAJCW1hbi0+YXZhaWxh
YmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5HOwogCQltYW4tPmRlZmF1bHRfY2FjaGlu
ZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKIAkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdf
TUFQUEFCTEUgfCBUVE1fTUVNVFlQRV9GTEFHX0NNQTsKQEAgLTEwNSw3ICsxMDQsNiBAQCBzdGF0
aWMgaW50IGFtZGdwdV9pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1
aW50MzJfdCB0eXBlLAogCWNhc2UgVFRNX1BMX1ZSQU06CiAJCS8qICJPbi1jYXJkIiB2aWRlbyBy
YW0gKi8KIAkJbWFuLT5mdW5jID0gJmFtZGdwdV92cmFtX21ncl9mdW5jOwotCQltYW4tPmdwdV9v
ZmZzZXQgPSBhZGV2LT5nbWMudnJhbV9zdGFydDsKIAkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBF
X0ZMQUdfRklYRUQgfAogCQkJICAgICBUVE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFOwogCQltYW4t
PmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfVU5DQUNIRUQgfCBUVE1fUExfRkxBR19X
QzsKQEAgLTExNiw3ICsxMTQsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9pbml0X21lbV90eXBlKHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAogCWNhc2UgQU1ER1BVX1BM
X09BOgogCQkvKiBPbi1jaGlwIEdEUyBtZW1vcnkqLwogCQltYW4tPmZ1bmMgPSAmdHRtX2JvX21h
bmFnZXJfZnVuYzsKLQkJbWFuLT5ncHVfb2Zmc2V0ID0gMDsKIAkJbWFuLT5mbGFncyA9IFRUTV9N
RU1UWVBFX0ZMQUdfRklYRUQgfCBUVE1fTUVNVFlQRV9GTEFHX0NNQTsKIAkJbWFuLT5hdmFpbGFi
bGVfY2FjaGluZyA9IFRUTV9QTF9GTEFHX1VOQ0FDSEVEOwogCQltYW4tPmRlZmF1bHRfY2FjaGlu
ZyA9IFRUTV9QTF9GTEFHX1VOQ0FDSEVEOwpAQCAtMjY0LDcgKzI2MSw3IEBAIHN0YXRpYyB1aW50
NjRfdCBhbWRncHVfbW1fbm9kZV9hZGRyKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAK
IAlpZiAobW1fbm9kZS0+c3RhcnQgIT0gQU1ER1BVX0JPX0lOVkFMSURfT0ZGU0VUKSB7CiAJCWFk
ZHIgPSBtbV9ub2RlLT5zdGFydCA8PCBQQUdFX1NISUZUOwotCQlhZGRyICs9IGJvLT5iZGV2LT5t
YW5bbWVtLT5tZW1fdHlwZV0uZ3B1X29mZnNldDsKKwkJYWRkciArPSBhbWRncHVfdHRtX2RvbWFp
bl9zdGFydChhbWRncHVfdHRtX2FkZXYoYm8tPmJkZXYpLCBtZW0tPm1lbV90eXBlKTsKIAl9CiAJ
cmV0dXJuIGFkZHI7CiB9CkBAIC03NTEsNiArNzQ4LDI3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25n
IGFtZGdwdV90dG1faW9fbWVtX3BmbihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQko
b2Zmc2V0ID4+IFBBR0VfU0hJRlQpOwogfQogCisvKioKKyAqIGFtZGdwdV90dG1fZG9tYWluX3N0
YXJ0IC0gUmV0dXJucyBHUFUgc3RhcnQgYWRkcmVzcworICogQGFkZXY6IGFtZGdwdSBkZXZpY2Ug
b2JqZWN0CisgKiBAdHlwZTogdHlwZSBvZiB0aGUgbWVtb3J5CisgKgorICogUmV0dXJuczoKKyAq
IEdQVSBzdGFydCBhZGRyZXNzIG9mIGEgbWVtb3J5IGRvbWFpbgorICovCisKK3VpbnQ2NF90IGFt
ZGdwdV90dG1fZG9tYWluX3N0YXJ0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJf
dCB0eXBlKQoreworCXN3aXRjaCh0eXBlKSB7CisJY2FzZSBUVE1fUExfVFQ6CisJCXJldHVybiBh
ZGV2LT5nbWMuZ2FydF9zdGFydDsKKwljYXNlIFRUTV9QTF9WUkFNOgorCQlyZXR1cm4gYWRldi0+
Z21jLnZyYW1fc3RhcnQ7CisJfQorCisJcmV0dXJuIDA7Cit9CisKIC8qCiAgKiBUVE0gYmFja2Vu
ZCBmdW5jdGlvbnMuCiAgKi8KQEAgLTExNjIsOSArMTE4MCw2IEBAIGludCBhbWRncHVfdHRtX2Fs
bG9jX2dhcnQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKIAkJYm8tPm1lbSA9IHRtcDsK
IAl9CiAKLQliby0+b2Zmc2V0ID0gKGJvLT5tZW0uc3RhcnQgPDwgUEFHRV9TSElGVCkgKwotCQli
by0+YmRldi0+bWFuW2JvLT5tZW0ubWVtX3R5cGVdLmdwdV9vZmZzZXQ7Ci0KIAlyZXR1cm4gMDsK
IH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oCmluZGV4IDBkZGRlZGMw
NmFlMy4uMmM5MGE5NWM0YjI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5oCkBAIC0xMDIsNiArMTAyLDcgQEAgaW50IGFtZGdwdV9maWxsX2J1ZmZlcihzdHJ1Y3QgYW1k
Z3B1X2JvICpibywKIGludCBhbWRncHVfbW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEpOwogaW50IGFtZGdwdV90dG1fYWxsb2NfZ2FydChzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvKTsKIGludCBhbWRncHVfdHRtX3JlY292ZXJfZ2FydChzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKnRibyk7Cit1aW50NjRfdCBhbWRncHVfdHRtX2RvbWFpbl9zdGFy
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgdHlwZSk7CiAKICNpZiBJU19F
TkFCTEVEKENPTkZJR19EUk1fQU1ER1BVX1VTRVJQVFIpCiBpbnQgYW1kZ3B1X3R0bV90dF9nZXRf
dXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcyk7Ci0t
IAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=

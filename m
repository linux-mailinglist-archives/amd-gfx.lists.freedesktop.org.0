Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA614A59F3
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 16:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6564189A7A;
	Mon,  2 Sep 2019 14:57:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE0589A7A
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 14:57:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so5513661wrx.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 02 Sep 2019 07:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jfPoPAFStj48BdjCguq0Amyima+mVi3oLVsEg8K/tcQ=;
 b=ENztpMyH8M/oQI1YJ4e593Zr+5XLV/yDBpB/ALEpXP/GlptHhHU34MDQQqnmSZ2xNG
 sbaOiSm1ASMDiDXCzN1fYG4GwIHzyfCWMdBNP5aG+YgU2sHDIvrEyetmIPpYZBOtH5Bb
 6dGa1ckNX18q+JLJBr9wfk0RpIic7bRs3vEPYBrjdcNoJGSDlPc3TkZnAFRPZyzWiTFT
 IYE5JtyGsyVFGaAG2NCBDm4kRgRciBfxOpAPAIOULdpMePX7vL81Y72SMPPRQ1JJ+3Pg
 b26c9eiigHyxK4weGB+nA1HBzzA0Rd89NjJzPhyVIbrdEmy0W3roZ8kqt43ni0tZ+ToO
 LXSA==
X-Gm-Message-State: APjAAAWc87pYjBSPDZTRAvtU804Er6CxSTHG2ziYb6Ad57TggqcthbT2
 m2d6KbJ3P21iLceTuKW5rumKksrA
X-Google-Smtp-Source: APXvYqw3n5oD4nFZtNJnuYZ7JORZOuNW5xS7WrtU6yy99jBiw4gGWv4Sq3mOoBGxSkwVAZzFTulwgg==
X-Received: by 2002:a5d:408c:: with SMTP id o12mr34885323wrp.176.1567436254029; 
 Mon, 02 Sep 2019 07:57:34 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:919b:1ba6:d244:e345])
 by smtp.gmail.com with ESMTPSA id d28sm12914573wrb.95.2019.09.02.07.57.33
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 07:57:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: cleanup mtype mapping
Date: Mon,  2 Sep 2019 16:57:31 +0200
Message-Id: <20190902145732.2567-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jfPoPAFStj48BdjCguq0Amyima+mVi3oLVsEg8K/tcQ=;
 b=lIlMLc8q8YnF6YWvgeuZMifqWkwWaZlfM2DnBcTI2M4QMFgwrniULqbdkS/RBSG2CB
 WMMXGMZk/VJIp2BIqBhcl1V/httZtWr5LfjXyXLkl4Ww5uEteYkSjRQFqaJZPW9J7Xob
 0LQx8eQr2uKsnSu0HNn33WM4tc5dfAMtDNnKhcu6V/m2vEuDv4g3Urg6rouqpu7BI/Xq
 SX2yNBRSeOql3+1RxRgj4WontDMueoLPyOhqvOjwGpUea5Zregef7tYR3QYOTlGYLVNX
 DDufBVh11QmR5xno274A9fX2ScGuuyQt5sWFjQdNVw/7o5Qf1yBrdAQRgYg7gqGwX0AU
 nKOA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VW5pZnkgaG93IHdlIG1hcCB0aGUgVUFQSSBmbGFncyB0byB0aGUgUFRFIGhhcmR3YXJlIGZsYWdz
IGZvciBhIG1hcHBpbmcuCgpPbmx5IHRoZSBNVFlQRSBpcyBhY3R1YWxseSBBU0lDIGRlcGVuZGVu
dCwgYWxsIG90aGVyIGZsYWdzIHNob3VsZCBiZQpjb3BpZWQgb3ZlciAxIHRvIDEgYW5kIEFTSUMg
ZGlmZmVyZW5jZXMgYXJlIGhhbmRsZWQgbGF0ZXIgb24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyAgICAgICB8IDMyICsrKysrKysrKysrKystCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmggICAgICAgfCAgMSArCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmggICAgICAgfCAgNyArKy0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyAgICAgICAgfCAgNiArKy0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jICAgICAgICB8IDQwICsrKysrLS0tLS0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYyAgICAgICAgIHwgMTYgLS0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYyAgICAgICAgIHwgMTYg
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYyAgICAgICAgIHwg
MTggLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICAgICAg
ICB8IDQyICsrKysrLS0tLS0tLS0tLS0tLS0KIDEwIGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlv
bnMoKyksIDEyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKaW5kZXggYjBmMGUwNjBkZWQ2Li5kOTBiNjQ3OTg1ZDcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1
dm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMKQEAgLTM4MCw3ICszODAsNyBAQCBzdGF0aWMgdWludDY0X3QgZ2V0X3B0ZV9mbGFncyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGtnZF9tZW0gKm1lbSkKIAkJCUFNREdQVV9W
TV9NVFlQRV9VQyA6IEFNREdQVV9WTV9NVFlQRV9OQzsKIAl9CiAKLQlyZXR1cm4gYW1kZ3B1X2dt
Y19nZXRfcHRlX2ZsYWdzKGFkZXYsIG1hcHBpbmdfZmxhZ3MpOworCXJldHVybiBhbWRncHVfZ2Vt
X3ZhX21hcF9mbGFncyhhZGV2LCBtYXBwaW5nX2ZsYWdzKTsKIH0KIAogLyogYWRkX2JvX3RvX3Zt
IC0gQWRkIGEgQk8gdG8gYSBWTQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5j
CmluZGV4IGU3YWYzNWM3MDgwZC4uMjJlYWI3NGQ5OTk4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dlbS5jCkBAIC01MjgsNiArNTI4LDM0IEBAIHN0YXRpYyB2b2lkIGFtZGdw
dV9nZW1fdmFfdXBkYXRlX3ZtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlEUk1fRVJS
T1IoIkNvdWxkbid0IHVwZGF0ZSBCT19WQSAoJWQpXG4iLCByKTsKIH0KIAorLyoqCisgKiBhbWRn
cHVfZ2VtX3ZhX21hcF9mbGFncyAtIG1hcCBHRU0gVUFQSSBmbGFncyBpbnRvIGhhcmR3YXJlIGZs
YWdzCisgKgorICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgorICogQGZsYWdzOiBHRU0g
VUFQSSBmbGFncworICoKKyAqIFJldHVybnMgdGhlIEdFTSBVQVBJIGZsYWdzIG1hcHBlZCBpbnRv
IGhhcmR3YXJlIGZvciB0aGUgQVNJQy4KKyAqLwordWludDY0X3QgYW1kZ3B1X2dlbV92YV9tYXBf
ZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGZsYWdzKQoreworCXVp
bnQ2NF90IHB0ZV9mbGFnID0gMDsKKworCWlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdFX0VYRUNV
VEFCTEUpCisJCXB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfRVhFQ1VUQUJMRTsKKwlpZiAoZmxhZ3Mg
JiBBTURHUFVfVk1fUEFHRV9SRUFEQUJMRSkKKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9SRUFE
QUJMRTsKKwlpZiAoZmxhZ3MgJiBBTURHUFVfVk1fUEFHRV9XUklURUFCTEUpCisJCXB0ZV9mbGFn
IHw9IEFNREdQVV9QVEVfV1JJVEVBQkxFOworCWlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdFX1BS
VCkKKwkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9QUlQ7CisKKwlpZiAoYWRldi0+Z21jLmdtY19m
dW5jcy0+bWFwX210eXBlKQorCQlwdGVfZmxhZyB8PSBhbWRncHVfZ21jX21hcF9tdHlwZShhZGV2
LAorCQkJCQkJIGZsYWdzICYgQU1ER1BVX1ZNX01UWVBFX01BU0spOworCisJcmV0dXJuIHB0ZV9m
bGFnOworfQorCiBpbnQgYW1kZ3B1X2dlbV92YV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkICpkYXRhLAogCQkJICBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHApCiB7CkBAIC02MjUsNyAr
NjUzLDcgQEAgaW50IGFtZGdwdV9nZW1fdmFfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dm9pZCAqZGF0YSwKIAogCXN3aXRjaCAoYXJncy0+b3BlcmF0aW9uKSB7CiAJY2FzZSBBTURHUFVf
VkFfT1BfTUFQOgotCQl2YV9mbGFncyA9IGFtZGdwdV9nbWNfZ2V0X3B0ZV9mbGFncyhhZGV2LCBh
cmdzLT5mbGFncyk7CisJCXZhX2ZsYWdzID0gYW1kZ3B1X2dlbV92YV9tYXBfZmxhZ3MoYWRldiwg
YXJncy0+ZmxhZ3MpOwogCQlyID0gYW1kZ3B1X3ZtX2JvX21hcChhZGV2LCBib192YSwgYXJncy0+
dmFfYWRkcmVzcywKIAkJCQkgICAgIGFyZ3MtPm9mZnNldF9pbl9ibywgYXJncy0+bWFwX3NpemUs
CiAJCQkJICAgICB2YV9mbGFncyk7CkBAIC02NDAsNyArNjY4LDcgQEAgaW50IGFtZGdwdV9nZW1f
dmFfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJCQkJCWFyZ3Mt
Pm1hcF9zaXplKTsKIAkJYnJlYWs7CiAJY2FzZSBBTURHUFVfVkFfT1BfUkVQTEFDRToKLQkJdmFf
ZmxhZ3MgPSBhbWRncHVfZ21jX2dldF9wdGVfZmxhZ3MoYWRldiwgYXJncy0+ZmxhZ3MpOworCQl2
YV9mbGFncyA9IGFtZGdwdV9nZW1fdmFfbWFwX2ZsYWdzKGFkZXYsIGFyZ3MtPmZsYWdzKTsKIAkJ
ciA9IGFtZGdwdV92bV9ib19yZXBsYWNlX21hcChhZGV2LCBib192YSwgYXJncy0+dmFfYWRkcmVz
cywKIAkJCQkJICAgICBhcmdzLT5vZmZzZXRfaW5fYm8sIGFyZ3MtPm1hcF9zaXplLAogCQkJCQkg
ICAgIHZhX2ZsYWdzKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9nZW0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uaAppbmRl
eCBiOGJhNmUyN2M2MWYuLmU2YWNiYTY1NzYzYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9nZW0uaApAQCAtNjcsNiArNjcsNyBAQCBpbnQgYW1kZ3B1X2dlbV9tbWFwX2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCQkgIHN0cnVjdCBkcm1fZmls
ZSAqZmlscCk7CiBpbnQgYW1kZ3B1X2dlbV93YWl0X2lkbGVfaW9jdGwoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJCSAgICAgIHN0cnVjdCBkcm1fZmlsZSAqZmlscCk7Cit1
aW50NjRfdCBhbWRncHVfZ2VtX3ZhX21hcF9mbGFncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgdWludDMyX3QgZmxhZ3MpOwogaW50IGFtZGdwdV9nZW1fdmFfaW9jdGwoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJCSAgc3RydWN0IGRybV9maWxlICpmaWxwKTsKIGlu
dCBhbWRncHVfZ2VtX29wX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEs
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKaW5kZXggYjZlMWQ5OGVmMDFl
Li5kNWU0NTc0YWZiYzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9nbWMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgK
QEAgLTk5LDkgKzk5LDggQEAgc3RydWN0IGFtZGdwdV9nbWNfZnVuY3MgewogCQkJCSAgIHVuc2ln
bmVkIHBhc2lkKTsKIAkvKiBlbmFibGUvZGlzYWJsZSBQUlQgc3VwcG9ydCAqLwogCXZvaWQgKCpz
ZXRfcHJ0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgYm9vbCBlbmFibGUpOwotCS8qIHNl
dCBwdGUgZmxhZ3MgYmFzZWQgcGVyIGFzaWMgKi8KLQl1aW50NjRfdCAoKmdldF92bV9wdGVfZmxh
Z3MpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotCQkJCSAgICAgdWludDMyX3QgZmxhZ3Mp
OworCS8qIG1hcCBtdHlwZSB0byBoYXJkd2FyZSBmbGFncyAqLworCXVpbnQ2NF90ICgqbWFwX210
eXBlKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgZmxhZ3MpOwogCS8qIGdl
dCB0aGUgcGRlIGZvciBhIGdpdmVuIG1jIGFkZHIgKi8KIAl2b2lkICgqZ2V0X3ZtX3BkZSkoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBsZXZlbCwKIAkJCSAgIHU2NCAqZHN0LCB1NjQg
KmZsYWdzKTsKQEAgLTE4NCw4ICsxODMsOCBAQCBzdHJ1Y3QgYW1kZ3B1X2dtYyB7CiAjZGVmaW5l
IGFtZGdwdV9nbWNfZmx1c2hfZ3B1X3RsYihhZGV2LCB2bWlkLCB2bWh1YiwgdHlwZSkgKChhZGV2
KS0+Z21jLmdtY19mdW5jcy0+Zmx1c2hfZ3B1X3RsYigoYWRldiksICh2bWlkKSwgKHZtaHViKSwg
KHR5cGUpKSkKICNkZWZpbmUgYW1kZ3B1X2dtY19lbWl0X2ZsdXNoX2dwdV90bGIociwgdm1pZCwg
YWRkcikgKHIpLT5hZGV2LT5nbWMuZ21jX2Z1bmNzLT5lbWl0X2ZsdXNoX2dwdV90bGIoKHIpLCAo
dm1pZCksIChhZGRyKSkKICNkZWZpbmUgYW1kZ3B1X2dtY19lbWl0X3Bhc2lkX21hcHBpbmcociwg
dm1pZCwgcGFzaWQpIChyKS0+YWRldi0+Z21jLmdtY19mdW5jcy0+ZW1pdF9wYXNpZF9tYXBwaW5n
KChyKSwgKHZtaWQpLCAocGFzaWQpKQorI2RlZmluZSBhbWRncHVfZ21jX21hcF9tdHlwZShhZGV2
LCBmbGFncykgKGFkZXYpLT5nbWMuZ21jX2Z1bmNzLT5tYXBfbXR5cGUoKGFkZXYpLChmbGFncykp
CiAjZGVmaW5lIGFtZGdwdV9nbWNfZ2V0X3ZtX3BkZShhZGV2LCBsZXZlbCwgZHN0LCBmbGFncykg
KGFkZXYpLT5nbWMuZ21jX2Z1bmNzLT5nZXRfdm1fcGRlKChhZGV2KSwgKGxldmVsKSwgKGRzdCks
IChmbGFncykpCi0jZGVmaW5lIGFtZGdwdV9nbWNfZ2V0X3B0ZV9mbGFncyhhZGV2LCBmbGFncykg
KGFkZXYpLT5nbWMuZ21jX2Z1bmNzLT5nZXRfdm1fcHRlX2ZsYWdzKChhZGV2KSwoZmxhZ3MpKQog
CiAvKioKICAqIGFtZGdwdV9nbWNfdnJhbV9mdWxsX3Zpc2libGUgLSBDaGVjayBpZiBmdWxsIFZS
QU0gaXMgdmlzaWJsZSB0aHJvdWdoIHRoZSBCQVIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmMKaW5kZXggNTAxZTEzNDIwNzg2Li4yY2I4MmIyMjk4MDIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBAIC0xNTcxLDggKzE1NzEsMTAgQEAgc3RhdGljIGlu
dCBhbWRncHVfdm1fYm9fc3BsaXRfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
IAlpZiAoIShtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVfV1JJVEVBQkxFKSkKIAkJZmxhZ3Mg
Jj0gfkFNREdQVV9QVEVfV1JJVEVBQkxFOwogCi0JZmxhZ3MgJj0gfkFNREdQVV9QVEVfRVhFQ1VU
QUJMRTsKLQlmbGFncyB8PSBtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVfRVhFQ1VUQUJMRTsK
KwlpZiAoYWRldi0+YXNpY190eXBlID49IENISVBfVE9OR0EpIHsKKwkJZmxhZ3MgJj0gfkFNREdQ
VV9QVEVfRVhFQ1VUQUJMRTsKKwkJZmxhZ3MgfD0gbWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRF
X0VYRUNVVEFCTEU7CisJfQogCiAJaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX05BVkkxMCkg
ewogCQlmbGFncyAmPSB+QU1ER1BVX1BURV9NVFlQRV9OVjEwX01BU0s7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192MTBfMC5jCmluZGV4IDQ2ZWZkNGQxN2EzNC4uN2ViMGJhODdmZWY5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYwpAQCAtMzk3LDQzICszOTcsMjMg
QEAgc3RhdGljIHZvaWQgZ21jX3YxMF8wX2VtaXRfcGFzaWRfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcsIHVuc2lnbmVkIHZtaWQKICAqIDEgc3lzdGVtCiAgKiAwIHZhbGlkCiAgKi8K
LXN0YXRpYyB1aW50NjRfdCBnbWNfdjEwXzBfZ2V0X3ZtX3B0ZV9mbGFncyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKLQkJCQkJICAgdWludDMyX3QgZmxhZ3MpCi17Ci0JdWludDY0X3QgcHRl
X2ZsYWcgPSAwOwotCi0JaWYgKGZsYWdzICYgQU1ER1BVX1ZNX1BBR0VfRVhFQ1VUQUJMRSkKLQkJ
cHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9FWEVDVVRBQkxFOwotCWlmIChmbGFncyAmIEFNREdQVV9W
TV9QQUdFX1JFQURBQkxFKQotCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX1JFQURBQkxFOwotCWlm
IChmbGFncyAmIEFNREdQVV9WTV9QQUdFX1dSSVRFQUJMRSkKLQkJcHRlX2ZsYWcgfD0gQU1ER1BV
X1BURV9XUklURUFCTEU7CiAKLQlzd2l0Y2ggKGZsYWdzICYgQU1ER1BVX1ZNX01UWVBFX01BU0sp
IHsKK3N0YXRpYyB1aW50NjRfdCBnbWNfdjEwXzBfbWFwX210eXBlKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCB1aW50MzJfdCBmbGFncykKK3sKKwlzd2l0Y2ggKGZsYWdzKSB7CiAJY2FzZSBB
TURHUFVfVk1fTVRZUEVfREVGQVVMVDoKLQkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9NVFlQRV9O
VjEwKE1UWVBFX05DKTsKLQkJYnJlYWs7CisJCXJldHVybiBBTURHUFVfUFRFX01UWVBFX05WMTAo
TVRZUEVfTkMpOwogCWNhc2UgQU1ER1BVX1ZNX01UWVBFX05DOgotCQlwdGVfZmxhZyB8PSBBTURH
UFVfUFRFX01UWVBFX05WMTAoTVRZUEVfTkMpOwotCQlicmVhazsKKwkJcmV0dXJuIEFNREdQVV9Q
VEVfTVRZUEVfTlYxMChNVFlQRV9OQyk7CiAJY2FzZSBBTURHUFVfVk1fTVRZUEVfV0M6Ci0JCXB0
ZV9mbGFnIHw9IEFNREdQVV9QVEVfTVRZUEVfTlYxMChNVFlQRV9XQyk7Ci0JCWJyZWFrOworCQly
ZXR1cm4gQU1ER1BVX1BURV9NVFlQRV9OVjEwKE1UWVBFX1dDKTsKIAljYXNlIEFNREdQVV9WTV9N
VFlQRV9DQzoKLQkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9NVFlQRV9OVjEwKE1UWVBFX0NDKTsK
LQkJYnJlYWs7CisJCXJldHVybiBBTURHUFVfUFRFX01UWVBFX05WMTAoTVRZUEVfQ0MpOwogCWNh
c2UgQU1ER1BVX1ZNX01UWVBFX1VDOgotCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX01UWVBFX05W
MTAoTVRZUEVfVUMpOwotCQlicmVhazsKKwkJcmV0dXJuIEFNREdQVV9QVEVfTVRZUEVfTlYxMChN
VFlQRV9VQyk7CiAJZGVmYXVsdDoKLQkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9NVFlQRV9OVjEw
KE1UWVBFX05DKTsKLQkJYnJlYWs7CisJCXJldHVybiBBTURHUFVfUFRFX01UWVBFX05WMTAoTVRZ
UEVfTkMpOwogCX0KLQotCWlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdFX1BSVCkKLQkJcHRlX2Zs
YWcgfD0gQU1ER1BVX1BURV9QUlQ7Ci0KLQlyZXR1cm4gcHRlX2ZsYWc7CiB9CiAKIHN0YXRpYyB2
b2lkIGdtY192MTBfMF9nZXRfdm1fcGRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQg
bGV2ZWwsCkBAIC00NjQsNyArNDQ0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21j
X2Z1bmNzIGdtY192MTBfMF9nbWNfZnVuY3MgPSB7CiAJLmZsdXNoX2dwdV90bGIgPSBnbWNfdjEw
XzBfZmx1c2hfZ3B1X3RsYiwKIAkuZW1pdF9mbHVzaF9ncHVfdGxiID0gZ21jX3YxMF8wX2VtaXRf
Zmx1c2hfZ3B1X3RsYiwKIAkuZW1pdF9wYXNpZF9tYXBwaW5nID0gZ21jX3YxMF8wX2VtaXRfcGFz
aWRfbWFwcGluZywKLQkuZ2V0X3ZtX3B0ZV9mbGFncyA9IGdtY192MTBfMF9nZXRfdm1fcHRlX2Zs
YWdzLAorCS5tYXBfbXR5cGUgPSBnbWNfdjEwXzBfbWFwX210eXBlLAogCS5nZXRfdm1fcGRlID0g
Z21jX3YxMF8wX2dldF92bV9wZGUKIH07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192Nl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZf
MC5jCmluZGV4IDMyNjQ1NDhlMzc1Yy4uMmUzMDViMjFkYjY5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192Nl8wLmMKQEAgLTM4MywyMSArMzgzLDYgQEAgc3RhdGljIHVpbnQ2NF90IGdt
Y192Nl8wX2VtaXRfZmx1c2hfZ3B1X3RsYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCiAJcmV0
dXJuIHBkX2FkZHI7CiB9CiAKLXN0YXRpYyB1aW50NjRfdCBnbWNfdjZfMF9nZXRfdm1fcHRlX2Zs
YWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotCQkJCQkgIHVpbnQzMl90IGZsYWdzKQot
ewotCXVpbnQ2NF90IHB0ZV9mbGFnID0gMDsKLQotCWlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdF
X1JFQURBQkxFKQotCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX1JFQURBQkxFOwotCWlmIChmbGFn
cyAmIEFNREdQVV9WTV9QQUdFX1dSSVRFQUJMRSkKLQkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9X
UklURUFCTEU7Ci0JaWYgKGZsYWdzICYgQU1ER1BVX1ZNX1BBR0VfUFJUKQotCQlwdGVfZmxhZyB8
PSBBTURHUFVfUFRFX1BSVDsKLQotCXJldHVybiBwdGVfZmxhZzsKLX0KLQogc3RhdGljIHZvaWQg
Z21jX3Y2XzBfZ2V0X3ZtX3BkZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxldmVs
LAogCQkJCXVpbnQ2NF90ICphZGRyLCB1aW50NjRfdCAqZmxhZ3MpCiB7CkBAIC0xMTU5LDcgKzEx
NDQsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3Y2XzBfZ21j
X2Z1bmNzID0gewogCS5lbWl0X2ZsdXNoX2dwdV90bGIgPSBnbWNfdjZfMF9lbWl0X2ZsdXNoX2dw
dV90bGIsCiAJLnNldF9wcnQgPSBnbWNfdjZfMF9zZXRfcHJ0LAogCS5nZXRfdm1fcGRlID0gZ21j
X3Y2XzBfZ2V0X3ZtX3BkZSwKLQkuZ2V0X3ZtX3B0ZV9mbGFncyA9IGdtY192Nl8wX2dldF92bV9w
dGVfZmxhZ3MKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3Mg
Z21jX3Y2XzBfaXJxX2Z1bmNzID0gewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y3XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMK
aW5kZXggY2MwYWExNzhlYjJkLi4zYjc3NDIxMjM0YTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y3XzAuYwpAQCAtNDYwLDIxICs0NjAsNiBAQCBzdGF0aWMgdm9pZCBnbWNfdjdfMF9l
bWl0X3Bhc2lkX21hcHBpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1bnNpZ25lZCB2bWlk
LAogCWFtZGdwdV9yaW5nX2VtaXRfd3JlZyhyaW5nLCBtbUlIX1ZNSURfMF9MVVQgKyB2bWlkLCBw
YXNpZCk7CiB9CiAKLXN0YXRpYyB1aW50NjRfdCBnbWNfdjdfMF9nZXRfdm1fcHRlX2ZsYWdzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotCQkJCQkgIHVpbnQzMl90IGZsYWdzKQotewotCXVp
bnQ2NF90IHB0ZV9mbGFnID0gMDsKLQotCWlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdFX1JFQURB
QkxFKQotCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX1JFQURBQkxFOwotCWlmIChmbGFncyAmIEFN
REdQVV9WTV9QQUdFX1dSSVRFQUJMRSkKLQkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9XUklURUFC
TEU7Ci0JaWYgKGZsYWdzICYgQU1ER1BVX1ZNX1BBR0VfUFJUKQotCQlwdGVfZmxhZyB8PSBBTURH
UFVfUFRFX1BSVDsKLQotCXJldHVybiBwdGVfZmxhZzsKLX0KLQogc3RhdGljIHZvaWQgZ21jX3Y3
XzBfZ2V0X3ZtX3BkZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxldmVsLAogCQkJ
CXVpbnQ2NF90ICphZGRyLCB1aW50NjRfdCAqZmxhZ3MpCiB7CkBAIC0xMzU0LDcgKzEzMzksNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3Y3XzBfZ21jX2Z1bmNz
ID0gewogCS5lbWl0X2ZsdXNoX2dwdV90bGIgPSBnbWNfdjdfMF9lbWl0X2ZsdXNoX2dwdV90bGIs
CiAJLmVtaXRfcGFzaWRfbWFwcGluZyA9IGdtY192N18wX2VtaXRfcGFzaWRfbWFwcGluZywKIAku
c2V0X3BydCA9IGdtY192N18wX3NldF9wcnQsCi0JLmdldF92bV9wdGVfZmxhZ3MgPSBnbWNfdjdf
MF9nZXRfdm1fcHRlX2ZsYWdzLAogCS5nZXRfdm1fcGRlID0gZ21jX3Y3XzBfZ2V0X3ZtX3BkZQog
fTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMKaW5kZXggODhmM2ExNzE0NTJm
Li41ODQ0NGFhMGFmMDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYwpAQCAt
NjgzLDIzICs2ODMsNiBAQCBzdGF0aWMgdm9pZCBnbWNfdjhfMF9lbWl0X3Bhc2lkX21hcHBpbmco
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1bnNpZ25lZCB2bWlkLAogICogMCB2YWxpZAogICov
CiAKLXN0YXRpYyB1aW50NjRfdCBnbWNfdjhfMF9nZXRfdm1fcHRlX2ZsYWdzKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAotCQkJCQkgIHVpbnQzMl90IGZsYWdzKQotewotCXVpbnQ2NF90IHB0
ZV9mbGFnID0gMDsKLQotCWlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdFX0VYRUNVVEFCTEUpCi0J
CXB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfRVhFQ1VUQUJMRTsKLQlpZiAoZmxhZ3MgJiBBTURHUFVf
Vk1fUEFHRV9SRUFEQUJMRSkKLQkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9SRUFEQUJMRTsKLQlp
ZiAoZmxhZ3MgJiBBTURHUFVfVk1fUEFHRV9XUklURUFCTEUpCi0JCXB0ZV9mbGFnIHw9IEFNREdQ
VV9QVEVfV1JJVEVBQkxFOwotCWlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdFX1BSVCkKLQkJcHRl
X2ZsYWcgfD0gQU1ER1BVX1BURV9QUlQ7Ci0KLQlyZXR1cm4gcHRlX2ZsYWc7Ci19Ci0KIHN0YXRp
YyB2b2lkIGdtY192OF8wX2dldF92bV9wZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGlu
dCBsZXZlbCwKIAkJCQl1aW50NjRfdCAqYWRkciwgdWludDY0X3QgKmZsYWdzKQogewpAQCAtMTcy
Miw3ICsxNzA1LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192
OF8wX2dtY19mdW5jcyA9IHsKIAkuZW1pdF9mbHVzaF9ncHVfdGxiID0gZ21jX3Y4XzBfZW1pdF9m
bHVzaF9ncHVfdGxiLAogCS5lbWl0X3Bhc2lkX21hcHBpbmcgPSBnbWNfdjhfMF9lbWl0X3Bhc2lk
X21hcHBpbmcsCiAJLnNldF9wcnQgPSBnbWNfdjhfMF9zZXRfcHJ0LAotCS5nZXRfdm1fcHRlX2Zs
YWdzID0gZ21jX3Y4XzBfZ2V0X3ZtX3B0ZV9mbGFncywKIAkuZ2V0X3ZtX3BkZSA9IGdtY192OF8w
X2dldF92bV9wZGUKIH07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4
IGFmMDY5YTQ4MzdmYS4uMjI2NjBlMTAwNWRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMKQEAgLTU4MCw0NyArNTgwLDI1IEBAIHN0YXRpYyB2b2lkIGdtY192OV8wX2VtaXRf
cGFzaWRfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVuc2lnbmVkIHZtaWQsCiAg
KiAwIHZhbGlkCiAgKi8KIAotc3RhdGljIHVpbnQ2NF90IGdtY192OV8wX2dldF92bV9wdGVfZmxh
Z3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCi0JCQkJCQl1aW50MzJfdCBmbGFncykKK3N0
YXRpYyB1aW50NjRfdCBnbWNfdjlfMF9tYXBfbXR5cGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHVpbnQzMl90IGZsYWdzKQogCiB7Ci0JdWludDY0X3QgcHRlX2ZsYWcgPSAwOwotCi0JaWYg
KGZsYWdzICYgQU1ER1BVX1ZNX1BBR0VfRVhFQ1VUQUJMRSkKLQkJcHRlX2ZsYWcgfD0gQU1ER1BV
X1BURV9FWEVDVVRBQkxFOwotCWlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdFX1JFQURBQkxFKQot
CQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX1JFQURBQkxFOwotCWlmIChmbGFncyAmIEFNREdQVV9W
TV9QQUdFX1dSSVRFQUJMRSkKLQkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9XUklURUFCTEU7Ci0K
LQlzd2l0Y2ggKGZsYWdzICYgQU1ER1BVX1ZNX01UWVBFX01BU0spIHsKKwlzd2l0Y2ggKGZsYWdz
KSB7CiAJY2FzZSBBTURHUFVfVk1fTVRZUEVfREVGQVVMVDoKLQkJcHRlX2ZsYWcgfD0gQU1ER1BV
X1BURV9NVFlQRV9WRzEwKE1UWVBFX05DKTsKLQkJYnJlYWs7CisJCXJldHVybiBBTURHUFVfUFRF
X01UWVBFX1ZHMTAoTVRZUEVfTkMpOwogCWNhc2UgQU1ER1BVX1ZNX01UWVBFX05DOgotCQlwdGVf
ZmxhZyB8PSBBTURHUFVfUFRFX01UWVBFX1ZHMTAoTVRZUEVfTkMpOwotCQlicmVhazsKKwkJcmV0
dXJuIEFNREdQVV9QVEVfTVRZUEVfVkcxMChNVFlQRV9OQyk7CiAJY2FzZSBBTURHUFVfVk1fTVRZ
UEVfV0M6Ci0JCXB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfTVRZUEVfVkcxMChNVFlQRV9XQyk7Ci0J
CWJyZWFrOworCQlyZXR1cm4gQU1ER1BVX1BURV9NVFlQRV9WRzEwKE1UWVBFX1dDKTsKIAljYXNl
IEFNREdQVV9WTV9NVFlQRV9SVzoKLQkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9NVFlQRV9WRzEw
KE1UWVBFX1JXKTsKLQkJYnJlYWs7CisJCXJldHVybiBBTURHUFVfUFRFX01UWVBFX1ZHMTAoTVRZ
UEVfUlcpOwogCWNhc2UgQU1ER1BVX1ZNX01UWVBFX0NDOgotCQlwdGVfZmxhZyB8PSBBTURHUFVf
UFRFX01UWVBFX1ZHMTAoTVRZUEVfQ0MpOwotCQlicmVhazsKKwkJcmV0dXJuIEFNREdQVV9QVEVf
TVRZUEVfVkcxMChNVFlQRV9DQyk7CiAJY2FzZSBBTURHUFVfVk1fTVRZUEVfVUM6Ci0JCXB0ZV9m
bGFnIHw9IEFNREdQVV9QVEVfTVRZUEVfVkcxMChNVFlQRV9VQyk7Ci0JCWJyZWFrOworCQlyZXR1
cm4gQU1ER1BVX1BURV9NVFlQRV9WRzEwKE1UWVBFX1VDKTsKIAlkZWZhdWx0OgotCQlwdGVfZmxh
ZyB8PSBBTURHUFVfUFRFX01UWVBFX1ZHMTAoTVRZUEVfTkMpOwotCQlicmVhazsKKwkJcmV0dXJu
IEFNREdQVV9QVEVfTVRZUEVfVkcxMChNVFlQRV9OQyk7CiAJfQotCi0JaWYgKGZsYWdzICYgQU1E
R1BVX1ZNX1BBR0VfUFJUKQotCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX1BSVDsKLQotCXJldHVy
biBwdGVfZmxhZzsKIH0KIAogc3RhdGljIHZvaWQgZ21jX3Y5XzBfZ2V0X3ZtX3BkZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxldmVsLApAQCAtNjUxLDcgKzYyOSw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2dtY19mdW5jcyBnbWNfdjlfMF9nbWNfZnVuY3MgPSB7CiAJ
LmZsdXNoX2dwdV90bGIgPSBnbWNfdjlfMF9mbHVzaF9ncHVfdGxiLAogCS5lbWl0X2ZsdXNoX2dw
dV90bGIgPSBnbWNfdjlfMF9lbWl0X2ZsdXNoX2dwdV90bGIsCiAJLmVtaXRfcGFzaWRfbWFwcGlu
ZyA9IGdtY192OV8wX2VtaXRfcGFzaWRfbWFwcGluZywKLQkuZ2V0X3ZtX3B0ZV9mbGFncyA9IGdt
Y192OV8wX2dldF92bV9wdGVfZmxhZ3MsCisJLm1hcF9tdHlwZSA9IGdtY192OV8wX21hcF9tdHlw
ZSwKIAkuZ2V0X3ZtX3BkZSA9IGdtY192OV8wX2dldF92bV9wZGUKIH07CiAKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

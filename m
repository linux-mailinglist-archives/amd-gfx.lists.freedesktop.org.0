Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536DA32BA16
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Mar 2021 20:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563756E0B9;
	Wed,  3 Mar 2021 19:05:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47206E9C3;
 Wed,  3 Mar 2021 19:05:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B68F64EF3;
 Wed,  3 Mar 2021 19:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614798300;
 bh=85Krc/tdNXUI3941UDLi7ozDpdfAZuOSRnkZa35g1kM=;
 h=Date:From:To:Cc:Subject:From;
 b=Czbt8bsGw83pm7DsyPtBp60PbC2vRLv45EW9WesL6mrzf8U0cCF4V3GC4Wum9lCR/
 gun0VvIN9ouEhwN9lxQ/uCMa54OJuLxyYSCnxn3eris/JPNlxSG5ggGpj6hVxXQIcB
 bs8WgZ0/LlKV18H26C/rnVr4c4LyYQTIngNrdSc7c68tNRITvLKBMVTXWrlsm0edIT
 aKbOEFWpGWYr/ChbRSmupaAb8nD0WUMW6JzafXAFf+o7PoDeWPXILAR/r3xO1UTx0D
 W48Ioah28TJAwNsKVPXe+k8UjkFyzdVSo8o1u3Ph/ZlBYaj+kg+VuDQrsHwrlHFBmd
 D2QVmjSdymwaA==
Date: Wed, 3 Mar 2021 13:04:58 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/radeon/si_dpm: Replace one-element array with
 flexible-array in struct SISLANDS_SMC_SWSTATE
Message-ID: <20210303190458.GA16321@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4gdGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRv
IGRlY2xhcmUgaGF2aW5nCmEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1l
bnRzIGluIGEgc3RydWN0dXJlLiBLZXJuZWwgY29kZQpzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4
aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZSBjYXNlcy4gVGhlIG9sZGVyCnN0eWxl
IG9mIG9uZS1lbGVtZW50IG9yIHplcm8tbGVuZ3RoIGFycmF5cyBzaG91bGQgbm8gbG9uZ2VyIGJl
IHVzZWRbMl0uCgpSZWZhY3RvciB0aGUgY29kZSBhY2NvcmRpbmcgdG8gdGhlIHVzZSBvZiBhIGZs
ZXhpYmxlLWFycmF5IG1lbWJlciBpbgpzdHJ1Y3QgU0lTTEFORFNfU01DX1NXU1RBVEUsIGluc3Rl
YWQgb2YgYSBvbmUtZWxlbWVudCBhcnJheSwgYW5kIHVzZQp0aGUgc3RydWN0X3NpemUoKSBoZWxw
ZXIgdG8gY2FsY3VsYXRlIHRoZSBzaXplIGZvciB0aGUgYWxsb2NhdGlvbi4KCkFsc28sIHRoaXMg
aGVscHMgd2l0aCB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsZSAtV2FycmF5LWJvdW5kcyBi
eQpmaXhpbmcgdGhlIGZvbGxvd2luZyB3YXJuaW5nczoKCmRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
c2lfZHBtLmM6IEluIGZ1bmN0aW9uIOKAmHNpX2NvbnZlcnRfcG93ZXJfc3RhdGVfdG9fc21j4oCZ
Ogpkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jOjIzNTA6MjA6IHdhcm5pbmc6IGFycmF5
IHN1YnNjcmlwdCAxIGlzIGFib3ZlIGFycmF5IGJvdW5kcyBvZiDigJhTSVNMQU5EU19TTUNfSFdf
UEVSRk9STUFOQ0VfTEVWRUxbMV3igJkge2FrYSDigJhzdHJ1Y3QgU0lTTEFORFNfU01DX0hXX1BF
UkZPUk1BTkNFX0xFVkVMWzFd4oCZfSBbLVdhcnJheS1ib3VuZHNdCiAyMzUwIHwgICBzbWNfc3Rh
dGUtPmxldmVsc1tpXS5kcG0yLk1heFBTID0gKHU4KSgoU0lTTEFORFNfRFBNMl9NQVhfUFVMU0Vf
U0tJUCAqIChtYXhfc2NsayAtIG1pbl9zY2xrKSkgLyBtYXhfc2Nsayk7CiAgICAgIHwgICB+fn5+
fn5+fn5+fn5+fn5+fl5+fgpkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jOjIzNTE6MjA6
IHdhcm5pbmc6IGFycmF5IHN1YnNjcmlwdCAxIGlzIGFib3ZlIGFycmF5IGJvdW5kcyBvZiDigJhT
SVNMQU5EU19TTUNfSFdfUEVSRk9STUFOQ0VfTEVWRUxbMV3igJkge2FrYSDigJhzdHJ1Y3QgU0lT
TEFORFNfU01DX0hXX1BFUkZPUk1BTkNFX0xFVkVMWzFd4oCZfSBbLVdhcnJheS1ib3VuZHNdCiAy
MzUxIHwgICBzbWNfc3RhdGUtPmxldmVsc1tpXS5kcG0yLk5lYXJURFBEZWMgPSBTSVNMQU5EU19E
UE0yX05FQVJfVERQX0RFQzsKICAgICAgfCAgIH5+fn5+fn5+fn5+fn5+fn5+Xn5+CmRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vc2lfZHBtLmM6MjM1MjoyMDogd2FybmluZzogYXJyYXkgc3Vic2NyaXB0
IDEgaXMgYWJvdmUgYXJyYXkgYm91bmRzIG9mIOKAmFNJU0xBTkRTX1NNQ19IV19QRVJGT1JNQU5D
RV9MRVZFTFsxXeKAmSB7YWthIOKAmHN0cnVjdCBTSVNMQU5EU19TTUNfSFdfUEVSRk9STUFOQ0Vf
TEVWRUxbMV3igJl9IFstV2FycmF5LWJvdW5kc10KIDIzNTIgfCAgIHNtY19zdGF0ZS0+bGV2ZWxz
W2ldLmRwbTIuQWJvdmVTYWZlSW5jID0gU0lTTEFORFNfRFBNMl9BQk9WRV9TQUZFX0lOQzsKICAg
ICAgfCAgIH5+fn5+fn5+fn5+fn5+fn5+Xn5+CmRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBt
LmM6MjM1MzoyMDogd2FybmluZzogYXJyYXkgc3Vic2NyaXB0IDEgaXMgYWJvdmUgYXJyYXkgYm91
bmRzIG9mIOKAmFNJU0xBTkRTX1NNQ19IV19QRVJGT1JNQU5DRV9MRVZFTFsxXeKAmSB7YWthIOKA
mHN0cnVjdCBTSVNMQU5EU19TTUNfSFdfUEVSRk9STUFOQ0VfTEVWRUxbMV3igJl9IFstV2FycmF5
LWJvdW5kc10KIDIzNTMgfCAgIHNtY19zdGF0ZS0+bGV2ZWxzW2ldLmRwbTIuQmVsb3dTYWZlSW5j
ID0gU0lTTEFORFNfRFBNMl9CRUxPV19TQUZFX0lOQzsKICAgICAgfCAgIH5+fn5+fn5+fn5+fn5+
fn5+Xn5+CmRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmM6MjM1NDoyMDogd2FybmluZzog
YXJyYXkgc3Vic2NyaXB0IDEgaXMgYWJvdmUgYXJyYXkgYm91bmRzIG9mIOKAmFNJU0xBTkRTX1NN
Q19IV19QRVJGT1JNQU5DRV9MRVZFTFsxXeKAmSB7YWthIOKAmHN0cnVjdCBTSVNMQU5EU19TTUNf
SFdfUEVSRk9STUFOQ0VfTEVWRUxbMV3igJl9IFstV2FycmF5LWJvdW5kc10KIDIzNTQgfCAgIHNt
Y19zdGF0ZS0+bGV2ZWxzW2ldLmRwbTIuUHdyRWZmaWNpZW5jeVJhdGlvID0gY3B1X3RvX2JlMTYo
cHdyX2VmZmljaWVuY3lfcmF0aW8pOwogICAgICB8ICAgfn5+fn5+fn5+fn5+fn5+fn5efn4KZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYzo1MTA1OjIwOiB3YXJuaW5nOiBhcnJheSBzdWJz
Y3JpcHQgMSBpcyBhYm92ZSBhcnJheSBib3VuZHMgb2Yg4oCYU0lTTEFORFNfU01DX0hXX1BFUkZP
Uk1BTkNFX0xFVkVMWzFd4oCZIHtha2Eg4oCYc3RydWN0IFNJU0xBTkRTX1NNQ19IV19QRVJGT1JN
QU5DRV9MRVZFTFsxXeKAmX0gWy1XYXJyYXktYm91bmRzXQogNTEwNSB8ICAgc21jX3N0YXRlLT5s
ZXZlbHNbaSArIDFdLmFUID0gY3B1X3RvX2JlMzIoYV90KTsKICAgICAgfCAgIH5+fn5+fn5+fn5+
fn5+fn5+Xn5+fn5+fgoKWzFdIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0ZsZXhpYmxl
X2FycmF5X21lbWJlcgpbMl0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS45L3By
b2Nlc3MvZGVwcmVjYXRlZC5odG1sI3plcm8tbGVuZ3RoLWFuZC1vbmUtZWxlbWVudC1hcnJheXMK
Ckxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy83OQpMaW5rOiBodHRw
czovL2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvMTA5CkJ1aWxkLXRlc3RlZC1ieToga2Vy
bmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvNjAzZjlhOGYuYURMcnBNRnp6U0FwelZZUSUyNWxrcEBpbnRlbC5jb20vClNpZ25l
ZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jICAgICAgIHwgIDUgKystLS0KIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vc2lzbGFuZHNfc21jLmggfCAxMCArKysrKy0tLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9z
aV9kcG0uYwppbmRleCA5MWJmYzQ3NjI3NjcuLjkxODYwOTU1MTgwNCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3NpX2RwbS5jCkBAIC01MjUwLDEwICs1MjUwLDkgQEAgc3RhdGljIGludCBzaV91cGxvYWRfc3df
c3RhdGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCiAJaW50IHJldDsKIAl1MzIgYWRkcmVz
cyA9IHNpX3BpLT5zdGF0ZV90YWJsZV9zdGFydCArCiAJCW9mZnNldG9mKFNJU0xBTkRTX1NNQ19T
VEFURVRBQkxFLCBkcml2ZXJTdGF0ZSk7Ci0JdTMyIHN0YXRlX3NpemUgPSBzaXplb2YoU0lTTEFO
RFNfU01DX1NXU1RBVEUpICsKLQkJKChuZXdfc3RhdGUtPnBlcmZvcm1hbmNlX2xldmVsX2NvdW50
IC0gMSkgKgotCQkgc2l6ZW9mKFNJU0xBTkRTX1NNQ19IV19QRVJGT1JNQU5DRV9MRVZFTCkpOwog
CVNJU0xBTkRTX1NNQ19TV1NUQVRFICpzbWNfc3RhdGUgPSAmc2lfcGktPnNtY19zdGF0ZXRhYmxl
LmRyaXZlclN0YXRlOworCXNpemVfdCBzdGF0ZV9zaXplID0gc3RydWN0X3NpemUoc21jX3N0YXRl
LCBsZXZlbHMsCisJCQkJCW5ld19zdGF0ZS0+cGVyZm9ybWFuY2VfbGV2ZWxfY291bnQpOwogCiAJ
bWVtc2V0KHNtY19zdGF0ZSwgMCwgc3RhdGVfc2l6ZSk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vc2lzbGFuZHNfc21jLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Np
c2xhbmRzX3NtYy5oCmluZGV4IDk2NmUzYTU1NjAxMS4uZmJkNjU4OWJkYWI5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Npc2xhbmRzX3NtYy5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vc2lzbGFuZHNfc21jLmgKQEAgLTE4MiwxMSArMTgyLDExIEBAIHR5cGVkZWYg
c3RydWN0IFNJU0xBTkRTX1NNQ19IV19QRVJGT1JNQU5DRV9MRVZFTCBTSVNMQU5EU19TTUNfSFdf
UEVSRk9STUFOQ0VfTEVWCiAKIHN0cnVjdCBTSVNMQU5EU19TTUNfU1dTVEFURQogewotICAgIHVp
bnQ4X3QgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsYWdzOwotICAgIHVpbnQ4X3QgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxldmVsQ291bnQ7Ci0gICAgdWludDhfdCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFkZGluZzI7Ci0gICAgdWludDhfdCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFkZGluZzM7Ci0gICAgU0lTTEFORFNfU01DX0hXX1BFUkZPUk1BTkNF
X0xFVkVMICAgbGV2ZWxzWzFdOworCXVpbnQ4X3QgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZsYWdzOworCXVpbnQ4X3QgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxldmVsQ291bnQ7
CisJdWludDhfdCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZGluZzI7CisJdWludDhf
dCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZGluZzM7CisJU0lTTEFORFNfU01DX0hX
X1BFUkZPUk1BTkNFX0xFVkVMICAgbGV2ZWxzW107CiB9OwogCiB0eXBlZGVmIHN0cnVjdCBTSVNM
QU5EU19TTUNfU1dTVEFURSBTSVNMQU5EU19TTUNfU1dTVEFURTsKLS0gCjIuMjcuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==

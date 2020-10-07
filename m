Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7C0286304
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Oct 2020 18:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620DA6E947;
	Wed,  7 Oct 2020 16:02:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24E96E947;
 Wed,  7 Oct 2020 16:02:53 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8655F216C4;
 Wed,  7 Oct 2020 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602086573;
 bh=TLtgDcbpdEwR1QGM4fDbkziKwC3gCpf2kRG8t9Zjkao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pI267f34imT2GwJxDUWed1YEdSXiHHYLgqxhF8INfg9oLB6oinNCDuoG2kxCODA2H
 HKqfFMW+HeIqkCo8DNZJofczHU+1tSezczEJVa6vqJDkG8S6+VYRYGIwHBZ2cOYP55
 i8zTxZV00FmDpFDn+JbQHNbkNqKZb5Ld5beGGd1Q=
Date: Wed, 7 Oct 2020 11:08:53 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/14] drm/amd/pm: Replace one-element array with
 flexible-array in struct phm_ppt_v1_clock_voltage_dependency_table
Message-ID: <3954508c123dabe1076af7651f220dc8696e5710.1602020074.git.gustavoars@kernel.org>
References: <cover.1602020074.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1602020074.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
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
ZXhpYmxlLWFycmF5IG1lbWJlciBpbgpzdHJ1Y3QgcGhtX3BwdF92MV9jbG9ja192b2x0YWdlX2Rl
cGVuZGVuY3lfdGFibGUsIGluc3RlYWQgb2YgYSBvbmUtZWxlbWVudAphcnJheSwgYW5kIHVzZSB0
aGUgc3RydWN0X3NpemUoKSBoZWxwZXIgdG8gY2FsY3VsYXRlIHRoZSBzaXplIGZvciB0aGUKYWxs
b2NhdGlvbi4KClsxXSBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9GbGV4aWJsZV9hcnJh
eV9tZW1iZXIKWzJdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjUuOS1yYzEvcHJv
Y2Vzcy9kZXByZWNhdGVkLmh0bWwjemVyby1sZW5ndGgtYW5kLW9uZS1lbGVtZW50LWFycmF5cwoK
QnVpbGQtdGVzdGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KTGluazog
ClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9y
Zz4KLS0tCiAuLi4vZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3JfcHB0LmggICAgfCAg
MiArLQogLi4uL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3BwdGFibGVzX3YxXzAuYyAgIHwgMzEg
KysrKy0tLS0tLS0tCiAuLi4vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9wcm9jZXNzcHB0YWJsZXMu
YyAgfCA1MCArKysrKystLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlv
bnMoKyksIDU2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG0vcG93ZXJwbGF5L2h3bWdyL2h3bWdyX3BwdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9w
b3dlcnBsYXkvaHdtZ3IvaHdtZ3JfcHB0LmgKaW5kZXggYzAxOTNlMDlkNThhLi5jMTY3MDgzYjA4
NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL2h3
bWdyX3BwdC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL2h3
bWdyX3BwdC5oCkBAIC00OCw3ICs0OCw3IEBAIHR5cGVkZWYgc3RydWN0IHBobV9wcHRfdjFfY2xv
Y2tfdm9sdGFnZV9kZXBlbmRlbmN5X3JlY29yZCBwaG1fcHB0X3YxX2Nsb2NrX3ZvbHRhCiAKIHN0
cnVjdCBwaG1fcHB0X3YxX2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV90YWJsZSB7CiAJdWludDMy
X3QgY291bnQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBO
dW1iZXIgb2YgZW50cmllcy4gKi8KLQlwaG1fcHB0X3YxX2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5j
eV9yZWNvcmQgZW50cmllc1sxXTsgICAgIC8qIER5bmFtaWNhbGx5IGFsbG9jYXRlIGNvdW50IGVu
dHJpZXMuICovCisJcGhtX3BwdF92MV9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3JkIGVu
dHJpZXNbXTsJICAgLyogRHluYW1pY2FsbHkgYWxsb2NhdGUgY291bnQgZW50cmllcy4gKi8KIH07
CiAKIHR5cGVkZWYgc3RydWN0IHBobV9wcHRfdjFfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3Rh
YmxlIHBobV9wcHRfdjFfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3RhYmxlOwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxl
c192MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcm9jZXNz
X3BwdGFibGVzX3YxXzAuYwppbmRleCA1MjE4OGY2Y2QxNTAuLjA3MjU1MzFmYmZmZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRh
Ymxlc192MV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3Iv
cHJvY2Vzc19wcHRhYmxlc192MV8wLmMKQEAgLTM2Nyw3ICszNjcsNyBAQCBzdGF0aWMgaW50IGdl
dF9tY2xrX3ZvbHRhZ2VfZGVwZW5kZW5jeV90YWJsZSgKIAkJQVRPTV9Ub25nYV9NQ0xLX0RlcGVu
ZGVuY3lfVGFibGUgY29uc3QgKm1jbGtfZGVwX3RhYmxlCiAJCSkKIHsKLQl1aW50MzJfdCB0YWJs
ZV9zaXplLCBpOworCXVpbnQzMl90IGk7CiAJcGhtX3BwdF92MV9jbG9ja192b2x0YWdlX2RlcGVu
ZGVuY3lfdGFibGUgKm1jbGtfdGFibGU7CiAJcGhtX3BwdF92MV9jbG9ja192b2x0YWdlX2RlcGVu
ZGVuY3lfcmVjb3JkICptY2xrX3RhYmxlX3JlY29yZDsKIAlBVE9NX1RvbmdhX01DTEtfRGVwZW5k
ZW5jeV9SZWNvcmQgKm1jbGtfZGVwX3JlY29yZDsKQEAgLTM3NSwxMiArMzc1LDkgQEAgc3RhdGlj
IGludCBnZXRfbWNsa192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUoCiAJUFBfQVNTRVJUX1dJVEhf
Q09ERSgoMCAhPSBtY2xrX2RlcF90YWJsZS0+dWNOdW1FbnRyaWVzKSwKIAkJIkludmFsaWQgUG93
ZXJQbGF5IFRhYmxlISIsIHJldHVybiAtMSk7CiAKLQl0YWJsZV9zaXplID0gc2l6ZW9mKHVpbnQz
Ml90KSArIHNpemVvZihwaG1fcHB0X3YxX2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV9yZWNvcmQp
Ci0JCSogbWNsa19kZXBfdGFibGUtPnVjTnVtRW50cmllczsKLQotCW1jbGtfdGFibGUgPSBremFs
bG9jKHRhYmxlX3NpemUsIEdGUF9LRVJORUwpOwotCi0JaWYgKE5VTEwgPT0gbWNsa190YWJsZSkK
KwltY2xrX3RhYmxlID0ga3phbGxvYyhzdHJ1Y3Rfc2l6ZShtY2xrX3RhYmxlLCBlbnRyaWVzLCBt
Y2xrX2RlcF90YWJsZS0+dWNOdW1FbnRyaWVzKSwKKwkJCSAgICAgR0ZQX0tFUk5FTCk7CisJaWYg
KCFtY2xrX3RhYmxlKQogCQlyZXR1cm4gLUVOT01FTTsKIAogCW1jbGtfdGFibGUtPmNvdW50ID0g
KHVpbnQzMl90KW1jbGtfZGVwX3RhYmxlLT51Y051bUVudHJpZXM7CkBAIC00MTAsNyArNDA3LDcg
QEAgc3RhdGljIGludCBnZXRfc2Nsa192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUoCiAJCVBQVGFi
bGVfR2VuZXJpY19TdWJUYWJsZV9IZWFkZXIgY29uc3QgICpzY2xrX2RlcF90YWJsZQogCQkpCiB7
Ci0JdWludDMyX3QgdGFibGVfc2l6ZSwgaTsKKwl1aW50MzJfdCBpOwogCXBobV9wcHRfdjFfY2xv
Y2tfdm9sdGFnZV9kZXBlbmRlbmN5X3RhYmxlICpzY2xrX3RhYmxlOwogCXBobV9wcHRfdjFfY2xv
Y2tfdm9sdGFnZV9kZXBlbmRlbmN5X3JlY29yZCAqc2Nsa190YWJsZV9yZWNvcmQ7CiAKQEAgLTQy
MiwxMiArNDE5LDkgQEAgc3RhdGljIGludCBnZXRfc2Nsa192b2x0YWdlX2RlcGVuZGVuY3lfdGFi
bGUoCiAJCVBQX0FTU0VSVF9XSVRIX0NPREUoKDAgIT0gdG9uZ2FfdGFibGUtPnVjTnVtRW50cmll
cyksCiAJCQkiSW52YWxpZCBQb3dlclBsYXkgVGFibGUhIiwgcmV0dXJuIC0xKTsKIAotCQl0YWJs
ZV9zaXplID0gc2l6ZW9mKHVpbnQzMl90KSArIHNpemVvZihwaG1fcHB0X3YxX2Nsb2NrX3ZvbHRh
Z2VfZGVwZW5kZW5jeV9yZWNvcmQpCi0JCQkqIHRvbmdhX3RhYmxlLT51Y051bUVudHJpZXM7Ci0K
LQkJc2Nsa190YWJsZSA9IGt6YWxsb2ModGFibGVfc2l6ZSwgR0ZQX0tFUk5FTCk7Ci0KLQkJaWYg
KE5VTEwgPT0gc2Nsa190YWJsZSkKKwkJc2Nsa190YWJsZSA9IGt6YWxsb2Moc3RydWN0X3NpemUo
c2Nsa190YWJsZSwgZW50cmllcywgdG9uZ2FfdGFibGUtPnVjTnVtRW50cmllcyksCisJCQkJICAg
ICBHRlBfS0VSTkVMKTsKKwkJaWYgKCFzY2xrX3RhYmxlKQogCQkJcmV0dXJuIC1FTk9NRU07CiAK
IAkJc2Nsa190YWJsZS0+Y291bnQgPSAodWludDMyX3QpdG9uZ2FfdGFibGUtPnVjTnVtRW50cmll
czsKQEAgLTQ1NCwxMiArNDQ4LDkgQEAgc3RhdGljIGludCBnZXRfc2Nsa192b2x0YWdlX2RlcGVu
ZGVuY3lfdGFibGUoCiAJCVBQX0FTU0VSVF9XSVRIX0NPREUoKDAgIT0gcG9sYXJpc190YWJsZS0+
dWNOdW1FbnRyaWVzKSwKIAkJCSJJbnZhbGlkIFBvd2VyUGxheSBUYWJsZSEiLCByZXR1cm4gLTEp
OwogCi0JCXRhYmxlX3NpemUgPSBzaXplb2YodWludDMyX3QpICsgc2l6ZW9mKHBobV9wcHRfdjFf
Y2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3JlY29yZCkKLQkJCSogcG9sYXJpc190YWJsZS0+dWNO
dW1FbnRyaWVzOwotCi0JCXNjbGtfdGFibGUgPSBremFsbG9jKHRhYmxlX3NpemUsIEdGUF9LRVJO
RUwpOwotCi0JCWlmIChOVUxMID09IHNjbGtfdGFibGUpCisJCXNjbGtfdGFibGUgPSBremFsbG9j
KHN0cnVjdF9zaXplKHNjbGtfdGFibGUsIGVudHJpZXMsIHBvbGFyaXNfdGFibGUtPnVjTnVtRW50
cmllcyksCisJCQkJICAgICBHRlBfS0VSTkVMKTsKKwkJaWYgKCFzY2xrX3RhYmxlKQogCQkJcmV0
dXJuIC1FTk9NRU07CiAKIAkJc2Nsa190YWJsZS0+Y291bnQgPSAodWludDMyX3QpcG9sYXJpc190
YWJsZS0+dWNOdW1FbnRyaWVzOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9w
b3dlcnBsYXkvaHdtZ3IvdmVnYTEwX3Byb2Nlc3NwcHRhYmxlcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX3Byb2Nlc3NwcHRhYmxlcy5jCmluZGV4IGU2
NTVjMDRjY2RmYi4uNzg3YjIzZmEyNWU3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBfcHJvY2Vzc3BwdGFibGVzLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX3Byb2Nlc3NwcHRhYmxlcy5j
CkBAIC01NzEsMTggKzU3MSwxNCBAQCBzdGF0aWMgaW50IGdldF9zb2NjbGtfdm9sdGFnZV9kZXBl
bmRlbmN5X3RhYmxlKAogCQlwaG1fcHB0X3YxX2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV90YWJs
ZSAqKnBwX3ZlZ2ExMF9jbGtfZGVwX3RhYmxlLAogCQljb25zdCBBVE9NX1ZlZ2ExMF9TT0NDTEtf
RGVwZW5kZW5jeV9UYWJsZSAqY2xrX2RlcF90YWJsZSkKIHsKLQl1aW50MzJfdCB0YWJsZV9zaXpl
LCBpOworCXVpbnQzMl90IGk7CiAJcGhtX3BwdF92MV9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lf
dGFibGUgKmNsa190YWJsZTsKIAogCVBQX0FTU0VSVF9XSVRIX0NPREUoY2xrX2RlcF90YWJsZS0+
dWNOdW1FbnRyaWVzLAogCQkiSW52YWxpZCBQb3dlclBsYXkgVGFibGUhIiwgcmV0dXJuIC0xKTsK
IAotCXRhYmxlX3NpemUgPSBzaXplb2YodWludDMyX3QpICsKLQkJCXNpemVvZihwaG1fcHB0X3Yx
X2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV9yZWNvcmQpICoKLQkJCWNsa19kZXBfdGFibGUtPnVj
TnVtRW50cmllczsKLQotCWNsa190YWJsZSA9IGt6YWxsb2ModGFibGVfc2l6ZSwgR0ZQX0tFUk5F
TCk7Ci0KKwljbGtfdGFibGUgPSBremFsbG9jKHN0cnVjdF9zaXplKGNsa190YWJsZSwgZW50cmll
cywgY2xrX2RlcF90YWJsZS0+dWNOdW1FbnRyaWVzKSwKKwkJCSAgICBHRlBfS0VSTkVMKTsKIAlp
ZiAoIWNsa190YWJsZSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKQEAgLTYwNSwxOCArNjAxLDE0IEBA
IHN0YXRpYyBpbnQgZ2V0X21jbGtfdm9sdGFnZV9kZXBlbmRlbmN5X3RhYmxlKAogCQlwaG1fcHB0
X3YxX2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV90YWJsZSAqKnBwX3ZlZ2ExMF9tY2xrX2RlcF90
YWJsZSwKIAkJY29uc3QgQVRPTV9WZWdhMTBfTUNMS19EZXBlbmRlbmN5X1RhYmxlICptY2xrX2Rl
cF90YWJsZSkKIHsKLQl1aW50MzJfdCB0YWJsZV9zaXplLCBpOworCXVpbnQzMl90IGk7CiAJcGht
X3BwdF92MV9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUgKm1jbGtfdGFibGU7CiAKIAlQ
UF9BU1NFUlRfV0lUSF9DT0RFKG1jbGtfZGVwX3RhYmxlLT51Y051bUVudHJpZXMsCiAJCSJJbnZh
bGlkIFBvd2VyUGxheSBUYWJsZSEiLCByZXR1cm4gLTEpOwogCi0JdGFibGVfc2l6ZSA9IHNpemVv
Zih1aW50MzJfdCkgKwotCQkJc2l6ZW9mKHBobV9wcHRfdjFfY2xvY2tfdm9sdGFnZV9kZXBlbmRl
bmN5X3JlY29yZCkgKgotCQkJbWNsa19kZXBfdGFibGUtPnVjTnVtRW50cmllczsKLQotCW1jbGtf
dGFibGUgPSBremFsbG9jKHRhYmxlX3NpemUsIEdGUF9LRVJORUwpOwotCisJbWNsa190YWJsZSA9
IGt6YWxsb2Moc3RydWN0X3NpemUobWNsa190YWJsZSwgZW50cmllcywgbWNsa19kZXBfdGFibGUt
PnVjTnVtRW50cmllcyksCisJCQkgICAgR0ZQX0tFUk5FTCk7CiAJaWYgKCFtY2xrX3RhYmxlKQog
CQlyZXR1cm4gLUVOT01FTTsKIApAQCAtNjQ0LDcgKzYzNiw3IEBAIHN0YXRpYyBpbnQgZ2V0X2dm
eGNsa192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUoCiAJCQkqKnBwX3ZlZ2ExMF9jbGtfZGVwX3Rh
YmxlLAogCQljb25zdCBBVE9NX1ZlZ2ExMF9HRlhDTEtfRGVwZW5kZW5jeV9UYWJsZSAqY2xrX2Rl
cF90YWJsZSkKIHsKLQl1aW50MzJfdCB0YWJsZV9zaXplLCBpOworCXVpbnQzMl90IGk7CiAJc3Ry
dWN0IHBobV9wcHRfdjFfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3RhYmxlCiAJCQkJKmNsa190
YWJsZTsKIAlBVE9NX1ZlZ2ExMF9HRlhDTEtfRGVwZW5kZW5jeV9SZWNvcmRfVjIgKnBhdG9tX3Jl
Y29yZF92MjsKQEAgLTY1MiwxMiArNjQ0LDggQEAgc3RhdGljIGludCBnZXRfZ2Z4Y2xrX3ZvbHRh
Z2VfZGVwZW5kZW5jeV90YWJsZSgKIAlQUF9BU1NFUlRfV0lUSF9DT0RFKChjbGtfZGVwX3RhYmxl
LT51Y051bUVudHJpZXMgIT0gMCksCiAJCQkiSW52YWxpZCBQb3dlclBsYXkgVGFibGUhIiwgcmV0
dXJuIC0xKTsKIAotCXRhYmxlX3NpemUgPSBzaXplb2YodWludDMyX3QpICsKLQkJCXNpemVvZihw
aG1fcHB0X3YxX2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV9yZWNvcmQpICoKLQkJCWNsa19kZXBf
dGFibGUtPnVjTnVtRW50cmllczsKLQotCWNsa190YWJsZSA9IGt6YWxsb2ModGFibGVfc2l6ZSwg
R0ZQX0tFUk5FTCk7Ci0KKwljbGtfdGFibGUgPSBremFsbG9jKHN0cnVjdF9zaXplKGNsa190YWJs
ZSwgZW50cmllcywgY2xrX2RlcF90YWJsZS0+dWNOdW1FbnRyaWVzKSwKKwkJCSAgICBHRlBfS0VS
TkVMKTsKIAlpZiAoIWNsa190YWJsZSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKQEAgLTcxMSwxOSAr
Njk5LDE1IEBAIHN0YXRpYyBpbnQgZ2V0X3BpeF9jbGtfdm9sdGFnZV9kZXBlbmRlbmN5X3RhYmxl
KAogCQkJKipwcF92ZWdhMTBfY2xrX2RlcF90YWJsZSwKIAkJY29uc3QgIEFUT01fVmVnYTEwX1BJ
WENMS19EZXBlbmRlbmN5X1RhYmxlICpjbGtfZGVwX3RhYmxlKQogewotCXVpbnQzMl90IHRhYmxl
X3NpemUsIGk7CisJdWludDMyX3QgaTsKIAlzdHJ1Y3QgcGhtX3BwdF92MV9jbG9ja192b2x0YWdl
X2RlcGVuZGVuY3lfdGFibGUKIAkJCQkqY2xrX3RhYmxlOwogCiAJUFBfQVNTRVJUX1dJVEhfQ09E
RSgoY2xrX2RlcF90YWJsZS0+dWNOdW1FbnRyaWVzICE9IDApLAogCQkJIkludmFsaWQgUG93ZXJQ
bGF5IFRhYmxlISIsIHJldHVybiAtMSk7CiAKLQl0YWJsZV9zaXplID0gc2l6ZW9mKHVpbnQzMl90
KSArCi0JCQlzaXplb2YocGhtX3BwdF92MV9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3Jk
KSAqCi0JCQljbGtfZGVwX3RhYmxlLT51Y051bUVudHJpZXM7Ci0KLQljbGtfdGFibGUgPSBremFs
bG9jKHRhYmxlX3NpemUsIEdGUF9LRVJORUwpOwotCisJY2xrX3RhYmxlID0ga3phbGxvYyhzdHJ1
Y3Rfc2l6ZShjbGtfdGFibGUsIGVudHJpZXMsIGNsa19kZXBfdGFibGUtPnVjTnVtRW50cmllcyks
CisJCQkgICAgR0ZQX0tFUk5FTCk7CiAJaWYgKCFjbGtfdGFibGUpCiAJCXJldHVybiAtRU5PTUVN
OwogCkBAIC03NDcsNyArNzMxLDcgQEAgc3RhdGljIGludCBnZXRfZGNlZmNsa192b2x0YWdlX2Rl
cGVuZGVuY3lfdGFibGUoCiAJCQkqKnBwX3ZlZ2ExMF9jbGtfZGVwX3RhYmxlLAogCQljb25zdCBB
VE9NX1ZlZ2ExMF9EQ0VGQ0xLX0RlcGVuZGVuY3lfVGFibGUgKmNsa19kZXBfdGFibGUpCiB7Ci0J
dWludDMyX3QgdGFibGVfc2l6ZSwgaTsKKwl1aW50MzJfdCBpOwogCXVpbnQ4X3QgbnVtX2VudHJp
ZXM7CiAJc3RydWN0IHBobV9wcHRfdjFfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3RhYmxlCiAJ
CQkJKmNsa190YWJsZTsKQEAgLTc3NSwxMiArNzU5LDggQEAgc3RhdGljIGludCBnZXRfZGNlZmNs
a192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUoCiAJCW51bV9lbnRyaWVzID0gY2xrX2RlcF90YWJs
ZS0+dWNOdW1FbnRyaWVzOwogCiAKLQl0YWJsZV9zaXplID0gc2l6ZW9mKHVpbnQzMl90KSArCi0J
CQlzaXplb2YocGhtX3BwdF92MV9jbG9ja192b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3JkKSAqCi0J
CQludW1fZW50cmllczsKLQotCWNsa190YWJsZSA9IGt6YWxsb2ModGFibGVfc2l6ZSwgR0ZQX0tF
Uk5FTCk7Ci0KKwljbGtfdGFibGUgPSBremFsbG9jKHN0cnVjdF9zaXplKGNsa190YWJsZSwgZW50
cmllcywgbnVtX2VudHJpZXMpLAorCQkJICAgIEdGUF9LRVJORUwpOwogCWlmICghY2xrX3RhYmxl
KQogCQlyZXR1cm4gLUVOT01FTTsKIAotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngK

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB11F220A
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jun 2020 01:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C752B89C9D;
	Mon,  8 Jun 2020 23:06:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D988991C;
 Mon,  8 Jun 2020 23:06:09 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 899DA2076A;
 Mon,  8 Jun 2020 23:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657569;
 bh=CicGRjGSOTBsUj/Eqh9polVEPmrcjtOxTk5wOZR5tgE=;
 h=From:To:Cc:Subject:Date:From;
 b=nI2YdhB1zt9pJ919fxs1oyKtdENrnrLP24ylg86cC/kUoj9RYMFYPe0Ipv8Hn3GWu
 nZxfi5XehnjrGsJvLMtMlzOtIG5ZkVO4CuuenLWVF3RtdywZzfTkl4Mq+JN7GR6afq
 ynvWaLS+BIuCTUZ7fNshAQE/pc0Txda7UNMTR2OI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 001/274] drm/amdgpu: fix and cleanup
 amdgpu_gem_object_close v4
Date: Mon,  8 Jun 2020 19:01:34 -0400
Message-Id: <20200608230607.3361041-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, xinhui pan <xinhui.pan@amd.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgODJjNDE2YjEzY2I3ZDIyYjk2ZWMwODg4YjI5NmE0OGRmZjhhMDllYiBdCgpU
aGUgcHJvYmxlbSBpcyB0aGF0IHdlIGNhbid0IGFkZCB0aGUgY2xlYXIgZmVuY2UgdG8gdGhlIEJP
CndoZW4gdGhlcmUgaXMgYW4gZXhjbHVzaXZlIGZlbmNlIG9uIGl0IHNpbmNlIHdlIGNhbid0Cmd1
YXJhbnRlZSB0aGUgdGhlIGNsZWFyIGZlbmNlIHdpbGwgY29tcGxldGUgYWZ0ZXIgdGhlCmV4Y2x1
c2l2ZSBvbmUuCgpUbyBmaXggdGhpcyByZWZhY3RvciB0aGUgZnVuY3Rpb24gYW5kIGFsc28gYWRk
IHRoZSBleGNsdXNpdmUKZmVuY2UgYXMgc2hhcmVkIHRvIHRoZSByZXN2IG9iamVjdC4KCnYyOiBm
aXggd2FybmluZwp2MzogYWRkIGV4Y2wgZmVuY2UgYXMgc2hhcmVkIGluc3RlYWQKdjQ6IHNxdWFz
aCBpbiBmaXggZm9yIGZlbmNlIGhhbmRsaW5nIGluIGFtZGdwdV9nZW1fb2JqZWN0X2Nsb3NlCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
ClJldmlld2VkLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFuQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyB8IDQzICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKaW5kZXggNDI3NzEyNWE3OWVlLi4zMmYzNmM5
NDBhYmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKQEAgLTE2MSwx
NiArMTYxLDE3IEBAIHZvaWQgYW1kZ3B1X2dlbV9vYmplY3RfY2xvc2Uoc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmosCiAKIAlzdHJ1Y3QgYW1kZ3B1X2JvX2xpc3RfZW50cnkgdm1fcGQ7CiAJc3Ry
dWN0IGxpc3RfaGVhZCBsaXN0LCBkdXBsaWNhdGVzOworCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNl
ID0gTlVMTDsKIAlzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlciB0djsKIAlzdHJ1Y3Qgd3dfYWNx
dWlyZV9jdHggdGlja2V0OwogCXN0cnVjdCBhbWRncHVfYm9fdmEgKmJvX3ZhOwotCWludCByOwor
CWxvbmcgcjsKIAogCUlOSVRfTElTVF9IRUFEKCZsaXN0KTsKIAlJTklUX0xJU1RfSEVBRCgmZHVw
bGljYXRlcyk7CiAKIAl0di5ibyA9ICZiby0+dGJvOwotCXR2Lm51bV9zaGFyZWQgPSAxOworCXR2
Lm51bV9zaGFyZWQgPSAyOwogCWxpc3RfYWRkKCZ0di5oZWFkLCAmbGlzdCk7CiAKIAlhbWRncHVf
dm1fZ2V0X3BkX2JvKHZtLCAmbGlzdCwgJnZtX3BkKTsKQEAgLTE3OCwyOCArMTc5LDM0IEBAIHZv
aWQgYW1kZ3B1X2dlbV9vYmplY3RfY2xvc2Uoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCiAJ
ciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIGZhbHNlLCAmZHVwbGlj
YXRlcyk7CiAJaWYgKHIpIHsKIAkJZGV2X2VycihhZGV2LT5kZXYsICJsZWFraW5nIGJvIHZhIGJl
Y2F1c2UgIgotCQkJIndlIGZhaWwgdG8gcmVzZXJ2ZSBibyAoJWQpXG4iLCByKTsKKwkJCSJ3ZSBm
YWlsIHRvIHJlc2VydmUgYm8gKCVsZClcbiIsIHIpOwogCQlyZXR1cm47CiAJfQogCWJvX3ZhID0g
YW1kZ3B1X3ZtX2JvX2ZpbmQodm0sIGJvKTsKLQlpZiAoYm9fdmEgJiYgLS1ib192YS0+cmVmX2Nv
dW50ID09IDApIHsKLQkJYW1kZ3B1X3ZtX2JvX3JtdihhZGV2LCBib192YSk7Ci0KLQkJaWYgKGFt
ZGdwdV92bV9yZWFkeSh2bSkpIHsKLQkJCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0gTlVMTDsK
KwlpZiAoIWJvX3ZhIHx8IC0tYm9fdmEtPnJlZl9jb3VudCkKKwkJZ290byBvdXRfdW5sb2NrOwog
Ci0JCQlyID0gYW1kZ3B1X3ZtX2NsZWFyX2ZyZWVkKGFkZXYsIHZtLCAmZmVuY2UpOwotCQkJaWYg
KHVubGlrZWx5KHIpKSB7Ci0JCQkJZGV2X2VycihhZGV2LT5kZXYsICJmYWlsZWQgdG8gY2xlYXIg
cGFnZSAiCi0JCQkJCSJ0YWJsZXMgb24gR0VNIG9iamVjdCBjbG9zZSAoJWQpXG4iLCByKTsKLQkJ
CX0KKwlhbWRncHVfdm1fYm9fcm12KGFkZXYsIGJvX3ZhKTsKKwlpZiAoIWFtZGdwdV92bV9yZWFk
eSh2bSkpCisJCWdvdG8gb3V0X3VubG9jazsKIAotCQkJaWYgKGZlbmNlKSB7Ci0JCQkJYW1kZ3B1
X2JvX2ZlbmNlKGJvLCBmZW5jZSwgdHJ1ZSk7Ci0JCQkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7Ci0J
CQl9Ci0JCX0KKwlmZW5jZSA9IGRtYV9yZXN2X2dldF9leGNsKGJvLT50Ym8uYmFzZS5yZXN2KTsK
KwlpZiAoZmVuY2UpIHsKKwkJYW1kZ3B1X2JvX2ZlbmNlKGJvLCBmZW5jZSwgdHJ1ZSk7CisJCWZl
bmNlID0gTlVMTDsKIAl9CisKKwlyID0gYW1kZ3B1X3ZtX2NsZWFyX2ZyZWVkKGFkZXYsIHZtLCAm
ZmVuY2UpOworCWlmIChyIHx8ICFmZW5jZSkKKwkJZ290byBvdXRfdW5sb2NrOworCisJYW1kZ3B1
X2JvX2ZlbmNlKGJvLCBmZW5jZSwgdHJ1ZSk7CisJZG1hX2ZlbmNlX3B1dChmZW5jZSk7CisKK291
dF91bmxvY2s6CisJaWYgKHVubGlrZWx5KHIgPCAwKSkKKwkJZGV2X2VycihhZGV2LT5kZXYsICJm
YWlsZWQgdG8gY2xlYXIgcGFnZSAiCisJCQkidGFibGVzIG9uIEdFTSBvYmplY3QgY2xvc2UgKCVs
ZClcbiIsIHIpOwogCXR0bV9ldV9iYWNrb2ZmX3Jlc2VydmF0aW9uKCZ0aWNrZXQsICZsaXN0KTsK
IH0KIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK

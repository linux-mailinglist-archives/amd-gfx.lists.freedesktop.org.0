Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBF171EC9
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75FD6E32C;
	Tue, 23 Jul 2019 18:11:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28986E32C
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:13 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id d9so36986820qko.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=mEM9r2TrIcyS5QiUJ5WsI/WGUVLPWWhwkAU6Ibh3jIs=;
 b=U8/Bo3I8n3WMj4apoh/OLoZtPMr+HBd1j4wd/T+vWN34froBG338frGfiY84xfIxnU
 7keXg7wHNWLvRQHedZbtzAH24oBJwClCvr6xS5Kvrvc34uU+u+mJ6C1Z9GSoq591751F
 zbLrygwsNECwIMvpCp55oSnRnSFs/56RZymRw/b37yZy/k1NVkEnzYUSNWrMhxvdtFUu
 QNWLF/yrkoaDQxyAudVJDChE3veuDufh7kTguPnGrreSRupjE+NHchZ8OM6HJ8fA3KML
 EGYo89cFCvC+rQqPV3f1PxIyr9qe6R88M+Ymnp/rH53ciO9aC2PKDErqfoE15YixdNr0
 5nPQ==
X-Gm-Message-State: APjAAAV4QrLZDBepvGnyDeZ+lEIVT9oRjTcGi0eE/mRUizvFtR4teYFT
 NxvD2HNPr0vI7SYjiZ+554iy2g4o5KnXEd2T
X-Google-Smtp-Source: APXvYqzAUxNwopC91TOnVL5OWCCwX02ZC910lFa3yrWgPSH4oaNT26Uf7JNL1bImHscifmXrtCV+ZCB9Y2uf5vV7
X-Received: by 2002:a0c:8705:: with SMTP id 5mr54401806qvh.32.1563904752366;
 Tue, 23 Jul 2019 10:59:12 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:39 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <1c05651c53f90d07e98ee4973c2786ccf315db12.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 02/15] arm64: Introduce prctl() options to control the
 tagged user addresses ABI
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:11:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=mEM9r2TrIcyS5QiUJ5WsI/WGUVLPWWhwkAU6Ibh3jIs=;
 b=H5geBT1j+ubrLFlbrsinXfwZ0W5BQqUsTQ4IaRG81Ui2ZwtPz7y/KxLSObtE6WVnKG
 iLhrcnu/dA6uvy2xcSWRBGEgliAGFYmCJj9eOifU6l6F5s22JsTp5wdsL4S09QNfUDVI
 UCiPujniwnzgr9cWOZtf0O60DfpKFiDJD1smf/WyvtqTOs+e49rV01Sy+tA1kalRfOYC
 3saGMlUnkEYHG4EJGY2ZRToPTiWHH99XVusCT8uRMBFt4SPd2rqEw8UO4qGVRomxdtCq
 F9yP/y3PSBYaBJ+MgdczyCl0HRVmy2j6uCXJDxaojhfskG3cHHnyJgYo5kA7+x/3sY0a
 e1vw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Khalid Aziz <khalid.aziz@oracle.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KCkl0IGlzIG5v
dCBkZXNpcmFibGUgdG8gcmVsYXggdGhlIEFCSSB0byBhbGxvdyB0YWdnZWQgdXNlciBhZGRyZXNz
ZXMgaW50bwp0aGUga2VybmVsIGluZGlzY3JpbWluYXRlbHkuIFRoaXMgcGF0Y2ggaW50cm9kdWNl
cyBhIHByY3RsKCkgaW50ZXJmYWNlCmZvciBlbmFibGluZyBvciBkaXNhYmxpbmcgdGhlIHRhZ2dl
ZCBBQkkgd2l0aCBhIGdsb2JhbCBzeXNjdGwgY29udHJvbApmb3IgcHJldmVudGluZyBhcHBsaWNh
dGlvbnMgZnJvbSBlbmFibGluZyB0aGUgcmVsYXhlZCBBQkkgKG1lYW50IGZvcgp0ZXN0aW5nIHVz
ZXItc3BhY2UgcHJjdGwoKSByZXR1cm4gZXJyb3IgY2hlY2tpbmcgd2l0aG91dCByZWNvbmZpZ3Vy
aW5nCnRoZSBrZXJuZWwpLiBUaGUgQUJJIHByb3BlcnRpZXMgYXJlIGluaGVyaXRlZCBieSB0aHJl
YWRzIG9mIHRoZSBzYW1lCmFwcGxpY2F0aW9uIGFuZCBmb3JrKCknZWQgY2hpbGRyZW4gYnV0IGNs
ZWFyZWQgb24gZXhlY3ZlKCkuIEEgS2NvbmZpZwpvcHRpb24gYWxsb3dzIHRoZSBvdmVyYWxsIGRp
c2FibGluZyBvZiB0aGUgcmVsYXhlZCBBQkkuCgpUaGUgUFJfU0VUX1RBR0dFRF9BRERSX0NUUkwg
d2lsbCBiZSBleHBhbmRlZCBpbiB0aGUgZnV0dXJlIHRvIGhhbmRsZQpNVEUtc3BlY2lmaWMgc2V0
dGluZ3MgbGlrZSBpbXByZWNpc2UgdnMgcHJlY2lzZSBleGNlcHRpb25zLgoKUmV2aWV3ZWQtYnk6
IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBDYXRhbGlu
IE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkg
S29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogYXJjaC9hcm02NC9LY29uZmln
ICAgICAgICAgICAgICAgICAgIHwgIDkgKysrKwogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wcm9j
ZXNzb3IuaCAgIHwgIDggKysrCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgg
fCAgMSArCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCAgICAgfCAgNCArLQogYXJj
aC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICAgIHwgNzMgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmggICAgICAgICAgIHwgIDUgKysK
IGtlcm5lbC9zeXMuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysrCiA3IGZpbGVz
IGNoYW5nZWQsIDExMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9LY29uZmlnIGIvYXJjaC9hcm02NC9LY29uZmlnCmluZGV4IDNhZGNlYzA1YjFm
Ni4uNWQyNTQxNzhiOWNhIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L0tjb25maWcKKysrIGIvYXJj
aC9hcm02NC9LY29uZmlnCkBAIC0xMTEwLDYgKzExMTAsMTUgQEAgY29uZmlnIEFSTTY0X1NXX1RU
QlIwX1BBTgogCSAgemVyb2VkIGFyZWEgYW5kIHJlc2VydmVkIEFTSUQuIFRoZSB1c2VyIGFjY2Vz
cyByb3V0aW5lcwogCSAgcmVzdG9yZSB0aGUgdmFsaWQgVFRCUjBfRUwxIHRlbXBvcmFyaWx5Lgog
Citjb25maWcgQVJNNjRfVEFHR0VEX0FERFJfQUJJCisJYm9vbCAiRW5hYmxlIHRoZSB0YWdnZWQg
dXNlciBhZGRyZXNzZXMgc3lzY2FsbCBBQkkiCisJZGVmYXVsdCB5CisJaGVscAorCSAgV2hlbiB0
aGlzIG9wdGlvbiBpcyBlbmFibGVkLCB1c2VyIGFwcGxpY2F0aW9ucyBjYW4gb3B0IGluIHRvIGEK
KwkgIHJlbGF4ZWQgQUJJIHZpYSBwcmN0bCgpIGFsbG93aW5nIHRhZ2dlZCBhZGRyZXNzZXMgdG8g
YmUgcGFzc2VkCisJICB0byBzeXN0ZW0gY2FsbHMgYXMgcG9pbnRlciBhcmd1bWVudHMuIEZvciBk
ZXRhaWxzLCBzZWUKKwkgIERvY3VtZW50YXRpb24vYXJtNjQvdGFnZ2VkLWFkZHJlc3MtYWJpLnR4
dC4KKwogbWVudWNvbmZpZyBDT01QQVQKIAlib29sICJLZXJuZWwgc3VwcG9ydCBmb3IgMzItYml0
IEVMMCIKIAlkZXBlbmRzIG9uIEFSTTY0XzRLX1BBR0VTIHx8IEVYUEVSVApkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vcHJvY2Vzc29yLmgKaW5kZXggZmQ1YjFhNGVmYzcwLi5lZTg2MDcwYTI4ZDQgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKKysrIGIvYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS9wcm9jZXNzb3IuaApAQCAtMjk2LDYgKzI5NiwxNCBAQCBleHRlcm4gdm9pZCBf
X2luaXQgbWluc2lnc3Rrc3pfc2V0dXAodm9pZCk7CiAvKiBQUl9QQUNfUkVTRVRfS0VZUyBwcmN0
bCAqLwogI2RlZmluZSBQQUNfUkVTRVRfS0VZUyh0c2ssIGFyZykJcHRyYXV0aF9wcmN0bF9yZXNl
dF9rZXlzKHRzaywgYXJnKQogCisjaWZkZWYgQ09ORklHX0FSTTY0X1RBR0dFRF9BRERSX0FCSQor
LyogUFJfe1NFVCxHRVR9X1RBR0dFRF9BRERSX0NUUkwgcHJjdGwgKi8KK2xvbmcgc2V0X3RhZ2dl
ZF9hZGRyX2N0cmwodW5zaWduZWQgbG9uZyBhcmcpOworbG9uZyBnZXRfdGFnZ2VkX2FkZHJfY3Ry
bCh2b2lkKTsKKyNkZWZpbmUgU0VUX1RBR0dFRF9BRERSX0NUUkwoYXJnKQlzZXRfdGFnZ2VkX2Fk
ZHJfY3RybChhcmcpCisjZGVmaW5lIEdFVF9UQUdHRURfQUREUl9DVFJMKCkJCWdldF90YWdnZWRf
YWRkcl9jdHJsKCkKKyNlbmRpZgorCiAvKgogICogRm9yIENPTkZJR19HQ0NfUExVR0lOX1NUQUNL
TEVBSwogICoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8u
aCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaAppbmRleCAxODBiMzRlYzU5
NjUuLjAxMjIzOGQ4ZTU4ZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS90aHJl
YWRfaW5mby5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaApAQCAt
OTAsNiArOTAsNyBAQCB2b2lkIGFyY2hfcmVsZWFzZV90YXNrX3N0cnVjdChzdHJ1Y3QgdGFza19z
dHJ1Y3QgKnRzayk7CiAjZGVmaW5lIFRJRl9TVkUJCQkyMwkvKiBTY2FsYWJsZSBWZWN0b3IgRXh0
ZW5zaW9uIGluIHVzZSAqLwogI2RlZmluZSBUSUZfU1ZFX1ZMX0lOSEVSSVQJMjQJLyogSW5oZXJp
dCBzdmVfdmxfb25leGVjIGFjcm9zcyBleGVjICovCiAjZGVmaW5lIFRJRl9TU0JECQkyNQkvKiBX
YW50cyBTU0IgbWl0aWdhdGlvbiAqLworI2RlZmluZSBUSUZfVEFHR0VEX0FERFIJCTI2CS8qIEFs
bG93IHRhZ2dlZCB1c2VyIGFkZHJlc3NlcyAqLwogCiAjZGVmaW5lIF9USUZfU0lHUEVORElORwkJ
KDEgPDwgVElGX1NJR1BFTkRJTkcpCiAjZGVmaW5lIF9USUZfTkVFRF9SRVNDSEVECSgxIDw8IFRJ
Rl9ORUVEX1JFU0NIRUQpCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nl
c3MuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCmluZGV4IGExMzhlM2I0Zjcx
Ny4uMDk3ZDZiZmFjMGI3IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nl
c3MuaAorKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAtNjIsNyArNjIs
OSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgX19yYW5nZV9vayhjb25zdCB2b2lkIF9f
dXNlciAqYWRkciwgdW5zaWduZWQgbG9uZyBzaQogewogCXVuc2lnbmVkIGxvbmcgcmV0LCBsaW1p
dCA9IGN1cnJlbnRfdGhyZWFkX2luZm8oKS0+YWRkcl9saW1pdDsKIAotCWFkZHIgPSB1bnRhZ2dl
ZF9hZGRyKGFkZHIpOworCWlmIChJU19FTkFCTEVEKENPTkZJR19BUk02NF9UQUdHRURfQUREUl9B
QkkpICYmCisJICAgIHRlc3RfdGhyZWFkX2ZsYWcoVElGX1RBR0dFRF9BRERSKSkKKwkJYWRkciA9
IHVudGFnZ2VkX2FkZHIoYWRkcik7CiAKIAlfX2Noa191c2VyX3B0cihhZGRyKTsKIAlhc20gdm9s
YXRpbGUoCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL2Fy
bTY0L2tlcm5lbC9wcm9jZXNzLmMKaW5kZXggNmE4NjlkOWYzMDRmLi5lZjA2YTMwM2JkYTAgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYworKysgYi9hcmNoL2FybTY0L2tl
cm5lbC9wcm9jZXNzLmMKQEAgLTE5LDYgKzE5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9rZXJuZWwu
aD4KICNpbmNsdWRlIDxsaW51eC9tbS5oPgogI2luY2x1ZGUgPGxpbnV4L3N0ZGRlZi5oPgorI2lu
Y2x1ZGUgPGxpbnV4L3N5c2N0bC5oPgogI2luY2x1ZGUgPGxpbnV4L3VuaXN0ZC5oPgogI2luY2x1
ZGUgPGxpbnV4L3VzZXIuaD4KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgpAQCAtMzgsNiArMzks
NyBAQAogI2luY2x1ZGUgPHRyYWNlL2V2ZW50cy9wb3dlci5oPgogI2luY2x1ZGUgPGxpbnV4L3Bl
cmNwdS5oPgogI2luY2x1ZGUgPGxpbnV4L3RocmVhZF9pbmZvLmg+CisjaW5jbHVkZSA8bGludXgv
cHJjdGwuaD4KIAogI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPgogI2luY2x1ZGUgPGFzbS9h
cmNoX2dpY3YzLmg+CkBAIC0zMDcsMTEgKzMwOSwxOCBAQCBzdGF0aWMgdm9pZCB0bHNfdGhyZWFk
X2ZsdXNoKHZvaWQpCiAJfQogfQogCitzdGF0aWMgdm9pZCBmbHVzaF90YWdnZWRfYWRkcl9zdGF0
ZSh2b2lkKQoreworCWlmIChJU19FTkFCTEVEKENPTkZJR19BUk02NF9UQUdHRURfQUREUl9BQkkp
KQorCQljbGVhcl90aHJlYWRfZmxhZyhUSUZfVEFHR0VEX0FERFIpOworfQorCiB2b2lkIGZsdXNo
X3RocmVhZCh2b2lkKQogewogCWZwc2ltZF9mbHVzaF90aHJlYWQoKTsKIAl0bHNfdGhyZWFkX2Zs
dXNoKCk7CiAJZmx1c2hfcHRyYWNlX2h3X2JyZWFrcG9pbnQoY3VycmVudCk7CisJZmx1c2hfdGFn
Z2VkX2FkZHJfc3RhdGUoKTsKIH0KIAogdm9pZCByZWxlYXNlX3RocmVhZChzdHJ1Y3QgdGFza19z
dHJ1Y3QgKmRlYWRfdGFzaykKQEAgLTU0MSwzICs1NTAsNjcgQEAgdm9pZCBhcmNoX3NldHVwX25l
d19leGVjKHZvaWQpCiAKIAlwdHJhdXRoX3RocmVhZF9pbml0X3VzZXIoY3VycmVudCk7CiB9CisK
KyNpZmRlZiBDT05GSUdfQVJNNjRfVEFHR0VEX0FERFJfQUJJCisvKgorICogQ29udHJvbCB0aGUg
cmVsYXhlZCBBQkkgYWxsb3dpbmcgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIGludG8gdGhlIGtlcm5l
bC4KKyAqLworc3RhdGljIHVuc2lnbmVkIGludCB0YWdnZWRfYWRkcl9wcmN0bF9hbGxvd2VkID0g
MTsKKworbG9uZyBzZXRfdGFnZ2VkX2FkZHJfY3RybCh1bnNpZ25lZCBsb25nIGFyZykKK3sKKwlp
ZiAoIXRhZ2dlZF9hZGRyX3ByY3RsX2FsbG93ZWQpCisJCXJldHVybiAtRUlOVkFMOworCWlmIChp
c19jb21wYXRfdGFzaygpKQorCQlyZXR1cm4gLUVJTlZBTDsKKwlpZiAoYXJnICYgflBSX1RBR0dF
RF9BRERSX0VOQUJMRSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwl1cGRhdGVfdGhyZWFkX2ZsYWco
VElGX1RBR0dFRF9BRERSLCBhcmcgJiBQUl9UQUdHRURfQUREUl9FTkFCTEUpOworCisJcmV0dXJu
IDA7Cit9CisKK2xvbmcgZ2V0X3RhZ2dlZF9hZGRyX2N0cmwodm9pZCkKK3sKKwlpZiAoIXRhZ2dl
ZF9hZGRyX3ByY3RsX2FsbG93ZWQpCisJCXJldHVybiAtRUlOVkFMOworCWlmIChpc19jb21wYXRf
dGFzaygpKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWlmICh0ZXN0X3RocmVhZF9mbGFnKFRJRl9U
QUdHRURfQUREUikpCisJCXJldHVybiBQUl9UQUdHRURfQUREUl9FTkFCTEU7CisKKwlyZXR1cm4g
MDsKK30KKworLyoKKyAqIEdsb2JhbCBzeXNjdGwgdG8gZGlzYWJsZSB0aGUgdGFnZ2VkIHVzZXIg
YWRkcmVzc2VzIHN1cHBvcnQuIFRoaXMgY29udHJvbAorICogb25seSBwcmV2ZW50cyB0aGUgdGFn
Z2VkIGFkZHJlc3MgQUJJIGVuYWJsaW5nIHZpYSBwcmN0bCgpIGFuZCBkb2VzIG5vdAorICogZGlz
YWJsZSBpdCBmb3IgdGFza3MgdGhhdCBhbHJlYWR5IG9wdGVkIGluIHRvIHRoZSByZWxheGVkIEFC
SS4KKyAqLworc3RhdGljIGludCB6ZXJvOworc3RhdGljIGludCBvbmUgPSAxOworCitzdGF0aWMg
c3RydWN0IGN0bF90YWJsZSB0YWdnZWRfYWRkcl9zeXNjdGxfdGFibGVbXSA9IHsKKwl7CisJCS5w
cm9jbmFtZQk9ICJ0YWdnZWRfYWRkciIsCisJCS5tb2RlCQk9IDA2NDQsCisJCS5kYXRhCQk9ICZ0
YWdnZWRfYWRkcl9wcmN0bF9hbGxvd2VkLAorCQkubWF4bGVuCQk9IHNpemVvZihpbnQpLAorCQku
cHJvY19oYW5kbGVyCT0gcHJvY19kb2ludHZlY19taW5tYXgsCisJCS5leHRyYTEJCT0gJnplcm8s
CisJCS5leHRyYTIJCT0gJm9uZSwKKwl9LAorCXsgfQorfTsKKworc3RhdGljIGludCBfX2luaXQg
dGFnZ2VkX2FkZHJfaW5pdCh2b2lkKQoreworCWlmICghcmVnaXN0ZXJfc3lzY3RsKCJhYmkiLCB0
YWdnZWRfYWRkcl9zeXNjdGxfdGFibGUpKQorCQlyZXR1cm4gLUVJTlZBTDsKKwlyZXR1cm4gMDsK
K30KKworY29yZV9pbml0Y2FsbCh0YWdnZWRfYWRkcl9pbml0KTsKKyNlbmRpZgkvKiBDT05GSUdf
QVJNNjRfVEFHR0VEX0FERFJfQUJJICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgv
cHJjdGwuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oCmluZGV4IDA5NGJiMDNiOWNjMi4u
MmU5MjdiM2U5ZDZjIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaAorKysg
Yi9pbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaApAQCAtMjI5LDQgKzIyOSw5IEBAIHN0cnVjdCBw
cmN0bF9tbV9tYXAgewogIyBkZWZpbmUgUFJfUEFDX0FQREJLRVkJCQkoMVVMIDw8IDMpCiAjIGRl
ZmluZSBQUl9QQUNfQVBHQUtFWQkJCSgxVUwgPDwgNCkKIAorLyogVGFnZ2VkIHVzZXIgYWRkcmVz
cyBjb250cm9scyBmb3IgYXJtNjQgKi8KKyNkZWZpbmUgUFJfU0VUX1RBR0dFRF9BRERSX0NUUkwJ
CTU1CisjZGVmaW5lIFBSX0dFVF9UQUdHRURfQUREUl9DVFJMCQk1NgorIyBkZWZpbmUgUFJfVEFH
R0VEX0FERFJfRU5BQkxFCQkoMVVMIDw8IDApCisKICNlbmRpZiAvKiBfTElOVVhfUFJDVExfSCAq
LwpkaWZmIC0tZ2l0IGEva2VybmVsL3N5cy5jIGIva2VybmVsL3N5cy5jCmluZGV4IDI5NjkzMDRj
MjlmZS4uYzZjNGQ1MzU4YmQzIDEwMDY0NAotLS0gYS9rZXJuZWwvc3lzLmMKKysrIGIva2VybmVs
L3N5cy5jCkBAIC0xMjQsNiArMTI0LDEyIEBACiAjaWZuZGVmIFBBQ19SRVNFVF9LRVlTCiAjIGRl
ZmluZSBQQUNfUkVTRVRfS0VZUyhhLCBiKQkoLUVJTlZBTCkKICNlbmRpZgorI2lmbmRlZiBTRVRf
VEFHR0VEX0FERFJfQ1RSTAorIyBkZWZpbmUgU0VUX1RBR0dFRF9BRERSX0NUUkwoYSkJKC1FSU5W
QUwpCisjZW5kaWYKKyNpZm5kZWYgR0VUX1RBR0dFRF9BRERSX0NUUkwKKyMgZGVmaW5lIEdFVF9U
QUdHRURfQUREUl9DVFJMKCkJCSgtRUlOVkFMKQorI2VuZGlmCiAKIC8qCiAgKiB0aGlzIGlzIHdo
ZXJlIHRoZSBzeXN0ZW0td2lkZSBvdmVyZmxvdyBVSUQgYW5kIEdJRCBhcmUgZGVmaW5lZCwgZm9y
CkBAIC0yNDkyLDYgKzI0OTgsMTIgQEAgU1lTQ0FMTF9ERUZJTkU1KHByY3RsLCBpbnQsIG9wdGlv
biwgdW5zaWduZWQgbG9uZywgYXJnMiwgdW5zaWduZWQgbG9uZywgYXJnMywKIAkJCXJldHVybiAt
RUlOVkFMOwogCQllcnJvciA9IFBBQ19SRVNFVF9LRVlTKG1lLCBhcmcyKTsKIAkJYnJlYWs7CisJ
Y2FzZSBQUl9TRVRfVEFHR0VEX0FERFJfQ1RSTDoKKwkJZXJyb3IgPSBTRVRfVEFHR0VEX0FERFJf
Q1RSTChhcmcyKTsKKwkJYnJlYWs7CisJY2FzZSBQUl9HRVRfVEFHR0VEX0FERFJfQ1RSTDoKKwkJ
ZXJyb3IgPSBHRVRfVEFHR0VEX0FERFJfQ1RSTCgpOworCQlicmVhazsKIAlkZWZhdWx0OgogCQll
cnJvciA9IC1FSU5WQUw7CiAJCWJyZWFrOwotLSAKMi4yMi4wLjcwOS5nMTAyMzAyMTQ3Yi1nb29n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3871529B
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 19:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CDB89ADC;
	Mon,  6 May 2019 17:19:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3AB89A98
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 16:22:08 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id z16so6686884pgv.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 09:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40wSFiuSnxDz381aUfzuDl5Kav43yI7Ct1/keTyO3F8=;
 b=RLWIstnf6fRzO6ZAtVeThGwcJ5Ks66GM5LzrPpm1XCI0Xxdo3lOKO4gKDC+GkIZLk7
 jUhsjzwt/6ROd4mDpKkOBImEo4lQuW8nq7U9Fb0Z2iNETkxJ4qQ0YUHHEdZA5SvzHVJ7
 HD7N8WdnkRDhF4Rl/N5UWUJK134ncONaTRj45VASclWKJz5TWu0abt5KhMAOfw6B801B
 qaIZPnAzoFrdkzsktpTP7V0kaUIAZOwNmTpdCHSBtcxF8rndSz+fNqYUdmvokOfTWqFu
 ywAvhjNpK27a/9Af3cPrPeEy0Kdv0Drbi1C/6Kgqd0j/kUnhyuPHVso8g+A1swMSc0gi
 xeKA==
X-Gm-Message-State: APjAAAXSXwaJUkUgt6j6S4p6rxYp4G6Grif1TLMjV2FG69SKzUMj+Cks
 wZ3pctLMdfs0TMmoQHxKb1OFlqT51RIH9XPCmmQlcA==
X-Google-Smtp-Source: APXvYqw0KbWeRobzhAngWvuw0v+iBDWRKwDC2xGNXHO8L4kdi1iOFuLP64D72WK0vtdzu/2x0qr2r6kf9SEmu6uA3nY=
X-Received: by 2002:aa7:90ce:: with SMTP id k14mr30343128pfk.239.1557159727868; 
 Mon, 06 May 2019 09:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
 <05c0c078b8b5984af4cc3b105a58c711dcd83342.1556630205.git.andreyknvl@google.com>
 <20190503170310.GL55449@arrakis.emea.arm.com>
In-Reply-To: <20190503170310.GL55449@arrakis.emea.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 6 May 2019 18:21:56 +0200
Message-ID: <CAAeHK+weVYv4Tgj8DXv0ZTFZzGEpLYsn-3wxxmQN+ZW88MXbMw@mail.gmail.com>
Subject: Re: [PATCH v14 13/17] IB/mlx4,
 arm64: untag user pointers in mlx4_get_umem_mr
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Mon, 06 May 2019 17:19:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=40wSFiuSnxDz381aUfzuDl5Kav43yI7Ct1/keTyO3F8=;
 b=DVotpDP1BfYOu9EIG5sO2py/kG385U8+4RKehRk0tC71Vfe/y8Dohrbwudfghmv4gC
 V1LDKukVm8TPgSIGKPKH/+AzQnvMn07KhJn3HSkyadIn3jlSJ5ClUm6UwCAwkx5Lj2ec
 jTZ+KF06FbPmw0HHf3CBeQEfXVzStv1Mct1AUlW1wy4NJfE7vbBjZ0bMdocNxT2oB1CS
 9lHhKeWSjQzqoRHwiiBianLagL8GKIjs0O4OySI/oLm6QzImAzv5mMB4tTPiN7x1FtTU
 rnBUs5QzACe456XBtVa1RIzVbxerlIOvNFz0tCOCg55SYKbtj/SOkAkOVG3enaPf58Zc
 SNbQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Koenig@google.com, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Chintan Pandya <cpandya@codeaurora.org>, Felix <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Deucher@google.com,
 Leon Romanovsky <leonro@mellanox.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Dmitry Vyukov <dvyukov@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kuehling@google.com, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCA3OjAzIFBNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5t
YXJpbmFzQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDM6MjU6
MDlQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggaXMgYSBw
YXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBhcm02NCBrZXJuZWwgQUJJIHRvIGFsbG93IHRv
Cj4gPiBwYXNzIHRhZ2dlZCB1c2VyIHBvaW50ZXJzICh3aXRoIHRoZSB0b3AgYnl0ZSBzZXQgdG8g
c29tZXRoaW5nIGVsc2Ugb3RoZXIKPiA+IHRoYW4gMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVudHMu
Cj4gPgo+ID4gbWx4NF9nZXRfdW1lbV9tcigpIHVzZXMgcHJvdmlkZWQgdXNlciBwb2ludGVycyBm
b3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+ID4gb25seSBieSBkb25lIHdpdGggdW50YWdnZWQg
cG9pbnRlcnMuCj4gPgo+ID4gVW50YWcgdXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xl
LmNvbT4KPiA+IFJldmlld2VkLWJ5OiBMZW9uIFJvbWFub3Zza3kgPGxlb25yb0BtZWxsYW5veC5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2luZmluaWJhbmQvaHcvbWx4NC9tci5jIHwgNyArKysr
LS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYyBiL2Ry
aXZlcnMvaW5maW5pYmFuZC9ody9tbHg0L21yLmMKPiA+IGluZGV4IDM5NTM3OWE0ODBjYi4uOWEz
NWVkMmM2YTZmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIu
Ywo+ID4gKysrIGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYwo+ID4gQEAgLTM3OCw2
ICszNzgsNyBAQCBzdGF0aWMgc3RydWN0IGliX3VtZW0gKm1seDRfZ2V0X3VtZW1fbXIoc3RydWN0
IGliX3VkYXRhICp1ZGF0YSwgdTY0IHN0YXJ0LAo+ID4gICAgICAgICogYWdhaW4KPiA+ICAgICAg
ICAqLwo+ID4gICAgICAgaWYgKCFpYl9hY2Nlc3Nfd3JpdGFibGUoYWNjZXNzX2ZsYWdzKSkgewo+
ID4gKyAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHVudGFnZ2VkX3N0YXJ0ID0gdW50YWdnZWRf
YWRkcihzdGFydCk7Cj4gPiAgICAgICAgICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
Owo+ID4KPiA+ICAgICAgICAgICAgICAgZG93bl9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0p
Owo+ID4gQEAgLTM4Niw5ICszODcsOSBAQCBzdGF0aWMgc3RydWN0IGliX3VtZW0gKm1seDRfZ2V0
X3VtZW1fbXIoc3RydWN0IGliX3VkYXRhICp1ZGF0YSwgdTY0IHN0YXJ0LAo+ID4gICAgICAgICAg
ICAgICAgKiBjb3ZlciB0aGUgbWVtb3J5LCBidXQgZm9yIG5vdyBpdCByZXF1aXJlcyBhIHNpbmds
ZSB2bWEgdG8KPiA+ICAgICAgICAgICAgICAgICogZW50aXJlbHkgY292ZXIgdGhlIE1SIHRvIHN1
cHBvcnQgUk8gbWFwcGluZ3MuCj4gPiAgICAgICAgICAgICAgICAqLwo+ID4gLSAgICAgICAgICAg
ICB2bWEgPSBmaW5kX3ZtYShjdXJyZW50LT5tbSwgc3RhcnQpOwo+ID4gLSAgICAgICAgICAgICBp
ZiAodm1hICYmIHZtYS0+dm1fZW5kID49IHN0YXJ0ICsgbGVuZ3RoICYmCj4gPiAtICAgICAgICAg
ICAgICAgICB2bWEtPnZtX3N0YXJ0IDw9IHN0YXJ0KSB7Cj4gPiArICAgICAgICAgICAgIHZtYSA9
IGZpbmRfdm1hKGN1cnJlbnQtPm1tLCB1bnRhZ2dlZF9zdGFydCk7Cj4gPiArICAgICAgICAgICAg
IGlmICh2bWEgJiYgdm1hLT52bV9lbmQgPj0gdW50YWdnZWRfc3RhcnQgKyBsZW5ndGggJiYKPiA+
ICsgICAgICAgICAgICAgICAgIHZtYS0+dm1fc3RhcnQgPD0gdW50YWdnZWRfc3RhcnQpIHsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZNX1dSSVRFKQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWNjZXNzX2ZsYWdzIHw9IElCX0FDQ0VTU19M
T0NBTF9XUklURTsKPiA+ICAgICAgICAgICAgICAgfSBlbHNlIHsKPgo+IERpc2N1c3Npb24gb25n
b2luZyBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggYnV0IEknbSBtb3JlCj4g
aW5jbGluZWQgdG8gZG8gdGhpcyBpbiBpYl91dmVyYnNfKHJlKXJlZ19tcigpIG9uIGNtZC5zdGFy
dC4KCk9LLCBJIHdhbnQgdG8gcHVibGlzaCB2MTUgc29vbmVyIHRvIGZpeCB0aGUgaXNzdWUgd2l0
aCBlbWFpbHMKYWRkcmVzc2VzLCBzbyBJJ2xsIGltcGxlbWVudCB0aGlzIGFwcHJvYWNoIHRoZXJl
IGZvciBub3cuCgoKCj4KPiAtLQo+IENhdGFsaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4

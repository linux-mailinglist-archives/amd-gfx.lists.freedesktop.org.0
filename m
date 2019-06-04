Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E27583492A
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 15:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBEB898BF;
	Tue,  4 Jun 2019 13:42:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5F3897D7
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 12:27:17 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x47so13385714qtk.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 05:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wnsJg5IBUcpd0uvGih9L7zWjhXAHb1EJO0yOEExZSzo=;
 b=tRnjLDtX36pzQJJU4/OfpABAd9MvRt3BWSa6wkUm5wVLJFdRq1SufXM8Wem5ITaC32
 VWE3hXd0cvgtWZV7k83EHgaARSt4A1B8gBA92lhVZU1BZ1PPAKf9dE5Gh7PUIrTnyp32
 h0/P5Bicch0bE5z17a+H/egCGyH42hJXBPFOX9JlI0bXcub3ANIh7HCmtsV08foesWl9
 aZoYRuX3QsGjVe0ZeZIA+xia6+Fs7XglR3DDD0ZYDwOuE5ej3RpAKf9iSdPdwjX4qYf8
 w+S18mAz/JnQ9xIQv282OL7cWpTBzfETT2vnPvPIO54hHhvakh7IO63U74nxFl6aHUbI
 MKxg==
X-Gm-Message-State: APjAAAVYweiki5VDjo21dSQX1ec1J2r+6/H/PkKCFHhwkV55C4YSSfsN
 RjdRKaiXnTZGM1MrkI+W+K4o2g==
X-Google-Smtp-Source: APXvYqyQKZsajkt/gWb5hfUpWdj5TzMt6KfoFh/bz/W6aTLwqi1dm4Rk21CH5MrcGrt3uoh1Lu64hg==
X-Received: by 2002:aed:3a87:: with SMTP id o7mr27583430qte.310.1559651236150; 
 Tue, 04 Jun 2019 05:27:16 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id c18sm4454633qkm.78.2019.06.04.05.27.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Jun 2019 05:27:15 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hY8X4-000416-LN; Tue, 04 Jun 2019 09:27:14 -0300
Date: Tue, 4 Jun 2019 09:27:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 12/16] IB, arm64: untag user pointers in
 ib_uverbs_(re)reg_mr()
Message-ID: <20190604122714.GA15385@ziepe.ca>
References: <cover.1559580831.git.andreyknvl@google.com>
 <c829f93b19ad6af1b13be8935ce29baa8e58518f.1559580831.git.andreyknvl@google.com>
 <20190603174619.GC11474@ziepe.ca>
 <CAAeHK+xy-dx4dLDLLj9dRzRNSVG9H5nDPPnjpYF38qKZNNCh_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+xy-dx4dLDLLj9dRzRNSVG9H5nDPPnjpYF38qKZNNCh_g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 04 Jun 2019 13:42:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wnsJg5IBUcpd0uvGih9L7zWjhXAHb1EJO0yOEExZSzo=;
 b=dcNC7UmtypwgYv25SVviVAOUG7URTCQh95rjKD+gc1HkGG0jrMjWKvaHqgOqnkLXCe
 CmoljchytuIVIDVbprMz3tL0S5wF3BfmVPwpXMEcKwEKuopvqQDwmPbpLySBrTe+5P0P
 +zjXSkVABYGjw15OrEI3UNK6X3hEEYJ5lmU4VodgY1OGgetHeu4xf6gu/Drrr5PoUFZD
 NGszqORq933qFqUy4wxVOf9PkDJzNBd6Vt6SxvMrx9KcQhBJruI+UAnsanyndNgyFsW8
 SfJHC+U7tiqZ4PP8CoYnZCXFGYoMymsmvspjQbzELX76TfLMwbqeFyJLFyTuqJIB4Dhp
 ZF+A==
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Dmitry Vyukov <dvyukov@google.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDI6MTg6MTlQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBPbiBNb24sIEp1biAzLCAyMDE5IGF0IDc6NDYgUE0gSmFzb24gR3VudGhvcnBl
IDxqZ2dAemllcGUuY2E+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDA2
OjU1OjE0UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiA+IFRoaXMgcGF0Y2gg
aXMgYSBwYXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBhcm02NCBrZXJuZWwgQUJJIHRvIGFs
bG93IHRvCj4gPiA+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGggdGhlIHRvcCBieXRl
IHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+ID4gPiB0aGFuIDB4MDApIGFzIHN5c2NhbGwg
YXJndW1lbnRzLgo+ID4gPgo+ID4gPiBpYl91dmVyYnNfKHJlKXJlZ19tcigpIHVzZSBwcm92aWRl
ZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEgbG9va3VwcyAodGhyb3VnaAo+ID4gPiBlLmcuIG1seDRf
Z2V0X3VtZW1fbXIoKSksIHdoaWNoIGNhbiBvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2lu
dGVycy4KPiA+ID4KPiA+ID4gVW50YWcgdXNlciBwb2ludGVycyBpbiB0aGVzZSBmdW5jdGlvbnMu
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxA
Z29vZ2xlLmNvbT4KPiA+ID4gIGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19jbWQuYyB8
IDQgKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJzX2NtZC5jIGIvZHJp
dmVycy9pbmZpbmliYW5kL2NvcmUvdXZlcmJzX2NtZC5jCj4gPiA+IGluZGV4IDVhM2ExNzgwY2Vl
YS4uZjg4ZWU3MzNlNjE3IDEwMDY0NAo+ID4gPiArKysgYi9kcml2ZXJzL2luZmluaWJhbmQvY29y
ZS91dmVyYnNfY21kLmMKPiA+ID4gQEAgLTcwOSw2ICs3MDksOCBAQCBzdGF0aWMgaW50IGliX3V2
ZXJic19yZWdfbXIoc3RydWN0IHV2ZXJic19hdHRyX2J1bmRsZSAqYXR0cnMpCj4gPiA+ICAgICAg
IGlmIChyZXQpCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4KPiA+ID4gKyAg
ICAgY21kLnN0YXJ0ID0gdW50YWdnZWRfYWRkcihjbWQuc3RhcnQpOwo+ID4gPiArCj4gPiA+ICAg
ICAgIGlmICgoY21kLnN0YXJ0ICYgflBBR0VfTUFTSykgIT0gKGNtZC5oY2FfdmEgJiB+UEFHRV9N
QVNLKSkKPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Cj4gPiBJIGZlZWwg
bGlrZSB3ZSBzaG91bGRuJ3QgdGhhdmUgdG8gZG8gdGhpcyBoZXJlLCBzdXJlbHkgdGhlIGNtZC5z
dGFydAo+ID4gc2hvdWxkIGZsb3cgdW5tb2RpZmllZCB0byBnZXRfdXNlcl9wYWdlcywgYW5kIGd1
cCBzaG91bGQgdW50YWcgaXQ/Cj4gPgo+ID4gaWUsIHRoaXMgc29ydCBvZiBkaXJlY3Rpb24gZm9y
IHRoZSBJQiBjb2RlICh0aGlzIHdvdWxkIGJlIGEgZ2lhbnQKPiA+IHBhdGNoLCBzbyBJIGRpZG4n
dCBoYXZlIHRpbWUgdG8gd3JpdGUgaXQgYWxsLCBidXQgSSB0aGluayBpdCBpcyBtdWNoCj4gPiBz
YW5lcik6Cj4gCj4gSGkgSmFzb24sCj4gCj4gaWJfdXZlcmJzX3JlZ19tcigpIHBhc3NlcyBjbWQu
c3RhcnQgdG8gbWx4NF9nZXRfdW1lbV9tcigpLCB3aGljaCBjYWxscwo+IGZpbmRfdm1hKCksIHdo
aWNoIG9ubHkgYWNjZXB0cyB1bnRhZ2dlZCBhZGRyZXNzZXMuIENvdWxkIHlvdSBleHBsYWluCj4g
aG93IHlvdXIgcGF0Y2ggaGVscHM/CgpUaGF0IG1seDQgaXMganVzdCBhICd3ZWlyZCBkdWNrJywg
aXQgaXMgbm90IHRoZSBub3JtYWwgZmxvdywgYW5kIEkKZG9uJ3QgdGhpbmsgdGhlIGNvcmUgY29k
ZSBzaG91bGQgYmUgbWFraW5nIHNwZWNpYWwgY29uc2lkZXJhdGlvbiBmb3IKaXQuCgpKYXNvbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

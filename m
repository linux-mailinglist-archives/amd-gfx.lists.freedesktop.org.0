Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0877075F
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 19:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0022E89D4F;
	Mon, 22 Jul 2019 17:34:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7DF89A9A
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 16:46:09 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id i18so17930461pgl.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 09:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F8BugWPvgcU2u1kFFZKMyP/IOkg4/qodeykECt+PCWA=;
 b=hD8cS5OjR43a+MD6nMXoM55N4H/M262XB+YdqRcLDFmGaGgGrfKyJT2PDunLNhmtVa
 ETehJX+sJG4frK13eB+KYgh5mH/f6Mu/O5iZiZCMg5wq0ItnjpFKIkYDQaoMP5vuRw0q
 gFfnpzzyhIIP3jrM/gbAKNfltzN4uPdp3FKMT5rZgRGGpkhnG6Q8lLjD9DqFhDRX3OX/
 UbZFGpZx8OBVwhYf3wg/V9apRSPzWfyNN49LvjTPJmmBNo2ewbBbu/b+hObfv8z9gdE0
 MGaWEfCOhHLZqiEk6Gdhxhn2ZwCWy8WrM+WsAgUlrAhSQOjBOtd9QiXL2KyJMYukS8Jv
 zYXA==
X-Gm-Message-State: APjAAAUqGVVsKi4Ek6giJI//rzr0j0430E8xQpIbV4r9nWNB+LQt4HV8
 RrGUs/jJ1MKpg0oYUssUu1nTngg6Kus=
X-Google-Smtp-Source: APXvYqzl1okfrN5zPZDspTEQta/i5+YABh20qrSg3GL1AN5406TswuRoR6v+V+I5B+11TbFoYh/o0Q==
X-Received: by 2002:a17:90a:ff17:: with SMTP id
 ce23mr77676431pjb.47.1563813968675; 
 Mon, 22 Jul 2019 09:46:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 4sm48411440pfc.92.2019.07.22.09.46.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Jul 2019 09:46:07 -0700 (PDT)
Date: Mon, 22 Jul 2019 09:46:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v18 07/15] fs/namespace: untag user pointers in
 copy_mount_options
Message-ID: <201907220944.5821C92518@keescook>
References: <cover.1561386715.git.andreyknvl@google.com>
 <41e0a911e4e4d533486a1468114e6878e21f9f84.1561386715.git.andreyknvl@google.com>
 <20190624175009.GM29120@arrakis.emea.arm.com>
 <CAAeHK+x2TL057Fr0K7FZBTYgeEPVU3cC6scEeiSYk-Jkb3xgfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+x2TL057Fr0K7FZBTYgeEPVU3cC6scEeiSYk-Jkb3xgfg@mail.gmail.com>
X-Mailman-Approved-At: Mon, 22 Jul 2019 17:34:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F8BugWPvgcU2u1kFFZKMyP/IOkg4/qodeykECt+PCWA=;
 b=VX6SSuVoSHuo5NAioif+DJtSSs1RJl179j5hlo4DTfAYF66Jgcx0vpiJB8eR+9HEL8
 +f/45Mc4lQN3jKnZezfzKg+yOPAVpcviTazcgmREFQYvaP41eWd/rYtiTmOP5jut4IGW
 UsbCxeU7Nx57xcR3YkKPrTzMk7AWS/2VcXYuY=
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
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Eric Biederman <ebiederm@xmission.com>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

K0VyaWMgQmllZGVybWFuIHRvbywgd2hvIG1pZ2h0IGJlIGFibGUgdG8gQWNrIHRoaXMuLi4KCk9u
IE1vbiwgSnVsIDE1LCAyMDE5IGF0IDA2OjAwOjA0UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Yg
d3JvdGU6Cj4gT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgNzo1MCBQTSBDYXRhbGluIE1hcmluYXMg
PGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEp1biAyNCwg
MjAxOSBhdCAwNDozMjo1MlBNICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiBU
aGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMga2VybmVsIEFCSSB0
byBhbGxvdyB0byBwYXNzCj4gPiA+IHRhZ2dlZCB1c2VyIHBvaW50ZXJzICh3aXRoIHRoZSB0b3Ag
Ynl0ZSBzZXQgdG8gc29tZXRoaW5nIGVsc2Ugb3RoZXIgdGhhbgo+ID4gPiAweDAwKSBhcyBzeXNj
YWxsIGFyZ3VtZW50cy4KPiA+ID4KPiA+ID4gSW4gY29weV9tb3VudF9vcHRpb25zIGEgdXNlciBh
ZGRyZXNzIGlzIGJlaW5nIHN1YnRyYWN0ZWQgZnJvbSBUQVNLX1NJWkUuCj4gPiA+IElmIHRoZSBh
ZGRyZXNzIGlzIGxvd2VyIHRoYW4gVEFTS19TSVpFLCB0aGUgc2l6ZSBpcyBjYWxjdWxhdGVkIHRv
IG5vdAo+ID4gPiBhbGxvdyB0aGUgZXhhY3RfY29weV9mcm9tX3VzZXIoKSBjYWxsIHRvIGNyb3Nz
IFRBU0tfU0laRSBib3VuZGFyeS4KPiA+ID4gSG93ZXZlciBpZiB0aGUgYWRkcmVzcyBpcyB0YWdn
ZWQsIHRoZW4gdGhlIHNpemUgd2lsbCBiZSBjYWxjdWxhdGVkCj4gPiA+IGluY29ycmVjdGx5Lgo+
ID4gPgo+ID4gPiBVbnRhZyB0aGUgYWRkcmVzcyBiZWZvcmUgc3VidHJhY3RpbmcuCj4gPiA+Cj4g
PiA+IFJldmlld2VkLWJ5OiBLaGFsaWQgQXppeiA8a2hhbGlkLmF6aXpAb3JhY2xlLmNvbT4KPiA+
ID4gUmV2aWV3ZWQtYnk6IFZpbmNlbnpvIEZyYXNjaW5vIDx2aW5jZW56by5mcmFzY2lub0Bhcm0u
Y29tPgo+ID4gPiBSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+
Cj4gPiA+IFJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0u
Y29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdv
b2dsZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZnMvbmFtZXNwYWNlLmMgfCAyICstCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4g
ZGlmZiAtLWdpdCBhL2ZzL25hbWVzcGFjZS5jIGIvZnMvbmFtZXNwYWNlLmMKPiA+ID4gaW5kZXgg
NzY2MGMyNzQ5Yzk2Li5lYzc4ZjcyMjM5MTcgMTAwNjQ0Cj4gPiA+IC0tLSBhL2ZzL25hbWVzcGFj
ZS5jCj4gPiA+ICsrKyBiL2ZzL25hbWVzcGFjZS5jCj4gPiA+IEBAIC0yOTk0LDcgKzI5OTQsNyBA
QCB2b2lkICpjb3B5X21vdW50X29wdGlvbnMoY29uc3Qgdm9pZCBfX3VzZXIgKiBkYXRhKQo+ID4g
PiAgICAgICAgKiB0aGUgcmVtYWluZGVyIG9mIHRoZSBwYWdlLgo+ID4gPiAgICAgICAgKi8KPiA+
ID4gICAgICAgLyogY29weV9mcm9tX3VzZXIgY2Fubm90IGNyb3NzIFRBU0tfU0laRSAhICovCj4g
PiA+IC0gICAgIHNpemUgPSBUQVNLX1NJWkUgLSAodW5zaWduZWQgbG9uZylkYXRhOwo+ID4gPiAr
ICAgICBzaXplID0gVEFTS19TSVpFIC0gKHVuc2lnbmVkIGxvbmcpdW50YWdnZWRfYWRkcihkYXRh
KTsKPiA+ID4gICAgICAgaWYgKHNpemUgPiBQQUdFX1NJWkUpCj4gPiA+ICAgICAgICAgICAgICAg
c2l6ZSA9IFBBR0VfU0laRTsKPiA+Cj4gPiBJIHRoaW5rIHRoaXMgcGF0Y2ggbmVlZHMgYW4gYWNr
IGZyb20gQWwgVmlybyAoY2MnZWQpLgo+ID4KPiA+IC0tCj4gPiBDYXRhbGluCj4gCj4gSGkgQWws
Cj4gCj4gQ291bGQgeW91IHRha2UgYSBsb29rIGFuZCBnaXZlIHlvdXIgYWNrZWQtYnk/Cj4gCj4g
VGhhbmtzIQoKLS0gCktlZXMgQ29vawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=

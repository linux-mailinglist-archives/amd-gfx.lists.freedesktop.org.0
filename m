Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB1273B5
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 03:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CB089C51;
	Thu, 23 May 2019 01:02:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D3289C9C
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 23:03:51 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id g194so923107vke.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 16:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=083fICcLHdIZzVNufU25syYhE84WJwTKtiHOZtf8SA0=;
 b=aieJo7aj27OO1i/uCbrJ4cE/NCvqUqVGhP0OlmBi8X1vnwJNILcCXh3itlvKXAr6vd
 bczHmaxyD/PcqpvlJNLr+ot66OcveXMIQA8G/r2MCejBpq4kL2tJmfMit4vcUj7EUcnF
 uK2FGuHi7DUmBh1mrV/ksozFwsnzhOJJtlvkrXPm761jyLRC74Cjfzfol9SHl94B7Hcp
 GkcWh64MQJTcGK9U6x/LhRZZKkDEpislKOKExFvgviXnmVjQZq6aAs3eBZx2r0sbcA7P
 kQvOalGGtpp1Ken7C1NKaw1h6skv51IcPoWH3Xm6Wobvxy8OZsz6u/JUreCvWAk4nwRc
 M4xg==
X-Gm-Message-State: APjAAAVBcyXS0J0FClBYnhq8oaEdN4aGc/+08LCzqe7CTMlRFolcAi5q
 mTR488S0R+USKdbeUXNJGSwSECh2BwK3CD+FPSXZ0A==
X-Google-Smtp-Source: APXvYqxPKtiNPawqkCkuPCNw0GStvO0zt/hmYPvT2nokhB6CEYZVKos9gwheEkiU5Yy2rN1PLFcfrDl2WDUSCoUDbnM=
X-Received: by 2002:a1f:4ec6:: with SMTP id c189mr128107vkb.17.1558566229772; 
 Wed, 22 May 2019 16:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp> <201905211633.6C0BF0C2@keescook>
 <20190522101110.m2stmpaj7seezveq@mbp>
 <CAJgzZoosKBwqXRyA6fb8QQSZXFqfHqe9qO9je5TogHhzuoGXJQ@mail.gmail.com>
 <20190522163527.rnnc6t4tll7tk5zw@mbp> <201905221316.865581CF@keescook>
In-Reply-To: <201905221316.865581CF@keescook>
From: Evgenii Stepanov <eugenis@google.com>
Date: Wed, 22 May 2019 16:03:36 -0700
Message-ID: <CAFKCwrjOjdJAbcABp3qxwyYy+hgfyQirvmqGkDSJVJe5pSz0Uw@mail.gmail.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
To: Kees Cook <keescook@chromium.org>
X-Mailman-Approved-At: Thu, 23 May 2019 01:02:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=083fICcLHdIZzVNufU25syYhE84WJwTKtiHOZtf8SA0=;
 b=R1whbY0DRJvYeo6WDezCnq6bV0i36te0/v1SFgHuDKDfWdFfZ1uqlfu6C2/257hQWf
 13OBZbWoVT2d4n1OkMyYTaJdzzdNJVODvxD7ax/78bOTFn0UZG6rkpjhsDxguOSNWQSW
 /pem354o3ayyWSPYKkkwbewRgzXJsoaUxgC/ouAEGxy6liid3L/+YVw/SLmKu4nN5deA
 sI1HZSYq1Jfkv/d/KsZmiH7dePki/Ktib/+2n6rc/FESU7nQ1RBKbd2tskxVzb2WzGm/
 +2fOWm+jMAJ/JCuclmW37/f6kDPw2o5cg4ErXP4x4jo4xyXhp8lPR9gvbLshZk81RzVf
 ErKA==
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
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
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

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMTo0NyBQTSBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9t
aXVtLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAyMiwgMjAxOSBhdCAwNTozNToyN1BNICsw
MTAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gPiBUaGUgdHdvIGhhcmQgcmVxdWlyZW1lbnRz
IEkgaGF2ZSBmb3Igc3VwcG9ydGluZyBhbnkgbmV3IGhhcmR3YXJlIGZlYXR1cmUKPiA+IGluIExp
bnV4IGFyZSAoMSkgYSBzaW5nbGUga2VybmVsIGltYWdlIGJpbmFyeSBjb250aW51ZXMgdG8gcnVu
IG9uIG9sZAo+ID4gaGFyZHdhcmUgd2hpbGUgbWFraW5nIHVzZSBvZiB0aGUgbmV3IGZlYXR1cmUg
aWYgYXZhaWxhYmxlIGFuZCAoMikgb2xkCj4gPiB1c2VyIHNwYWNlIGNvbnRpbnVlcyB0byBydW4g
b24gbmV3IGhhcmR3YXJlIHdoaWxlIG5ldyB1c2VyIHNwYWNlIGNhbgo+ID4gdGFrZSBhZHZhbnRh
Z2Ugb2YgdGhlIG5ldyBmZWF0dXJlLgo+Cj4gQWdyZWVkISBBbmQgSSB0aGluayB0aGUgc2VyaWVz
IG1lZXRzIHRoZXNlIHJlcXVpcmVtZW50cywgeWVzPwo+Cj4gPiBGb3IgTVRFLCB3ZSBqdXN0IGNh
bid0IGVuYWJsZSBpdCBieSBkZWZhdWx0IHNpbmNlIHRoZXJlIGFyZSBhcHBsaWNhdGlvbnMKPiA+
IHdobyB1c2UgdGhlIHRvcCBieXRlIG9mIGEgcG9pbnRlciBhbmQgZXhwZWN0IGl0IHRvIGJlIGln
bm9yZWQgcmF0aGVyCj4gPiB0aGFuIGZhaWxpbmcgd2l0aCBhIG1pc21hdGNoZWQgdGFnLiBKdXN0
IHRoaW5rIG9mIGEgaHdhc2FuIGNvbXBpbGVkCj4gPiBiaW5hcnkgd2hlcmUgVEJJIGlzIGV4cGVj
dGVkIHRvIHdvcmsgYW5kIHlvdSB0cnkgdG8gcnVuIGl0IHdpdGggTVRFCj4gPiB0dXJuZWQgb24u
Cj4KPiBBaCEgT2theSwgaGVyZSdzIHRoZSB1c2UtY2FzZSBJIHdhc24ndCB0aGlua2luZyBvZjog
dGhlIGNvbmNlcm4gaXMgVEJJCj4gY29uZmxpY3Rpbmcgd2l0aCBNVEUuIEFuZCBhbnl0aGluZyB0
aGF0IHN0YXJ0cyB1c2luZyBUQkkgc3VkZGVubHkgY2FuJ3QKPiBydW4gaW4gdGhlIGZ1dHVyZSBi
ZWNhdXNlIGl0J3MgYmVpbmcgaW50ZXJwcmV0ZWQgYXMgTVRFIGJpdHM/IChJcyB0aGF0Cj4gdGhl
IEFCSSBjb25jZXJuPyBJIGZlZWwgbGlrZSB3ZSBnb3QgaW50byB0aGUgd2VlZHMgYWJvdXQgaW9j
dGwoKXMgYW5kCj4gb25lLW9mZiBidWdzLi4uKQo+Cj4gU28gdGhlcmUgbmVlZHMgdG8gYmUgc29t
ZSB3YXkgdG8gbGV0IHRoZSBrZXJuZWwga25vdyB3aGljaCBvZiB0aHJlZQo+IHRoaW5ncyBpdCBz
aG91bGQgYmUgZG9pbmc6Cj4gMS0gbGVhdmluZyB1c2Vyc3BhY2UgYWRkcmVzc2VzIGFzLWlzIChw
cmVzZW50KQo+IDItIHdpcGluZyB0aGUgdG9wIGJpdHMgYmVmb3JlIHVzaW5nICh0aGlzIHNlcmll
cykKPiAzLSB3aXBpbmcgdGhlIHRvcCBiaXRzIGZvciBtb3N0IHRoaW5ncywgYnV0IHJldGFpbmlu
ZyB0aGVtIGZvciBNVEUgYXMKPiAgICBuZWVkZWQgKHRoZSBmdXR1cmUpCj4KPiBJIGV4cGVjdCBN
VEUgdG8gYmUgdGhlICJkZWZhdWx0IiBpbiB0aGUgZnV0dXJlLiBPbmNlIGEgc3lzdGVtJ3MgbGli
YyBoYXMKPiBncm93biBzdXBwb3J0IGZvciBpdCwgZXZlcnl0aGluZyB3aWxsIGJlIHRyeWluZyB0
byB1c2UgTVRFLiBUQkkgd2lsbCBiZQo+IHRoZSBzcGVjaWFsIGNhc2UgKGJ1dCBUQkkgaXMgZWZm
ZWN0aXZlbHkgYSBwcmVyZXF1aXNpdGUpLgo+Cj4gQUZBSUNULCB0aGUgb25seSBkaWZmZXJlbmNl
IEkgc2VlIGJldHdlZW4gMiBhbmQgMyB3aWxsIGJlIHRoZSB0YWcgaGFuZGxpbmcKPiBpbiB1c2Vy
Y29weSAoYWxsIG90aGVyIHBsYWNlcyB3aWxsIGNvbnRpbnVlIHRvIGlnbm9yZSB0aGUgdG9wIGJp
dHMpLiBJcwo+IHRoYXQgYWNjdXJhdGU/Cj4KPiBJcyAiMSIgYSBwZXItcHJvY2VzcyBzdGF0ZSB3
ZSB3YW50IHRvIGtlZXA/IChJIGFzc3VtZSBub3QsIGJ1dCByYXRoZXIgaXQKPiBpcyBhdmFpbGFi
bGUgdmlhIG5vIFRCSS9NVEUgQ09ORklHIG9yIGEgYm9vdC10aW1lIG9wdGlvbiwgaWYgYXQgYWxs
PykKPgo+IFRvIGNob29zZSBiZXR3ZWVuICIyIiBhbmQgIjMiLCBpdCBzZWVtcyB3ZSBuZWVkIGEg
cGVyLXByb2Nlc3MgZmxhZyB0bwo+IG9wdCBpbnRvIFRCSSAoYW5kIG91dCBvZiBNVEUpLiBGb3Ig
dXNlcnNwYWNlLCBob3cgd291bGQgYSBmdXR1cmUgYmluYXJ5Cj4gY2hvb3NlIFRCSSBvdmVyIE1U
RT8gSWYgaXQncyBhIGxpYnJhcnkgaXNzdWUsIHdlIGNhbid0IHVzZSBhbiBFTEYgYml0LAo+IHNp
bmNlIHRoZSBjaG9pY2UgbWF5IGJlICJsYXRlIiBhZnRlciBFTEYgbG9hZCAodGhpcyBpbXBsaWVz
IHRoZSBuZWVkCj4gZm9yIGEgcHJjdGwoKS4pIElmIGl0J3MgYmluYXJ5LW9ubHkgKCJidWlsdCB3
aXRoIEhXS0FTYW4iKSB0aGVuIGFuIEVMRgo+IGJpdCBzZWVtcyBzdWZmaWNpZW50LiBBbmQgd2l0
aG91dCB0aGUgbWFya2luZywgSSdkIGV4cGVjdCB0aGUga2VybmVsIHRvCj4gZW5mb3JjZSBNVEUg
d2hlbiB0aGVyZSBhcmUgaGlnaCBiaXRzLgo+Cj4gPiBJIHdvdWxkIGFsc28gZXhwZWN0IHRoZSBD
IGxpYnJhcnkgb3IgZHluYW1pYyBsb2FkZXIgdG8gY2hlY2sgZm9yIHRoZQo+ID4gcHJlc2VuY2Ug
b2YgYSBIV0NBUF9NVEUgYml0IGJlZm9yZSBzdGFydGluZyB0byB0YWcgbWVtb3J5IGFsbG9jYXRp
b25zLAo+ID4gb3RoZXJ3aXNlIGl0IHdvdWxkIGdldCBTSUdJTEwgb24gdGhlIGZpcnN0IE1URSBp
bnN0cnVjdGlvbiBpdCB0cmllcyB0bwo+ID4gZXhlY3V0ZS4KPgo+IEkndmUgZ290IHRoZSBzYW1l
IHF1ZXN0aW9uIGFzIEVsbGlvdDogYXJlbid0IE1URSBpbnN0cnVjdGlvbnMganVzdCBOT1AKPiB0
byBvbGRlciBDUFVzPyBJLmUuIGlmIHRoZSBDUFUgKG9yIGtlcm5lbCkgZG9uJ3Qgc3VwcG9ydCBp
dCwgaXQganVzdAo+IGdldHMgZW50aXJlbHkgaWdub3JlZDogY2hlY2tpbmcgaXMgb25seSBuZWVk
ZWQgdG8gc2F0aXNmeSBjdXJpb3NpdHkKPiBvciBiZWhhdmlvcmFsIGV4cGVjdGF0aW9ucy4KCk1U
RSBpbnN0cnVjdGlvbnMgYXJlIG5vdCBOT1AuIE1vc3Qgb2YgdGhlbSBoYXZlIHNpZGUgZWZmZWN0
cyAoY2hhbmdpbmcKcmVnaXN0ZXIgdmFsdWVzLCB6ZXJvaW5nIG1lbW9yeSkuClRoaXMgb25seSBt
YXR0ZXJzIGZvciBzdGFjayB0YWdnaW5nLCB0aG91Z2guIEhlYXAgdGFnZ2luZyBpcyBhIHJ1bnRp
bWUKZGVjaXNpb24gaW4gdGhlIGFsbG9jYXRvci4KCklmIGFuIGltYWdlIG5lZWRzIHRvIHJ1biBv
biBvbGQgaGFyZHdhcmUsIGl0IHdpbGwgaGF2ZSB0byBkbyBoZWFwIHRhZ2dpbmcgb25seS4KCj4g
VG8gbWUsIHRoZSBjb25mbGljdCBzZWVtcyB0byBiZSB1c2luZyBUQkkgaW4gdGhlIGZhY2Ugb2Yg
ZXhwZWN0aW5nIE1URSB0bwo+IGJlIHRoZSBkZWZhdWx0IHN0YXRlIG9mIHRoZSBmdXR1cmUuIChC
dXQgdGhlIGludGVybmFsIGNoYW5nZXMgbmVlZGVkCj4gZm9yIFRCSSAtLSB0aGlzIHNlcmllcyAt
LSBpcyBhIHByZXJlcSBmb3IgTVRFLikKPgo+IC0tCj4gS2VlcyBDb29rCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D46BA9B7F
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 09:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD41089F1B;
	Thu,  5 Sep 2019 07:16:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2B189428
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 14:52:46 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id d15so3888470pfo.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 04 Sep 2019 07:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qo9btwDVywt5Z4ijSkpPcdJcIxoBud+XrMQP8DLBtZA=;
 b=THxZ38Uo6XNouzYxDwwa7GuhunMNz7pIRqV4OZx8tLsX5BUZYgBd7N/nwKKbcTLaQg
 KTLsK3bzOPGeBAZE6aL5pka5Yripu8KLI8shPZIgRbP2UBIMaO9KRwc+t9BooEpnG3lD
 AGgHgZRwqWCvOZJ/Gm9XQGV+K3kN0JVzAOHv4s0RDbcrM+eO+6jQUvKxfGk+d9a4R+Jk
 jiEeYo27/eJl7xWa+pQRFRJAtob5/xuEvz//6+D8477qqN4LwgQFKtVo0oLJNGVzfUGJ
 E7/aPlJ4pHOszIWWAHsW20BaZkQpBNo81erldxTvNeHJoos6lFwY+rfWTpRJe/m4PjXt
 iw8A==
X-Gm-Message-State: APjAAAXNFSTdZViaUxGKAGhGjQkRbpiR2Z2EtlhC36DAQWdqRL/+GJVl
 B3VBlbIHrDNftPQADPY0E8G6tjTj/5o0ToKDnjZqSQ==
X-Google-Smtp-Source: APXvYqwZikXx2qjQtQDGtXVxmy03OmbTt42Hq77Y/o/GV+iGPZsxsZsTVPVlPZ5ZZxAgajR2zq/oq6os3dIlpFoD/6c=
X-Received: by 2002:a62:db84:: with SMTP id f126mr21108068pfg.25.1567608765533; 
 Wed, 04 Sep 2019 07:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
 <0999c80cd639b78ae27c0674069d552833227564.1561386715.git.andreyknvl@google.com>
 <6af3f619-4356-2f67-ed76-92beceb1e0a0@arm.com>
 <CAAeHK+yhbUcuLhoetjGUbqM4j9fX84hbwmxzNPF+e1zXj6nKNw@mail.gmail.com>
 <d6bc5c4b-68b5-0a58-0f52-8bce20986dcf@arm.com>
In-Reply-To: <d6bc5c4b-68b5-0a58-0f52-8bce20986dcf@arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 4 Sep 2019 16:52:34 +0200
Message-ID: <CAAeHK+xXN_oHt0rAcWdTs0XhkYRhWqf3iv-n+dYmY075xosJnw@mail.gmail.com>
Subject: Re: [PATCH v18 15/15] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
To: Cristian Marussi <cristian.marussi@arm.com>
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:15:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qo9btwDVywt5Z4ijSkpPcdJcIxoBud+XrMQP8DLBtZA=;
 b=sFYGsFaeqOIttaX75Mh0Jt6LsiFSSow8MH7y6a52jVXYkPlB1jD+rvA4kSYVmUJSrq
 ojaEis6BbnDlau6vVkJKwiWkmN6zMu//M8lERzORRYA28oks7bKvz+fi2QSu5aHhBXJm
 O/PmjUuBojgWEQa6N+q6OiUTmJ5L9TMtAmd+gBA/NdlmY1MODkn3rLfzDaOCv9tRsacx
 4dmkg20CXiWx+J7ZAz0xREJaTi8oA5eF/vV3VC3sYSLhW9lwFJRkFdCbQjsqOmODrC3r
 Jc7rxpY3eSw3R+jZ29b3q93JyDXmqBWLrqLsbJmUM1evPQg9JO6Jb87uqDCH8BQY1hzb
 0PwQ==
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
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
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

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgNzo0OSBQTSBDcmlzdGlhbiBNYXJ1c3NpCjxjcmlzdGlh
bi5tYXJ1c3NpQGFybS5jb20+IHdyb3RlOgo+Cj4KPiBIaQo+Cj4gT24gMjMvMDgvMjAxOSAxODox
NiwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDM6
NTYgUE0gQ3Jpc3RpYW4gTWFydXNzaQo+ID4gPGNyaXN0aWFuLm1hcnVzc2lAYXJtLmNvbT4gd3Jv
dGU6Cj4gPj4KPiA+PiBIaSBBbmRyZXkKPiA+Pgo+ID4+IE9uIDI0LzA2LzIwMTkgMTU6MzMsIEFu
ZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPj4+IFRoaXMgcGF0Y2ggaXMgYSBwYXJ0IG9mIGEgc2Vy
aWVzIHRoYXQgZXh0ZW5kcyBrZXJuZWwgQUJJIHRvIGFsbG93IHRvIHBhc3MKPiA+Pj4gdGFnZ2Vk
IHVzZXIgcG9pbnRlcnMgKHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBv
dGhlciB0aGFuCj4gPj4+IDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRzLgo+ID4+Pgo+ID4+PiBU
aGlzIHBhdGNoIGFkZHMgYSBzaW1wbGUgdGVzdCwgdGhhdCBjYWxscyB0aGUgdW5hbWUgc3lzY2Fs
bCB3aXRoIGEKPiA+Pj4gdGFnZ2VkIHVzZXIgcG9pbnRlciBhcyBhbiBhcmd1bWVudC4gV2l0aG91
dCB0aGUga2VybmVsIGFjY2VwdGluZyB0YWdnZWQKPiA+Pj4gdXNlciBwb2ludGVycyB0aGUgdGVz
dCBmYWlscyB3aXRoIEVGQVVMVC4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtv
bm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgo+ID4+PiAtLS0KPiA+Pj4gIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2FybTY0Ly5naXRpZ25vcmUgICAgICB8ICAxICsKPiA+Pj4gIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01ha2VmaWxlICAgICAgICB8IDExICsrKysrKysKPiA+
Pj4gIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9ydW5fdGFnc190ZXN0LnNoICB8IDEyICsr
KysrKysrCj4gPj4+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC90YWdzX3Rlc3QuYyAg
ICAgfCAyOSArKysrKysrKysrKysrKysrKysrCj4gPj4+ICA0IGZpbGVzIGNoYW5nZWQsIDUzIGlu
c2VydGlvbnMoKykKPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9hcm02NC8uZ2l0aWdub3JlCj4gPj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYXJtNjQvTWFrZWZpbGUKPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDc1NSB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9ydW5fdGFnc190ZXN0LnNoCj4gPj4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMK
PiA+Pgo+ID4+IEFmdGVyIGJ1aWxkaW5nIGEgZnJlc2ggS2VybmVsIGZyb20gYXJtNjQvZm9yLW5l
eHQtY29yZSBmcm9tIHNjcmF0Y2ggYXQ6Cj4gPj4KPiA+PiBjb21taXQgMjM5YWI2NThiZWEzYjM4
NzQyNDUwMWU3YzQxNjY0MGQ2NzUyZGMwYwo+ID4+IE1lcmdlOiA2YmZhMzEzNGJkM2EgNDJkMDM4
YzRmYjAwIDEyNDNjYjZhNjc2ZiBkNTVjNWYyOGFmYWYgZDA2ZmE1YTExOGYxIDM0YjU1NjBkYjQw
ZAo+ID4+IEF1dGhvcjogV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4KPiA+PiBEYXRlOiAg
IFRodSBBdWcgMjIgMTg6MjM6NTMgMjAxOSArMDEwMAo+ID4+Cj4gPj4gICAgIE1lcmdlIGJyYW5j
aGVzICdmb3ItbmV4dC9lcnJvci1pbmplY3Rpb24nLCAnZm9yLW5leHQvdGJpJywgJ2Zvci1uZXh0
L3BzY2ktY3B1aWRsZScsICdmb3ItbmV4dC9jcHUtdG9wb2xvZ3knIGFuZCAnZm9yLW5leHQvNTIt
Yml0LWt2YScgaW50byBmb3ItbmV4dC9jb3JlCj4gPj4KPiA+Pgo+ID4+IEtTRlQgYXJtNjQgdGVz
dHMgYnVpbGQgaXMgYnJva2VuIGZvciBtZSwgYm90aCBzZXR0aW5nIG9yIG5vdCBLQlVJTERfT1VU
UFVUPQo+ID4+Cj4gPj4gMTM6MzAgJCBtYWtlIFRBUkdFVFM9YXJtNjQga3NlbGZ0ZXN0LWNsZWFu
Cj4gPj4gbWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvaG9tZS9jcmltYXIwMS9BUk0vZGV2
L3NyYy9wZHN3L291dF9saW51eCcKPiA+PiBybSAtZiAtciAvaG9tZS9jcmltYXIwMS9BUk0vZGV2
L3NyYy9wZHN3L291dF9saW51eC8va3NlbGZ0ZXN0L2FybTY0L3RhZ3NfdGVzdAo+ID4+IG1ha2Vb
MV06IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9jcmltYXIwMS9BUk0vZGV2L3NyYy9wZHN3L291
dF9saW51eCcKPiA+Pgo+ID4+IOKclCB+L0FSTS9kZXYvc3JjL3Bkc3cvbGludXggW2FybTY0X2Zv
cl9uZXh0X2NvcmV84oCmOOKakSAyM10KPiA+Pgo+ID4+IDEzOjMwICQgbWFrZSBUQVJHRVRTPWFy
bTY0IGtzZWxmdGVzdAo+ID4+IG1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSAnL2hvbWUvY3Jp
bWFyMDEvQVJNL2Rldi9zcmMvcGRzdy9vdXRfbGludXgnCj4gPj4gYXJjaC9hcm02NC9NYWtlZmls
ZTo1NjogQ1JPU1NfQ09NUElMRV9DT01QQVQgbm90IGRlZmluZWQgb3IgZW1wdHksIHRoZSBjb21w
YXQgdkRTTyB3aWxsIG5vdCBiZSBidWlsdAo+ID4+IG1ha2UgLS1uby1idWlsdGluLXJ1bGVzIElO
U1RBTExfSERSX1BBVEg9JEJVSUxEL3VzciBcCj4gPj4gICAgICAgICBBUkNIPWFybTY0IC1DIC4u
Ly4uLy4uIGhlYWRlcnNfaW5zdGFsbAo+ID4+ICAgSE9TVENDICBzY3JpcHRzL2Jhc2ljL2ZpeGRl
cAo+ID4+ICAgSE9TVENDICBzY3JpcHRzL3VuaWZkZWYKPiA+PiAuLi4KPiA+PiAuLi4KPiA+PiAg
IEhEUklOU1QgdXNyL2luY2x1ZGUvYXNtL21zZ2J1Zi5oCj4gPj4gICBIRFJJTlNUIHVzci9pbmNs
dWRlL2FzbS9zaG1idWYuaAo+ID4+ICAgSU5TVEFMTCAvaG9tZS9jcmltYXIwMS9BUk0vZGV2L3Ny
Yy9wZHN3L291dF9saW51eC8va3NlbGZ0ZXN0L3Vzci9pbmNsdWRlCj4gPj4gL29wdC90b29sY2hh
aW5zL2djYy1hcm0tOC4zLTIwMTkuMDMteDg2XzY0LWFhcmNoNjQtbGludXgtZ251L2Jpbi9hYXJj
aDY0LWxpbnV4LWdudS1nY2MgICAgIHRhZ3NfdGVzdC5jICAtbyAvaG9tZS9jcmltYXIwMS9BUk0v
ZGV2L3NyYy9wZHN3L291dF9saW51eC8va3NlbGZ0ZXN0L2FybTY0L3RhZ3NfdGVzdAo+ID4+IHRh
Z3NfdGVzdC5jOiBJbiBmdW5jdGlvbiDigJhtYWlu4oCZOgo+ID4+IHRhZ3NfdGVzdC5jOjIxOjEy
OiBlcnJvcjog4oCYUFJfU0VUX1RBR0dFRF9BRERSX0NUUkzigJkgdW5kZWNsYXJlZCAoZmlyc3Qg
dXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYUFJfR0VUX1RJRF9BRERSRVNT
4oCZPwo+ID4+ICAgaWYgKHByY3RsKFBSX1NFVF9UQUdHRURfQUREUl9DVFJMLCBQUl9UQUdHRURf
QUREUl9FTkFCTEUsIDAsIDAsIDApID09IDApCj4gPj4gICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KPiA+PiAgICAgICAgICAgICBQUl9HRVRfVElEX0FERFJFU1MKPiA+PiB0YWdz
X3Rlc3QuYzoyMToxMjogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0
ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4KPiA+PiB0YWdzX3Rl
c3QuYzoyMTozNzogZXJyb3I6IOKAmFBSX1RBR0dFRF9BRERSX0VOQUJMReKAmSB1bmRlY2xhcmVk
IChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhQUl9HRVRfRFVN
UEFCTEXigJk/Cj4gPj4gICBpZiAocHJjdGwoUFJfU0VUX1RBR0dFRF9BRERSX0NUUkwsIFBSX1RB
R0dFRF9BRERSX0VOQUJMRSwgMCwgMCwgMCkgPT0gMCkKPiA+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBSX0dFVF9EVU1QQUJMRQo+ID4+IC4uL2xpYi5tazox
Mzg6IHJlY2lwZSBmb3IgdGFyZ2V0ICcvaG9tZS9jcmltYXIwMS9BUk0vZGV2L3NyYy9wZHN3L291
dF9saW51eC8va3NlbGZ0ZXN0L2FybTY0L3RhZ3NfdGVzdCcgZmFpbGVkCj4gPj4gbWFrZVszXTog
KioqIFsvaG9tZS9jcmltYXIwMS9BUk0vZGV2L3NyYy9wZHN3L291dF9saW51eC8va3NlbGZ0ZXN0
L2FybTY0L3RhZ3NfdGVzdF0gRXJyb3IgMQo+ID4+IE1ha2VmaWxlOjEzNjogcmVjaXBlIGZvciB0
YXJnZXQgJ2FsbCcgZmFpbGVkCj4gPj4gbWFrZVsyXTogKioqIFthbGxdIEVycm9yIDIKPiA+PiAv
aG9tZS9jcmltYXIwMS9BUk0vZGV2L3NyYy9wZHN3L2xpbnV4L01ha2VmaWxlOjEyMzc6IHJlY2lw
ZSBmb3IgdGFyZ2V0ICdrc2VsZnRlc3QnIGZhaWxlZAo+ID4+IG1ha2VbMV06ICoqKiBba3NlbGZ0
ZXN0XSBFcnJvciAyCj4gPj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy9ob21lL2NyaW1h
cjAxL0FSTS9kZXYvc3JjL3Bkc3cvb3V0X2xpbnV4Jwo+ID4+IE1ha2VmaWxlOjE3OTogcmVjaXBl
IGZvciB0YXJnZXQgJ3N1Yi1tYWtlJyBmYWlsZWQKPiA+PiBtYWtlOiAqKiogW3N1Yi1tYWtlXSBF
cnJvciAyCj4gPj4KPiA+PiBEZXNwaXRlIHNlZWluZyBLU0ZUIGluc3RhbGxpbmcgS2VybmVsIEhl
YWRlcnMsIHRoZXkgY2Fubm90IGJlIGZvdW5kLgo+ID4+Cj4gPj4gRml4aW5nIHRoaXMgcGF0Y2gg
bGlrZSB0aGlzIG1ha2UgaXQgd29yayBmb3IgbWU6Cj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9hcm02NC9NYWtlZmlsZQo+ID4+IGluZGV4IGE2MWIyZTc0M2U5OS4uZjlmNzlmYjI3MmYw
IDEwMDY0NAo+ID4+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01ha2VmaWxl
Cj4gPj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvTWFrZWZpbGUKPiA+PiBA
QCAtNCw2ICs0LDcgQEAKPiA+PiAgQVJDSCA/PSAkKHNoZWxsIHVuYW1lIC1tIDI+L2Rldi9udWxs
IHx8IGVjaG8gbm90KQo+ID4+Cj4gPj4gIGlmbmVxICgsJChmaWx0ZXIgJChBUkNIKSxhYXJjaDY0
IGFybTY0KSkKPiA+PiArQ0ZMQUdTICs9IC1JLi4vLi4vLi4vLi4vdXNyL2luY2x1ZGUvCj4gPj4g
IFRFU1RfR0VOX1BST0dTIDo9IHRhZ3NfdGVzdAo+ID4+ICBURVNUX1BST0dTIDo9IHJ1bl90YWdz
X3Rlc3Quc2gKPiA+PiAgZW5kaWYKPiA+Pgo+ID4+IGJ1dCBpcyBub3QgcmVhbGx5IGEgcHJvcGVy
IGZpeCBzaW5jZSBpdCBkb2VzIE5PVCBhY2NvdW50IGZvciBjYXNlIGluIHdoaWNoIHlvdSBoYXZl
Cj4gPj4gaW5zdGFsbGVkIHRoZSBLZXJuZWwgSGVhZGVycyBpbiBhIG5vbiBzdGFuZGFyZCBsb2Nh
dGlvbiBsaWtlIHdoZW4geW91IHVzZSBLQlVJTERfT1VUUFVULgo+ID4+Cj4gPj4gQW0gSSBtaXNz
aW5nIHNvbWV0aGluZyA/Cj4gPgo+ID4gSG0sIFBSX1NFVF9UQUdHRURfQUREUl9DVFJMIGlzIGRl
ZmluZWQgaW4gaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmgsCj4gPiBhbmQgdGhlIHRlc3QgaGFz
ICNpbmNsdWRlIDxzeXMvcHJjdGwuaD4gc28gYXMgbG9uZyBhcyB5b3UndmUgdXBkYXRlZAo+ID4g
eW91ciBrZXJuZWwgaGVhZGVycyB0aGlzIHNob3VsZCB3b3JrLgo+ID4KPiA+IChJJ20gT09PIG5l
eHQgd2VlaywgSSdsbCBzZWUgaWYgSSBjYW4gcmVwcm9kdWNlIHRoaXMgb25jZSBJJ20gYmFjayku
Cj4KPiBPay4gVGhhbmtzIGZvciB0aGUgcmVwbHkuCj4KPiBJIHRoaW5rIEkndmUgZ290IGl0IGlu
IG15IGxvY2FsIHRyZWUgaGF2aW5nIGNsb25lZCBhcm02NC9mb3ItbmV4dC1jb3JlOgo+Cj4gMTg6
MzIgJCBlZ3JlcCAtQSAxMCBQUl9TRVRfVEFHIC4vaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmgK
PiAjZGVmaW5lIFBSX1NFVF9UQUdHRURfQUREUl9DVFJMICAgICAgICAgNTUKPiAjZGVmaW5lIFBS
X0dFVF9UQUdHRURfQUREUl9DVFJMICAgICAgICAgNTYKPiAjIGRlZmluZSBQUl9UQUdHRURfQURE
Ul9FTkFCTEUgICAgICAgICAgKDFVTCA8PCAwKQo+Cj4gI2VuZGlmIC8qIF9MSU5VWF9QUkNUTF9I
ICovCj4KPiBhbmQgS2VybmVsIGhlYWRlciBhcmUgbG9jYWxseSBpbnN0YWxsZWQgaW4gbXkga2Vy
bmVsIHNyYyBkaXIgKGJ5IEtTRlQgaW5kZWVkKQo+Cj4gMTg6MzQgJCBlZ3JlcCAtUkEgMTAgUFJf
U0VUX1RBRyB1c3IvaW5jbHVkZS8KPiB1c3IvaW5jbHVkZS9saW51eC9wcmN0bC5oOiNkZWZpbmUg
UFJfU0VUX1RBR0dFRF9BRERSX0NUUkwgICAgICAgICAgICAgICA1NQo+IHVzci9pbmNsdWRlL2xp
bnV4L3ByY3RsLmgtI2RlZmluZSBQUl9HRVRfVEFHR0VEX0FERFJfQ1RSTCAgICAgICAgICAgICAg
IDU2Cj4gdXNyL2luY2x1ZGUvbGludXgvcHJjdGwuaC0jIGRlZmluZSBQUl9UQUdHRURfQUREUl9F
TkFCTEUgICAgICAgICAgICAgICAgKDFVTCA8PCAwKQo+IHVzci9pbmNsdWRlL2xpbnV4L3ByY3Rs
LmgtCj4gdXNyL2luY2x1ZGUvbGludXgvcHJjdGwuaC0jZW5kaWYgLyogX0xJTlVYX1BSQ1RMX0gg
Ki8KPgo+IGJ1dCBob3cgYXJlIHRoZXkgc3VwcG9zZWQgdG8gYmUgZm91bmQgaWYgbm9yIHRoZSB0
ZXN0IE1ha2VmaWxlCj4gbmVpdGhlciB0aGUgS1NGVCBNYWtlZmlsZSB3aG8gaW5zdGFsbHMgdGhl
bSBwYXNzIGFueSAtSSBvcHRpb25zIHRvIHRoZQo+IGNvbXBpbGVyID8KPiBJIHN1cHBvc2UgPHN5
cy9wcmN0bC5oPiB0cmllcyB0byBpbmNsdWRlIGFyY2ggc3BlY2lmaWMgaGVhZGVycyBmcm9tIHRo
ZSByZWd1bGFyIHN5c3RlbSBwYXRoLAo+IGJ1dCB3aGVuIHlvdSBhcmUgY3Jvc3MtY29tcGlsaW5n
ID8KPgo+IDE4OjM0ICQgbWFrZSBUQVJHRVRTPWFybTY0IGtzZWxmdGVzdAo+IG1ha2VbMV06IEVu
dGVyaW5nIGRpcmVjdG9yeSAnL2hvbWUvY3JpbWFyMDEvQVJNL2Rldi9zcmMvcGRzdy9vdXRfbGlu
dXgnCj4gYXJjaC9hcm02NC9NYWtlZmlsZTo1NjogQ1JPU1NfQ09NUElMRV9DT01QQVQgbm90IGRl
ZmluZWQgb3IgZW1wdHksIHRoZSBjb21wYXQgdkRTTyB3aWxsIG5vdCBiZSBidWlsdAo+IG1ha2Ug
LS1uby1idWlsdGluLXJ1bGVzIElOU1RBTExfSERSX1BBVEg9JEJVSUxEL3VzciBcCj4gICAgICAg
ICBBUkNIPWFybTY0IC1DIC4uLy4uLy4uIGhlYWRlcnNfaW5zdGFsbAo+ICAgSU5TVEFMTCAvaG9t
ZS9jcmltYXIwMS9BUk0vZGV2L3NyYy9wZHN3L291dF9saW51eC9rc2VsZnRlc3QvdXNyL2luY2x1
ZGUKPiAvb3B0L3Rvb2xjaGFpbnMvZ2NjLWFybS04LjMtMjAxOS4wMy14ODZfNjQtYWFyY2g2NC1s
aW51eC1nbnUvYmluL2FhcmNoNjQtbGludXgtZ251LWdjYyAtV2FsbCAtTzIgLWcgICAgdGFnc190
ZXN0LmMgIC1vIC9ob21lL2NyaW1hcjAxL0FSTS9kZXYvc3JjL3Bkc3cvb3V0X2xpbnV4L2tzZWxm
dGVzdC9hcm02NC90YWdzL3RhZ3NfdGVzdAo+IHRhZ3NfdGVzdC5jOiBJbiBmdW5jdGlvbiDigJht
YWlu4oCZOgo+IHRhZ3NfdGVzdC5jOjIwOjEyOiBlcnJvcjog4oCYUFJfU0VUX1RBR0dFRF9BRERS
X0NUUkzigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91
IG1lYW4g4oCYUFJfR0VUX1RJRF9BRERSRVNT4oCZPwo+ICAgaWYgKHByY3RsKFBSX1NFVF9UQUdH
RURfQUREUl9DVFJMLCBQUl9UQUdHRURfQUREUl9FTkFCTEUsIDAsIDAsIDApID09IDApCj4gICAg
ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICAgICAgICBQUl9HRVRfVElE
X0FERFJFU1MKPiB0YWdzX3Rlc3QuYzoyMDoxMjogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50
aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMg
aW4KPiB0YWdzX3Rlc3QuYzoyMDozNzogZXJyb3I6IOKAmFBSX1RBR0dFRF9BRERSX0VOQUJMReKA
mSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDi
gJhQUl9HRVRfRFVNUEFCTEXigJk/Cj4gICBpZiAocHJjdGwoUFJfU0VUX1RBR0dFRF9BRERSX0NU
UkwsIFBSX1RBR0dFRF9BRERSX0VOQUJMRSwgMCwgMCwgMCkgPT0gMCkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBSX0dFVF9EVU1QQUJMRQo+IC4uLy4uL2xpYi5t
azoxMzg6IHJlY2lwZSBmb3IgdGFyZ2V0ICcvaG9tZS9jcmltYXIwMS9BUk0vZGV2L3NyYy9wZHN3
L291dF9saW51eC9rc2VsZnRlc3QvYXJtNjQvdGFncy90YWdzX3Rlc3QnIGZhaWxlZAo+IG1ha2Vb
NF06ICoqKiBbL2hvbWUvY3JpbWFyMDEvQVJNL2Rldi9zcmMvcGRzdy9vdXRfbGludXgva3NlbGZ0
ZXN0L2FybTY0L3RhZ3MvdGFnc190ZXN0XSBFcnJvciAxCj4gTWFrZWZpbGU6MTk6IHJlY2lwZSBm
b3IgdGFyZ2V0ICdhbGwnIGZhaWxlZAo+IG1ha2VbM106ICoqKiBbYWxsXSBFcnJvciAyCj4gTWFr
ZWZpbGU6MTM3OiByZWNpcGUgZm9yIHRhcmdldCAnYWxsJyBmYWlsZWQKPiBtYWtlWzJdOiAqKiog
W2FsbF0gRXJyb3IgMgo+IC9ob21lL2NyaW1hcjAxL0FSTS9kZXYvc3JjL3Bkc3cvbGludXgvTWFr
ZWZpbGU6MTIzNjogcmVjaXBlIGZvciB0YXJnZXQgJ2tzZWxmdGVzdCcgZmFpbGVkCj4gbWFrZVsx
XTogKioqIFtrc2VsZnRlc3RdIEVycm9yIDIKPiBtYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAn
L2hvbWUvY3JpbWFyMDEvQVJNL2Rldi9zcmMvcGRzdy9vdXRfbGludXgnCj4gTWFrZWZpbGU6MTc5
OiByZWNpcGUgZm9yIHRhcmdldCAnc3ViLW1ha2UnIGZhaWxlZAo+IG1ha2U6ICoqKiBbc3ViLW1h
a2VdIEVycm9yIDIKPgo+Cj4gSW4gZmFjdCBtYW55IEtTRlQgdGVzdGNhc2VzIHNlZW1zIHRvIGJy
dXRhbGx5IGFkZCBkZWZhdWx0IGhlYWRlcnMgcGF0aDoKPgo+IHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL21lbWZkL01ha2VmaWxlOkNGTEFHUyArPSAtSS4uLy4uLy4uLy4uL2luY2x1ZGUvdWFwaS8K
PiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tZW1mZC9NYWtlZmlsZTpDRkxBR1MgKz0gLUkuLi8u
Li8uLi8uLi9pbmNsdWRlLwo+IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21lbWZkL01ha2VmaWxl
OkNGTEFHUyArPSAtSS4uLy4uLy4uLy4uL3Vzci9pbmNsdWRlLwo+IHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL25ldC9NYWtlZmlsZTpDRkxBR1MgKz0gLUkuLi8uLi8uLi8uLi91c3IvaW5jbHVkZS8K
PiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tZW1iYXJyaWVyL01ha2VmaWxlOkNGTEFHUyArPSAt
ZyAtSS4uLy4uLy4uLy4uL3Vzci9pbmNsdWRlLwo+IC4uLgoKSGkgQ3Jpc3RpYW4hCgpJbmRlZWQs
IEkgY2FuIHJlcHJvZHVjZSB0aGUgaXNzdWUuIEkgZG9uJ3Qga25vdyB3aGF0J3MgdGhlIHByb3Bl
ciB3YXkKdG8gcmVzb2x2ZSB0aGlzLiBBZGRpbmcgIkNGTEFHUyArPSAtSS4uLy4uLy4uLy4uL3Vz
ci9pbmNsdWRlLyIgbG9va3MKZ29vZCB0byBtZS4gQUZBSUNTIHlvdXIgc2VyaWVzIHJlc29sdmVz
IHRoaXMgaXNzdWUgaW4gYSBzaW1pbGFyIHdheSwKYnV0IEkgdGhpbmsgd2Ugc2hvdWxkIGZpeCB0
aGlzIGJlZm9yZSB0aGUgY3VycmVudCByYyBpcyByZWxlYXNlZC4gRG8KeW91IHdhbnQgdG8gc3Vi
bWl0IGEgcGF0Y2ggdGhhdCBhZGRzIHRoaXMgc2ltcGxlIGZpeCBvciBzaG91bGQgSSBkbwp0aGF0
PwoKVGhhbmtzIQoKPgo+IENoZWVycwo+Cj4gQ3Jpc3RpYW4KPiA+Cj4gPgo+ID4KPiA+Pgo+ID4+
IFRoYW5rcwo+ID4+Cj4gPj4gQ3Jpc3RpYW4KPiA+Pgo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvLmdpdGlnbm9yZSBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2FybTY0Ly5naXRpZ25vcmUKPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+
Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5lOGZhZThkNjFlZDYKPiA+Pj4gLS0tIC9kZXYvbnVsbAo+
ID4+PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC8uZ2l0aWdub3JlCj4gPj4+
IEBAIC0wLDAgKzEgQEAKPiA+Pj4gK3RhZ3NfdGVzdAo+ID4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9hcm02NC9NYWtlZmlsZQo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+PiBpbmRleCAw
MDAwMDAwMDAwMDAuLmE2MWIyZTc0M2U5OQo+ID4+PiAtLS0gL2Rldi9udWxsCj4gPj4+ICsrKyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01ha2VmaWxlCj4gPj4+IEBAIC0wLDAgKzEs
MTEgQEAKPiA+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+Pj4gKwo+
ID4+PiArIyBBUkNIIGNhbiBiZSBvdmVycmlkZGVuIGJ5IHRoZSB1c2VyIGZvciBjcm9zcyBjb21w
aWxpbmcKPiA+Pj4gK0FSQ0ggPz0gJChzaGVsbCB1bmFtZSAtbSAyPi9kZXYvbnVsbCB8fCBlY2hv
IG5vdCkKPiA+Pj4gKwo+ID4+PiAraWZuZXEgKCwkKGZpbHRlciAkKEFSQ0gpLGFhcmNoNjQgYXJt
NjQpKQo+ID4+PiArVEVTVF9HRU5fUFJPR1MgOj0gdGFnc190ZXN0Cj4gPj4+ICtURVNUX1BST0dT
IDo9IHJ1bl90YWdzX3Rlc3Quc2gKPiA+Pj4gK2VuZGlmCj4gPj4+ICsKPiA+Pj4gK2luY2x1ZGUg
Li4vbGliLm1rCj4gPj4+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02
NC9ydW5fdGFnc190ZXN0LnNoIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvcnVuX3Rh
Z3NfdGVzdC5zaAo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDc1NQo+ID4+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLjc0NWYxMTM3OTkzMAo+ID4+PiAtLS0gL2Rldi9udWxsCj4gPj4+ICsrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3J1bl90YWdzX3Rlc3Quc2gKPiA+Pj4gQEAgLTAsMCAr
MSwxMiBAQAo+ID4+PiArIyEvYmluL3NoCj4gPj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wCj4gPj4+ICsKPiA+Pj4gK2VjaG8gIi0tLS0tLS0tLS0tLS0tLS0tLS0tIgo+ID4+
PiArZWNobyAicnVubmluZyB0YWdzIHRlc3QiCj4gPj4+ICtlY2hvICItLS0tLS0tLS0tLS0tLS0t
LS0tLSIKPiA+Pj4gKy4vdGFnc190ZXN0Cj4gPj4+ICtpZiBbICQ/IC1uZSAwIF07IHRoZW4KPiA+
Pj4gKyAgICAgZWNobyAiW0ZBSUxdIgo+ID4+PiArZWxzZQo+ID4+PiArICAgICBlY2hvICJbUEFT
U10iCj4gPj4+ICtmaQo+ID4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
YXJtNjQvdGFnc190ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC90YWdzX3Rl
c3QuYwo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+PiBpbmRleCAwMDAwMDAwMDAwMDAu
LjIyYTFiMjY2ZTM3Mwo+ID4+PiAtLS0gL2Rldi9udWxsCj4gPj4+ICsrKyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jCj4gPj4+IEBAIC0wLDAgKzEsMjkgQEAKPiA+
Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPj4+ICsKPiA+Pj4gKyNp
bmNsdWRlIDxzdGRpby5oPgo+ID4+PiArI2luY2x1ZGUgPHN0ZGxpYi5oPgo+ID4+PiArI2luY2x1
ZGUgPHVuaXN0ZC5oPgo+ID4+PiArI2luY2x1ZGUgPHN0ZGludC5oPgo+ID4+PiArI2luY2x1ZGUg
PHN5cy9wcmN0bC5oPgo+ID4+PiArI2luY2x1ZGUgPHN5cy91dHNuYW1lLmg+Cj4gPj4+ICsKPiA+
Pj4gKyNkZWZpbmUgU0hJRlRfVEFHKHRhZykgICAgICAgICAgICAgICAoKHVpbnQ2NF90KSh0YWcp
IDw8IDU2KQo+ID4+PiArI2RlZmluZSBTRVRfVEFHKHB0ciwgdGFnKSAgICAoKCh1aW50NjRfdCko
cHRyKSAmIH5TSElGVF9UQUcoMHhmZikpIHwgXAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNISUZUX1RBRyh0YWcpKQo+ID4+PiArCj4gPj4+ICtpbnQgbWFpbih2
b2lkKQo+ID4+PiArewo+ID4+PiArICAgICBzdGF0aWMgaW50IHRiaV9lbmFibGVkID0gMDsKPiA+
Pj4gKyAgICAgc3RydWN0IHV0c25hbWUgKnB0ciwgKnRhZ2dlZF9wdHI7Cj4gPj4+ICsgICAgIGlu
dCBlcnI7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgaWYgKHByY3RsKFBSX1NFVF9UQUdHRURfQUREUl9D
VFJMLCBQUl9UQUdHRURfQUREUl9FTkFCTEUsIDAsIDAsIDApID09IDApCj4gPj4+ICsgICAgICAg
ICAgICAgdGJpX2VuYWJsZWQgPSAxOwo+ID4+PiArICAgICBwdHIgPSAoc3RydWN0IHV0c25hbWUg
KiltYWxsb2Moc2l6ZW9mKCpwdHIpKTsKPiA+Pj4gKyAgICAgaWYgKHRiaV9lbmFibGVkKQo+ID4+
PiArICAgICAgICAgICAgIHRhZ2dlZF9wdHIgPSAoc3RydWN0IHV0c25hbWUgKilTRVRfVEFHKHB0
ciwgMHg0Mik7Cj4gPj4+ICsgICAgIGVyciA9IHVuYW1lKHRhZ2dlZF9wdHIpOwo+ID4+PiArICAg
ICBmcmVlKHB0cik7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgcmV0dXJuIGVycjsKPiA+Pj4gK30KPiA+
Pj4KPiA+Pgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

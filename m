Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C19933E47
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 07:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D0289449;
	Tue,  4 Jun 2019 05:23:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB308891CD
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 16:55:23 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id w184so974519qka.15
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 09:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=pKIf+Y3MnkJOtManFjdKEFOWzrBTOFE1UHaO8DhhXss=;
 b=FT/Q92EVkfodKKy2PnytVzJ3rFLG47nk9aUpv7LQV2Ugpf0DOYgHI4cdM1OiES1qsH
 bawByQFqB9lsJnWKtGOzypH/ZVpDuHVHNqER9SO1AAybcUs5SvskQRU5VvsDsQPMqvQa
 LZe/EvnQh6uoei7e2y9rLvloV9xUXJOtZYvF3Cnr4L3SEjJRbhOQaL8AJuET67xHwFBO
 fhJSuV/xCa75R5F3CqN3UhwXDRrawpoQ/rgHM2FMcNCK6/wHeoTqGosXny5hvah3xGDs
 C+wV5mj4rKIZB+MdIYUNttvCKrncqa1IvqVuwZ59ZoUZvTF0jHIbiHHEjW0ES6U4NSvJ
 cDbg==
X-Gm-Message-State: APjAAAWU0RPgt6DhrGvg1t23yzOmOBmwu0QkWghgU5Oss9N4egYWlTHl
 aozZdvSXf0G8eRcbxVg6Z7FVBUjsOYi2owl6
X-Google-Smtp-Source: APXvYqz4SZN6zijMTZNY+eLQHaOtV1WlxCj6SO7thqPz4qyEmIH9u9us+MZRWsJr8QXcKzQvKgJygevWxhmvqK90
X-Received: by 2002:ae9:ed48:: with SMTP id c69mr22519666qkg.114.1559580922887; 
 Mon, 03 Jun 2019 09:55:22 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:02 +0200
Message-Id: <cover.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 00/16] arm64: untag user pointers passed to the kernel
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 04 Jun 2019 05:23:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=pKIf+Y3MnkJOtManFjdKEFOWzrBTOFE1UHaO8DhhXss=;
 b=DdE847rzcaxodo/umHn897LrE0g6Q4teHIl0C455EKvIF/tPzzgeRCi3l9akUx9BKu
 L0IKgV49Wwixj+wL2nQfvtJlHpW7FecwawgbjinT3xpAna06S2UfW3pSY96P0tNQCc/U
 rRCVbn30vUzkVFan0ecw5ONik75XULFfnBBxYNTiiVZPo7BXBxdyEmF180eQRHnBECTV
 dA0pDMIEiHT2JiK1CV/Ng42sY1eN+xbbtVDa4JVnGGMazpA+O8Q7SwfS4SVmVC8xQxwf
 4ZEVH9Ifqyy4PEDEe+1t1MJ8Vp8MxmLUyNRVeivgluti2EOZeMzdTQ+NoTY0sDGg+rtp
 89vA==
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

PT09IE92ZXJ2aWV3Cgphcm02NCBoYXMgYSBmZWF0dXJlIGNhbGxlZCBUb3AgQnl0ZSBJZ25vcmUs
IHdoaWNoIGFsbG93cyB0byBlbWJlZCBwb2ludGVyCnRhZ3MgaW50byB0aGUgdG9wIGJ5dGUgb2Yg
ZWFjaCBwb2ludGVyLiBVc2Vyc3BhY2UgcHJvZ3JhbXMgKHN1Y2ggYXMKSFdBU2FuLCBhIG1lbW9y
eSBkZWJ1Z2dpbmcgdG9vbCBbMV0pIG1pZ2h0IHVzZSB0aGlzIGZlYXR1cmUgYW5kIHBhc3MKdGFn
Z2VkIHVzZXIgcG9pbnRlcnMgdG8gdGhlIGtlcm5lbCB0aHJvdWdoIHN5c2NhbGxzIG9yIG90aGVy
IGludGVyZmFjZXMuCgpSaWdodCBub3cgdGhlIGtlcm5lbCBpcyBhbHJlYWR5IGFibGUgdG8gaGFu
ZGxlIHVzZXIgZmF1bHRzIHdpdGggdGFnZ2VkCnBvaW50ZXJzLCBkdWUgdG8gdGhlc2UgcGF0Y2hl
czoKCjEuIDgxY2RkZDY1ICgiYXJtNjQ6IHRyYXBzOiBmaXggdXNlcnNwYWNlIGNhY2hlIG1haW50
ZW5hbmNlIGVtdWxhdGlvbiBvbiBhCiAgICAgICAgICAgICB0YWdnZWQgcG9pbnRlciIpCjIuIDdk
Y2Q5ZGQ4ICgiYXJtNjQ6IGh3X2JyZWFrcG9pbnQ6IGZpeCB3YXRjaHBvaW50IG1hdGNoaW5nIGZv
ciB0YWdnZWQKCSAgICAgIHBvaW50ZXJzIikKMy4gMjc2ZTkzMjcgKCJhcm02NDogZW50cnk6IGlt
cHJvdmUgZGF0YSBhYm9ydCBoYW5kbGluZyBvZiB0YWdnZWQKCSAgICAgIHBvaW50ZXJzIikKClRo
aXMgcGF0Y2hzZXQgZXh0ZW5kcyB0YWdnZWQgcG9pbnRlciBzdXBwb3J0IHRvIHN5c2NhbGwgYXJn
dW1lbnRzLgoKQXMgcGVyIHRoZSBwcm9wb3NlZCBBQkkgY2hhbmdlIFszXSwgdGFnZ2VkIHBvaW50
ZXJzIGFyZSBvbmx5IGFsbG93ZWQgdG8gYmUKcGFzc2VkIHRvIHN5c2NhbGxzIHdoZW4gdGhleSBw
b2ludCB0byBtZW1vcnkgcmFuZ2VzIG9idGFpbmVkIGJ5IGFub255bW91cwptbWFwKCkgb3Igc2Jy
aygpIChzZWUgdGhlIHBhdGNoc2V0IFszXSBmb3IgbW9yZSBkZXRhaWxzKS4KCkZvciBub24tbWVt
b3J5IHN5c2NhbGxzIHRoaXMgaXMgZG9uZSBieSB1bnRhZ2luZyB1c2VyIHBvaW50ZXJzIHdoZW4g
dGhlCmtlcm5lbCBwZXJmb3JtcyBwb2ludGVyIGNoZWNraW5nIHRvIGZpbmQgb3V0IHdoZXRoZXIg
dGhlIHBvaW50ZXIgY29tZXMKZnJvbSB1c2Vyc3BhY2UgKG1vc3Qgbm90YWJseSBpbiBhY2Nlc3Nf
b2spLiBUaGUgdW50YWdnaW5nIGlzIGRvbmUgb25seQp3aGVuIHRoZSBwb2ludGVyIGlzIGJlaW5n
IGNoZWNrZWQsIHRoZSB0YWcgaXMgcHJlc2VydmVkIGFzIHRoZSBwb2ludGVyCm1ha2VzIGl0cyB3
YXkgdGhyb3VnaCB0aGUga2VybmVsIGFuZCBzdGF5cyB0YWdnZWQgd2hlbiB0aGUga2VybmVsCmRl
cmVmZXJlbmNlcyB0aGUgcG9pbnRlciB3aGVuIHBlcmZvbWluZyB1c2VyIG1lbW9yeSBhY2Nlc3Nl
cy4KCk1lbW9yeSBzeXNjYWxscyAobXByb3RlY3QsIGV0Yy4pIGRvbid0IGRvIHVzZXIgbWVtb3J5
IGFjY2Vzc2VzIGJ1dCByYXRoZXIKZGVhbCB3aXRoIG1lbW9yeSByYW5nZXMsIGFuZCB1bnRhZ2dl
ZCBwb2ludGVycyBhcmUgYmV0dGVyIHN1aXRlZCB0bwpkZXNjcmliZSBtZW1vcnkgcmFuZ2VzIGlu
dGVybmFsbHkuIFRodXMgZm9yIG1lbW9yeSBzeXNjYWxscyB3ZSB1bnRhZwpwb2ludGVycyBjb21w
bGV0ZWx5IHdoZW4gdGhleSBlbnRlciB0aGUga2VybmVsLgoKPT09IE90aGVyIGFwcHJvYWNoZXMK
Ck9uZSBvZiB0aGUgYWx0ZXJuYXRpdmUgYXBwcm9hY2hlcyB0byB1bnRhZ2dpbmcgdGhhdCB3YXMg
Y29uc2lkZXJlZCBpcyB0bwpjb21wbGV0ZWx5IHN0cmlwIHRoZSBwb2ludGVyIHRhZyBhcyB0aGUg
cG9pbnRlciBlbnRlcnMgdGhlIGtlcm5lbCB3aXRoCnNvbWUga2luZCBvZiBhIHN5c2NhbGwgd3Jh
cHBlciwgYnV0IHRoYXQgd29uJ3Qgd29yayB3aXRoIHRoZSBjb3VudGxlc3MKbnVtYmVyIG9mIGRp
ZmZlcmVudCBpb2N0bCBjYWxscy4gV2l0aCB0aGlzIGFwcHJvYWNoIHdlIHdvdWxkIG5lZWQgYSBj
dXN0b20Kd3JhcHBlciBmb3IgZWFjaCBpb2N0bCB2YXJpYXRpb24sIHdoaWNoIGRvZXNuJ3Qgc2Vl
bSBwcmFjdGljYWwuCgpBbiBhbHRlcm5hdGl2ZSBhcHByb2FjaCB0byB1bnRhZ2dpbmcgcG9pbnRl
cnMgaW4gbWVtb3J5IHN5c2NhbGxzIHByb2xvZ3VlcwppcyB0byBpbnNwZWFkIGFsbG93IHRhZ2dl
ZCBwb2ludGVycyB0byBiZSBwYXNzZWQgdG8gZmluZF92bWEoKSAoYW5kIG90aGVyCnZtYSByZWxh
dGVkIGZ1bmN0aW9ucykgYW5kIHVudGFnIHRoZW0gdGhlcmUuIFVuZm9ydHVuYXRlbHksIGEgbG90
IG9mCmZpbmRfdm1hKCkgY2FsbGVycyB0aGVuIGNvbXBhcmUgb3Igc3VidHJhY3QgdGhlIHJldHVy
bmVkIHZtYSBzdGFydCBhbmQgZW5kCmZpZWxkcyBhZ2FpbnN0IHRoZSBwb2ludGVyIHRoYXQgd2Fz
IGJlaW5nIHNlYXJjaGVkLiBUaHVzIHRoaXMgYXBwcm9hY2gKd291bGQgc3RpbGwgcmVxdWlyZSBj
aGFuZ2luZyBhbGwgZmluZF92bWEoKSBjYWxsZXJzLgoKPT09IFRlc3RpbmcKClRoZSBmb2xsb3dp
bmcgdGVzdGluZyBhcHByb2FjaGVzIGhhcyBiZWVuIHRha2VuIHRvIGZpbmQgcG90ZW50aWFsIGlz
c3Vlcwp3aXRoIHVzZXIgcG9pbnRlciB1bnRhZ2dpbmc6CgoxLiBTdGF0aWMgdGVzdGluZyAod2l0
aCBzcGFyc2UgWzJdIGFuZCBzZXBhcmF0ZWx5IHdpdGggYSBjdXN0b20gc3RhdGljCiAgIGFuYWx5
emVyIGJhc2VkIG9uIENsYW5nKSB0byB0cmFjayBjYXN0cyBvZiBfX3VzZXIgcG9pbnRlcnMgdG8g
aW50ZWdlcgogICB0eXBlcyB0byBmaW5kIHBsYWNlcyB3aGVyZSB1bnRhZ2dpbmcgbmVlZHMgdG8g
YmUgZG9uZS4KCjIuIFN0YXRpYyB0ZXN0aW5nIHdpdGggZ3JlcCB0byBmaW5kIHBhcnRzIG9mIHRo
ZSBrZXJuZWwgdGhhdCBjYWxsCiAgIGZpbmRfdm1hKCkgKGFuZCBvdGhlciBzaW1pbGFyIGZ1bmN0
aW9ucykgb3IgZGlyZWN0bHkgY29tcGFyZSBhZ2FpbnN0CiAgIHZtX3N0YXJ0L3ZtX2VuZCBmaWVs
ZHMgb2Ygdm1hLgoKMy4gU3RhdGljIHRlc3Rpbmcgd2l0aCBncmVwIHRvIGZpbmQgcGFydHMgb2Yg
dGhlIGtlcm5lbCB0aGF0IGNvbXBhcmUKICAgdXNlciBwb2ludGVycyB3aXRoIFRBU0tfU0laRSBv
ciBvdGhlciBzaW1pbGFyIGNvbnN0cyBhbmQgbWFjcm9zLgoKNC4gRHluYW1pYyB0ZXN0aW5nOiBh
ZGRpbmcgQlVHX09OKGhhc190YWcoYWRkcikpIHRvIGZpbmRfdm1hKCkgYW5kIHJ1bm5pbmcKICAg
YSBtb2RpZmllZCBzeXprYWxsZXIgdmVyc2lvbiB0aGF0IHBhc3NlcyB0YWdnZWQgcG9pbnRlcnMg
dG8gdGhlIGtlcm5lbC4KCkJhc2VkIG9uIHRoZSByZXN1bHRzIG9mIHRoZSB0ZXN0aW5nIHRoZSBy
ZXF1cmllZCBwYXRjaGVzIGhhdmUgYmVlbiBhZGRlZAp0byB0aGUgcGF0Y2hzZXQuCgo9PT0gTm90
ZXMKClRoaXMgcGF0Y2hzZXQgaXMgbWVhbnQgdG8gYmUgbWVyZ2VkIHRvZ2V0aGVyIHdpdGggImFy
bTY0IHJlbGF4ZWQgQUJJIiBbM10uCgpUaGlzIHBhdGNoc2V0IGlzIGEgcHJlcmVxdWlzaXRlIGZv
ciBBUk0ncyBtZW1vcnkgdGFnZ2luZyBoYXJkd2FyZSBmZWF0dXJlCnN1cHBvcnQgWzRdLgoKVGhp
cyBwYXRjaHNldCBoYXMgYmVlbiBtZXJnZWQgaW50byB0aGUgUGl4ZWwgMiAmIDMga2VybmVsIHRy
ZWVzIGFuZCBpcwpub3cgYmVpbmcgdXNlZCB0byBlbmFibGUgdGVzdGluZyBvZiBQaXhlbCBwaG9u
ZXMgd2l0aCBIV0FTYW4uCgpUaGFua3MhCgpbMV0gaHR0cDovL2NsYW5nLmxsdm0ub3JnL2RvY3Mv
SGFyZHdhcmVBc3Npc3RlZEFkZHJlc3NTYW5pdGl6ZXJEZXNpZ24uaHRtbAoKWzJdIGh0dHBzOi8v
Z2l0aHViLmNvbS9sdWN2b28vc3BhcnNlLWRldi9jb21taXQvNWY5NjBjYjEwZjU2ZWMyMDE3YzEy
OGVmOWQxNjA2MGUwMTQ1ZjI5MgoKWzNdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzMvMTgv
ODE5CgpbNF0gaHR0cHM6Ly9jb21tdW5pdHkuYXJtLmNvbS9wcm9jZXNzb3JzL2IvYmxvZy9wb3N0
cy9hcm0tYS1wcm9maWxlLWFyY2hpdGVjdHVyZS0yMDE4LWRldmVsb3BtZW50cy1hcm12ODVhCgpD
aGFuZ2VzIGluIHYxNjoKLSBNb3ZlZCB1bnRhZ2dpbmcgZm9yIG1lbW9yeSBzeXNjYWxscyBmcm9t
IGFybTY0IHdyYXBwZXJzIGJhY2sgdG8gZ2VuZXJpYwogIGNvZGUuCi0gRHJvcHBlZCB1bnRhZ2dp
bmcgZm9yIHRoZSBmb2xsb3dpbmcgbWVtb3J5IHN5c2NhbGxzOiBicmssIG1tYXAsIG11bm1hcDsK
ICBtcmVtYXAgKG9ubHkgZHJvcHBlZCBmb3IgbmV3X2FkZHJlc3MpOyBtbWFwX3Bnb2ZmIChub3Qg
dXNlZCBvbiBhcm02NCk7CiAgcmVtYXBfZmlsZV9wYWdlcyAoZGVwcmVjYXRlZCk7IHNobWF0LCBz
aG1kdCAod29yayBvbiBzaGFyZWQgbWVtb3J5KS4KLSBDaGFuZ2VkIGtzZWxmdGVzdCB0byBMRF9Q
UkVMT0FEIGEgc2hhcmVkIGxpYnJhcnkgdGhhdCBvdmVycmlkZXMgbWFsbG9jCiAgdG8gcmV0dXJu
IHRhZ2dlZCBwb2ludGVycy4KLSBSZWJhc2VkIG9udG8gNS4yLXJjMy4KCkNoYW5nZXMgaW4gdjE1
OgotIFJlbW92ZWQgdW5uZWNlc3NhcnkgdW50YWdnaW5nIGZyb20gcmFkZW9uX3R0bV90dF9zZXRf
dXNlcnB0cigpLgotIFJlbW92ZWQgdW5uZWNlc3NhcnkgdW50YWdnaW5nIGZyb20gYW1kZ3B1X3R0
bV90dF9zZXRfdXNlcnB0cigpLgotIE1vdmVkIHVudGFnZ2luZyB0byB2YWxpZGF0ZV9yYW5nZSgp
IGluIHVzZXJmYXVsdGZkIGNvZGUuCi0gTW92ZWQgdW50YWdnaW5nIHRvIGliX3V2ZXJic18ocmUp
cmVnX21yKCkgZnJvbSBtbHg0X2dldF91bWVtX21yKCkuCi0gUmViYXNlZCBvbnRvIDUuMS4KCkNo
YW5nZXMgaW4gdjE0OgotIE1vdmVkIHVudGFnZ2luZyBmb3IgbW9zdCBtZW1vcnkgc3lzY2FsbHMg
dG8gYW4gYXJtNjQgc3BlY2lmaWMKICBpbXBsZW1lbnRhdGlvbiwgaW5zdGVhZCBvZiBkb2luZyB0
aGF0IGluIHRoZSBjb21tb24gY29kZS4KLSBEcm9wcGVkICJuZXQsIGFybTY0OiB1bnRhZyB1c2Vy
IHBvaW50ZXJzIGluIHRjcF96ZXJvY29weV9yZWNlaXZlIiwgc2luY2UKICB0aGUgcHJvdmlkZWQg
dXNlciBwb2ludGVycyBkb24ndCBjb21lIGZyb20gYW4gYW5vbnltb3VzIG1hcCBhbmQgdGh1cyBh
cmUKICBub3QgY292ZXJlZCBieSB0aGlzIEFCSSByZWxheGF0aW9uLgotIERyb3BwZWQgImtlcm5l
bCwgYXJtNjQ6IHVudGFnIHVzZXIgcG9pbnRlcnMgaW4gcHJjdGxfc2V0X21tKiIuCi0gTW92ZWQg
dW50YWdnaW5nIGZyb20gX19jaGVja19tZW1fdHlwZSgpIHRvIHRlZV9zaG1fcmVnaXN0ZXIoKS4K
LSBVcGRhdGVkIHVudGFnZ2luZyBmb3IgdGhlIGFtZGdwdSBhbmQgcmFkZW9uIGRyaXZlcnMgdG8g
Y292ZXIgdGhlIE1NVQogIG5vdGlmaWVyLCBhcyBzdWdnZXN0ZWQgYnkgRmVsaXguCi0gU2luY2Ug
dGhpcyBBQkkgcmVsYXhhdGlvbiBkb2Vzbid0IGFjdHVhbGx5IGFsbG93IHRhZ2dlZCBpbnN0cnVj
dGlvbgogIHBvaW50ZXJzLCBkcm9wcGVkIHRoZSBmb2xsb3dpbmcgcGF0Y2hlczoKLSBEcm9wcGVk
ICJ0cmFjaW5nLCBhcm02NDogdW50YWcgdXNlciBwb2ludGVycyBpbiBzZXFfcHJpbnRfdXNlcl9p
cCIuCi0gRHJvcHBlZCAidXByb2JlcywgYXJtNjQ6IHVudGFnIHVzZXIgcG9pbnRlcnMgaW4gZmlu
ZF9hY3RpdmVfdXByb2JlIi4KLSBEcm9wcGVkICJicGYsIGFybTY0OiB1bnRhZyB1c2VyIHBvaW50
ZXJzIGluIHN0YWNrX21hcF9nZXRfYnVpbGRfaWRfb2Zmc2V0Ii4KLSBSZWJhc2VkIG9udG8gNS4x
LXJjNyAoMzc2MjRiNTgpLgoKQ2hhbmdlcyBpbiB2MTM6Ci0gU2ltcGxpZmllZCB1bnRhZ2dpbmcg
aW4gdGNwX3plcm9jb3B5X3JlY2VpdmUoKS4KLSBMb29rZWQgYXQgZmluZF92bWEoKSBjYWxsZXJz
IGluIGRyaXZlcnMvLCB3aGljaCBhbGxvd2VkIHRvIGlkZW50aWZ5IGEKICBmZXcgb3RoZXIgcGxh
Y2VzIHdoZXJlIHVudGFnZ2luZyBpcyBuZWVkZWQuCi0gQWRkZWQgcGF0Y2ggIm1tLCBhcm02NDog
dW50YWcgdXNlciBwb2ludGVycyBpbiBnZXRfdmFkZHJfZnJhbWVzIi4KLSBBZGRlZCBwYXRjaCAi
ZHJtL2FtZGdwdSwgYXJtNjQ6IHVudGFnIHVzZXIgcG9pbnRlcnMgaW4KICBhbWRncHVfdHRtX3R0
X2dldF91c2VyX3BhZ2VzIi4KLSBBZGRlZCBwYXRjaCAiZHJtL3JhZGVvbiwgYXJtNjQ6IHVudGFn
IHVzZXIgcG9pbnRlcnMgaW4KICByYWRlb25fdHRtX3R0X3Bpbl91c2VycHRyIi4KLSBBZGRlZCBw
YXRjaCAiSUIvbWx4NCwgYXJtNjQ6IHVudGFnIHVzZXIgcG9pbnRlcnMgaW4gbWx4NF9nZXRfdW1l
bV9tciIuCi0gQWRkZWQgcGF0Y2ggIm1lZGlhL3Y0bDItY29yZSwgYXJtNjQ6IHVudGFnIHVzZXIg
cG9pbnRlcnMgaW4KICB2aWRlb2J1Zl9kbWFfY29udGlnX3VzZXJfZ2V0Ii4KLSBBZGRlZCBwYXRj
aCAidGVlL29wdGVlLCBhcm02NDogdW50YWcgdXNlciBwb2ludGVycyBpbiBjaGVja19tZW1fdHlw
ZSIuCi0gQWRkZWQgcGF0Y2ggInZmaW8vdHlwZTEsIGFybTY0OiB1bnRhZyB1c2VyIHBvaW50ZXJz
Ii4KCkNoYW5nZXMgaW4gdjEyOgotIENoYW5nZWQgdW50YWdnaW5nIGluIHRjcF96ZXJvY29weV9y
ZWNlaXZlKCkgdG8gYWxzbyB1bnRhZyB6Yy0+YWRkcmVzcy4KLSBGaXhlZCB1bnRhZ2dpbmcgaW4g
cHJjdGxfc2V0X21tKiB0byBvbmx5IHVudGFnIHBvaW50ZXJzIGZvciB2bWEgbG9va3VwcwogIGFu
ZCB2YWxpZGl0eSBjaGVja3MsIGJ1dCBsZWF2ZSB0aGVtIGFzIGlzIGZvciBhY3R1YWwgdXNlciBz
cGFjZSBhY2Nlc3Nlcy4KLSBVcGRhdGVkIHRoZSBsaW5rIHRvIHRoZSB2MiBvZiB0aGUgImFybTY0
IHJlbGF4ZWQgQUJJIiBwYXRjaHNldCBbM10uCi0gRHJvcHBlZCB0aGUgZG9jdW1lbnRhdGlvbiBw
YXRjaCwgYXMgdGhlICJhcm02NCByZWxheGVkIEFCSSIgcGF0Y2hzZXQgWzNdCiAgaGFuZGxlcyB0
aGF0LgoKQ2hhbmdlcyBpbiB2MTE6Ci0gQWRkZWQgInVwcm9iZXMsIGFybTY0OiB1bnRhZyB1c2Vy
IHBvaW50ZXJzIGluIGZpbmRfYWN0aXZlX3Vwcm9iZSIgcGF0Y2guCi0gQWRkZWQgImJwZiwgYXJt
NjQ6IHVudGFnIHVzZXIgcG9pbnRlcnMgaW4gc3RhY2tfbWFwX2dldF9idWlsZF9pZF9vZmZzZXQi
CiAgcGF0Y2guCi0gRml4ZWQgInRyYWNpbmcsIGFybTY0OiB1bnRhZyB1c2VyIHBvaW50ZXJzIGlu
IHNlcV9wcmludF91c2VyX2lwIiB0bwogIGNvcnJlY3RseSBwZXJmb3JtIHN1YnRyYXRpb24gd2l0
aCBhIHRhZ2dlZCBhZGRyLgotIE1vdmVkIHVudGFnZ2VkX2FkZHIoKSBmcm9tIFNZU0NBTExfREVG
SU5FMyhtcHJvdGVjdCkgYW5kCiAgU1lTQ0FMTF9ERUZJTkU0KHBrZXlfbXByb3RlY3QpIHRvIGRv
X21wcm90ZWN0X3BrZXkoKS4KLSBNb3ZlZCB1bnRhZ2dlZF9hZGRyKCkgZGVmaW5pdGlvbiBmb3Ig
b3RoZXIgYXJjaGVzIGZyb20KICBpbmNsdWRlL2xpbnV4L21lbW9yeS5oIHRvIGluY2x1ZGUvbGlu
dXgvbW0uaC4KLSBDaGFuZ2VkIHVudGFnZ2luZyBpbiBzdHJuKl91c2VyKCkgdG8gcGVyZm9ybSB1
c2Vyc3BhY2UgYWNjZXNzZXMgdGhyb3VnaAogIHRhZ2dlZCBwb2ludGVycy4KLSBVcGRhdGVkIHRo
ZSBkb2N1bWVudGF0aW9uIHRvIG1lbnRpb24gdGhhdCBwYXNzaW5nIHRhZ2dlZCBwb2ludGVycyB0
bwogIG1lbW9yeSBzeXNjYWxscyBpcyBhbGxvd2VkLgotIFVwZGF0ZWQgdGhlIHRlc3QgdG8gdXNl
IG1hbGxvYydlZCBtZW1vcnkgaW5zdGVhZCBvZiBzdGFjayBtZW1vcnkuCgpDaGFuZ2VzIGluIHYx
MDoKLSBBZGRlZCAibW0sIGFybTY0OiB1bnRhZyB1c2VyIHBvaW50ZXJzIHBhc3NlZCB0byBtZW1v
cnkgc3lzY2FsbHMiIGJhY2suCi0gTmV3IHBhdGNoICJmcywgYXJtNjQ6IHVudGFnIHVzZXIgcG9p
bnRlcnMgaW4gZnMvdXNlcmZhdWx0ZmQuYyIuCi0gTmV3IHBhdGNoICJuZXQsIGFybTY0OiB1bnRh
ZyB1c2VyIHBvaW50ZXJzIGluIHRjcF96ZXJvY29weV9yZWNlaXZlIi4KLSBOZXcgcGF0Y2ggImtl
cm5lbCwgYXJtNjQ6IHVudGFnIHVzZXIgcG9pbnRlcnMgaW4gcHJjdGxfc2V0X21tKiIuCi0gTmV3
IHBhdGNoICJ0cmFjaW5nLCBhcm02NDogdW50YWcgdXNlciBwb2ludGVycyBpbiBzZXFfcHJpbnRf
dXNlcl9pcCIuCgpDaGFuZ2VzIGluIHY5OgotIFJlYmFzZWQgb250byA0LjIwLXJjNi4KLSBVc2Vk
IHU2NCBpbnN0ZWFkIG9mIF9fdTY0IGluIHR5cGUgY2FzdHMgaW4gdGhlIHVudGFnZ2VkX2FkZHIg
bWFjcm8gZm9yCiAgYXJtNjQuCi0gQWRkZWQgYnJhY2VzIGFyb3VuZCAoYWRkcikgaW4gdGhlIHVu
dGFnZ2VkX2FkZHIgbWFjcm8gZm9yIG90aGVyIGFyY2hlcy4KCkNoYW5nZXMgaW4gdjg6Ci0gUmVi
YXNlZCBvbnRvIDY1MTAyMjM4ICg0LjIwLXJjMSkuCi0gQWRkZWQgYSBub3RlIHRvIHRoZSBjb3Zl
ciBsZXR0ZXIgb24gd2h5IHN5c2NhbGwgd3JhcHBlcnMvc2hpbXMgdGhhdCB1bnRhZwogIHVzZXIg
cG9pbnRlcnMgd29uJ3Qgd29yay4KLSBBZGRlZCBhIG5vdGUgdG8gdGhlIGNvdmVyIGxldHRlciB0
aGF0IHRoaXMgcGF0Y2hzZXQgaGFzIGJlZW4gbWVyZ2VkIGludG8KICB0aGUgUGl4ZWwgMiBrZXJu
ZWwgdHJlZS4KLSBEb2N1bWVudGF0aW9uIGZpeGVzLCBpbiBwYXJ0aWN1bGFyIGFkZGVkIGEgbGlz
dCBvZiBzeXNjYWxscyB0aGF0IGRvbid0CiAgc3VwcG9ydCB0YWdnZWQgdXNlciBwb2ludGVycy4K
CkNoYW5nZXMgaW4gdjc6Ci0gUmViYXNlZCBvbnRvIDE3YjU3YjE4ICg0LjE5LXJjNikuCi0gRHJv
cHBlZCB0aGUgImFybTY0OiB1bnRhZyB1c2VyIGFkZHJlc3MgaW4gX19kb191c2VyX2ZhdWx0IiBw
YXRjaCwgc2luY2UKICB0aGUgZXhpc3RpbmcgcGF0Y2hlcyBhbHJlYWR5IGhhbmRsZSB1c2VyIGZh
dWx0cyBwcm9wZXJseS4KLSBEcm9wcGVkIHRoZSAidXNiLCBhcm02NDogdW50YWcgdXNlciBhZGRy
ZXNzZXMgaW4gZGV2aW8iIHBhdGNoLCBzaW5jZSB0aGUKICBwYXNzZWQgcG9pbnRlciBtdXN0IGNv
bWUgZnJvbSBhIHZtYSBhbmQgdGhlcmVmb3JlIGJlIHVudGFnZ2VkLgotIERyb3BwZWQgdGhlICJh
cm02NDogYW5ub3RhdGUgdXNlciBwb2ludGVycyBjYXN0cyBkZXRlY3RlZCBieSBzcGFyc2UiCiAg
cGF0Y2ggKHNlZSB0aGUgZGlzY3Vzc2lvbiB0byB0aGUgcmVwbGllcyBvZiB0aGUgdjYgb2YgdGhp
cyBwYXRjaHNldCkuCi0gQWRkZWQgbW9yZSBjb250ZXh0IHRvIHRoZSBjb3ZlciBsZXR0ZXIuCi0g
VXBkYXRlZCBEb2N1bWVudGF0aW9uL2FybTY0L3RhZ2dlZC1wb2ludGVycy50eHQuCgpDaGFuZ2Vz
IGluIHY2OgotIEFkZGVkIGFubm90YXRpb25zIGZvciB1c2VyIHBvaW50ZXIgY2FzdHMgZm91bmQg
Ynkgc3BhcnNlLgotIFJlYmFzZWQgb250byAwNTBjZGM2YyAoNC4xOS1yYzErKS4KCkNoYW5nZXMg
aW4gdjU6Ci0gQWRkZWQgMyBuZXcgcGF0Y2hlcyB0aGF0IGFkZCB1bnRhZ2dpbmcgdG8gcGxhY2Vz
IGZvdW5kIHdpdGggc3RhdGljCiAgYW5hbHlzaXMuCi0gUmViYXNlZCBvbnRvIDQ0YzkyOWUxICg0
LjE4LXJjOCkuCgpDaGFuZ2VzIGluIHY0OgotIEFkZGVkIGEgc2VsZnRlc3QgZm9yIGNoZWNraW5n
IHRoYXQgcGFzc2luZyB0YWdnZWQgcG9pbnRlcnMgdG8gdGhlCiAga2VybmVsIHN1Y2NlZWRzLgot
IFJlYmFzZWQgb250byA4MWU5N2YwMTMgKDQuMTgtcmMxKykuCgpDaGFuZ2VzIGluIHYzOgotIFJl
YmFzZWQgb250byBlNWM1MWYzMCAoNC4xNy1yYzYrKS4KLSBBZGRlZCBsaW51eC1hcmNoQCB0byB0
aGUgbGlzdCBvZiByZWNpcGllbnRzLgoKQ2hhbmdlcyBpbiB2MjoKLSBSZWJhc2VkIG9udG8gMmQ2
MThiZGYgKDQuMTctcmMzKykuCi0gUmVtb3ZlZCBleGNlc3NpdmUgdW50YWdnaW5nIGluIGd1cC5j
LgotIFJlbW92ZWQgdW50YWdnaW5nIHBvaW50ZXJzIHJldHVybmVkIGZyb20gX191YWNjZXNzX21h
c2tfcHRyLgoKQ2hhbmdlcyBpbiB2MToKLSBSZWJhc2VkIG9udG8gNC4xNy1yYzEuCgpDaGFuZ2Vz
IGluIFJGQyB2MjoKLSBBZGRlZCAiI2lmbmRlZiB1bnRhZ2dlZF9hZGRyLi4uIiBmYWxsYmFjayBp
biBsaW51eC91YWNjZXNzLmggaW5zdGVhZCBvZgogIGRlZmluaW5nIGl0IGZvciBlYWNoIGFyY2gg
aW5kaXZpZHVhbGx5LgotIFVwZGF0ZWQgRG9jdW1lbnRhdGlvbi9hcm02NC90YWdnZWQtcG9pbnRl
cnMudHh0LgotIERyb3BwZWQgIm1tLCBhcm02NDogdW50YWcgdXNlciBhZGRyZXNzZXMgaW4gbWVt
b3J5IHN5c2NhbGxzIi4KLSBSZWJhc2VkIG9udG8gM2ViMmNlODIgKDQuMTYtcmM3KS4KClNpZ25l
ZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KCkFuZHJl
eSBLb25vdmFsb3YgKDE2KToKICB1YWNjZXNzOiBhZGQgdW50YWdnZWRfYWRkciBkZWZpbml0aW9u
IGZvciBvdGhlciBhcmNoZXMKICBhcm02NDogdW50YWcgdXNlciBwb2ludGVycyBpbiBhY2Nlc3Nf
b2sgYW5kIF9fdWFjY2Vzc19tYXNrX3B0cgogIGxpYiwgYXJtNjQ6IHVudGFnIHVzZXIgcG9pbnRl
cnMgaW4gc3RybipfdXNlcgogIG1tOiB1bnRhZyB1c2VyIHBvaW50ZXJzIGluIGRvX3BhZ2VzX21v
dmUKICBhcm02NDogdW50YWcgdXNlciBwb2ludGVycyBwYXNzZWQgdG8gbWVtb3J5IHN5c2NhbGxz
CiAgbW0sIGFybTY0OiB1bnRhZyB1c2VyIHBvaW50ZXJzIGluIG1tL2d1cC5jCiAgbW0sIGFybTY0
OiB1bnRhZyB1c2VyIHBvaW50ZXJzIGluIGdldF92YWRkcl9mcmFtZXMKICBmcywgYXJtNjQ6IHVu
dGFnIHVzZXIgcG9pbnRlcnMgaW4gY29weV9tb3VudF9vcHRpb25zCiAgZnMsIGFybTY0OiB1bnRh
ZyB1c2VyIHBvaW50ZXJzIGluIGZzL3VzZXJmYXVsdGZkLmMKICBkcm0vYW1kZ3B1LCBhcm02NDog
dW50YWcgdXNlciBwb2ludGVycwogIGRybS9yYWRlb24sIGFybTY0OiB1bnRhZyB1c2VyIHBvaW50
ZXJzIGluIHJhZGVvbl9nZW1fdXNlcnB0cl9pb2N0bAogIElCLCBhcm02NDogdW50YWcgdXNlciBw
b2ludGVycyBpbiBpYl91dmVyYnNfKHJlKXJlZ19tcigpCiAgbWVkaWEvdjRsMi1jb3JlLCBhcm02
NDogdW50YWcgdXNlciBwb2ludGVycyBpbgogICAgdmlkZW9idWZfZG1hX2NvbnRpZ191c2VyX2dl
dAogIHRlZSwgYXJtNjQ6IHVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGVlX3NobV9yZWdpc3Rlcgog
IHZmaW8vdHlwZTEsIGFybTY0OiB1bnRhZyB1c2VyIHBvaW50ZXJzIGluIHZhZGRyX2dldF9wZm4K
ICBzZWxmdGVzdHMsIGFybTY0OiBhZGQgYSBzZWxmdGVzdCBmb3IgcGFzc2luZyB0YWdnZWQgcG9p
bnRlcnMgdG8ga2VybmVsCgogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAgICAg
ICAgICAgIHwgMTAgKysrLS0KIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9n
cHV2bS5jICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMg
ICAgICAgfCAgMiArCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nZW0uYyAgICAgICAg
ICAgfCAgMiArCiBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91dmVyYnNfY21kLmMgICAgICAgICAg
fCAgNCArKwogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIHwg
IDkgKystLQogZHJpdmVycy90ZWUvdGVlX3NobS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDEgKwogZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyAgICAgICAgICAgICAgIHwgIDIg
KwogZnMvbmFtZXNwYWNlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0K
IGZzL3VzZXJmYXVsdGZkLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIyICsrKysr
LS0tLS0KIGluY2x1ZGUvbGludXgvbW0uaCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0
ICsrCiBsaWIvc3RybmNweV9mcm9tX3VzZXIuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMyAr
LQogbGliL3N0cm5sZW5fdXNlci5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0K
IG1tL2ZyYW1lX3ZlY3Rvci5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIG1t
L2d1cC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrCiBtbS9t
YWR2aXNlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArCiBtbS9tZW1w
b2xpY3kuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKwogbW0vbWlncmF0
ZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogbW0vbWluY29yZS5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKwogbW0vbWxvY2suYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysKIG1tL21wcm90ZWN0LmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIG1tL21yZW1hcC5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIG1tL21zeW5jLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Fy
bTY0Ly5naXRpZ25vcmUgICAgICB8ICAxICsKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0
L01ha2VmaWxlICAgICAgICB8IDIyICsrKysrKysrKysKIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9h
cm02NC9ydW5fdGFnc190ZXN0LnNoICB8IDEyICsrKysrKwogdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvYXJtNjQvdGFnc19saWIuYyAgICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKwogdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMgICAgIHwgMTggKysrKysrKysKIDI4
IGZpbGVzIGNoYW5nZWQsIDE2MyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC8uZ2l0aWdub3JlCiBj
cmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvTWFrZWZpbGUK
IGNyZWF0ZSBtb2RlIDEwMDc1NSB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9ydW5fdGFn
c190ZXN0LnNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJt
NjQvdGFnc19saWIuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2FybTY0L3RhZ3NfdGVzdC5jCgotLSAKMi4yMi4wLnJjMS4zMTEuZzVkNzU3M2ExNTEtZ29vZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

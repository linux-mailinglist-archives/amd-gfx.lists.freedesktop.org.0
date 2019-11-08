Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCA4F5099
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Nov 2019 17:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05586F9EB;
	Fri,  8 Nov 2019 16:06:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B496F94C;
 Fri,  8 Nov 2019 11:37:08 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C480320869;
 Fri,  8 Nov 2019 11:37:07 +0000 (UTC)
Date: Fri, 8 Nov 2019 12:37:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH 4/5] power: avs: smartreflex: Remove superfluous cast in
 debugfs_create_file() call
Message-ID: <20191108113705.GA721212@kroah.com>
References: <20191021145149.31657-1-geert+renesas@glider.be>
 <20191021145149.31657-5-geert+renesas@glider.be>
 <4367615.jSCgeRn5tF@kreacher>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4367615.jSCgeRn5tF@kreacher>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Fri, 08 Nov 2019 16:06:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573213028;
 bh=G5j+RwShAgrettv3VQJ2Hzibs0yOoFaJu63CqOxn8Oo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iWFuYTQcqXM/DR65wCIopKLQsBH2V3ve8n4fUHcE6O0QCwEWq5LcBR7HT3UYbVuXy
 LLH+DzR/qTOHmtgWKoaaTL5pocOV+6Wehrg/cMS5rr/2mDYoYQbR8bXug4dIKrlFDH
 izPZgMynJUZ3fTgx+ygLAuT+nnb+N95WoPMCQjcs=
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
Cc: Nishanth Menon <nm@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>, David@rox.of.borg,
 Herbert Xu <herbert@gondor.apana.org.au>, Kevin Hilman <khilman@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.ibm.com>,
 amd-gfx@lists.freedesktop.org, Casey Leedom <leedom@chelsio.com>,
 linux-pm@vger.kernel.org, Pensando Drivers <drivers@pensando.io>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Shannon Nelson <snelson@pensando.io>, linuxppc-dev@lists.ozlabs.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTI6MjQ6NDJQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gTW9uZGF5LCBPY3RvYmVyIDIxLCAyMDE5IDQ6NTE6NDggUE0gQ0VUIEdl
ZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IFRoZXJlIGlzIG5vIG5lZWQgdG8gY2FzdCBhIHR5
cGVkIHBvaW50ZXIgdG8gYSB2b2lkIHBvaW50ZXIgd2hlbiBjYWxsaW5nCj4gPiBhIGZ1bmN0aW9u
IHRoYXQgYWNjZXB0cyB0aGUgbGF0dGVyLiAgUmVtb3ZlIGl0LCBhcyB0aGUgY2FzdCBwcmV2ZW50
cwo+ID4gZnVydGhlciBjb21waWxlciBjaGVja3MuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gCj4gR3JlZywgaGF2
ZSB5b3UgdGFrZW4gdGhpcyBvbmUgYnkgYW55IGNoYW5jZT8KCk5vcGUsIGl0J3MgYWxsIHlvdXJz
ISAgOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

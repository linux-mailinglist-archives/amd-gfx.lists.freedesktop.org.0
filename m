Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D4BFB23E
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Nov 2019 15:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0B46ED25;
	Wed, 13 Nov 2019 14:12:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08496ECD6;
 Wed, 13 Nov 2019 11:02:54 +0000 (UTC)
Received: from 79.184.253.153.ipv4.supernova.orange.pl (79.184.253.153) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id f9c9ec80f02b64f5; Wed, 13 Nov 2019 12:02:52 +0100
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 4/5] power: avs: smartreflex: Remove superfluous cast in
 debugfs_create_file() call
Date: Wed, 13 Nov 2019 12:02:51 +0100
Message-ID: <2168390.66xqsT3ub9@kreacher>
In-Reply-To: <20191021145149.31657-5-geert+renesas@glider.be>
References: <20191021145149.31657-1-geert+renesas@glider.be>
 <20191021145149.31657-5-geert+renesas@glider.be>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Nov 2019 14:12:08 +0000
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
Cc: Nishanth Menon <nm@ti.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 dri-devel@lists.freedesktop.org, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Breno =?ISO-8859-1?Q?Leit=E3o?= <leitao@debian.org>, David@rox.of.borg,
 Herbert Xu <herbert@gondor.apana.org.au>, Kevin Hilman <khilman@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.ibm.com>,
 amd-gfx@lists.freedesktop.org, Casey Leedom <leedom@chelsio.com>,
 linux-pm@vger.kernel.org, Pensando Drivers <drivers@pensando.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Paul Mackerras <paulus@samba.org>,
 Shannon Nelson <snelson@pensando.io>, linuxppc-dev@lists.ozlabs.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCBPY3RvYmVyIDIxLCAyMDE5IDQ6NTE6NDggUE0gQ0VUIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToKPiBUaGVyZSBpcyBubyBuZWVkIHRvIGNhc3QgYSB0eXBlZCBwb2ludGVyIHRv
IGEgdm9pZCBwb2ludGVyIHdoZW4gY2FsbGluZwo+IGEgZnVuY3Rpb24gdGhhdCBhY2NlcHRzIHRo
ZSBsYXR0ZXIuICBSZW1vdmUgaXQsIGFzIHRoZSBjYXN0IHByZXZlbnRzCj4gZnVydGhlciBjb21w
aWxlciBjaGVja3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4KPiAtLS0KPiAgZHJpdmVycy9wb3dlci9hdnMvc21hcnRyZWZs
ZXguYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcG93ZXIvYXZzL3NtYXJ0cmVmbGV4LmMgYi9k
cml2ZXJzL3Bvd2VyL2F2cy9zbWFydHJlZmxleC5jCj4gaW5kZXggNDY4NGU3ZGY4MzNhODFlOS4u
NTM3NmYzZDIyZjMxZWFkZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Bvd2VyL2F2cy9zbWFydHJl
ZmxleC5jCj4gKysrIGIvZHJpdmVycy9wb3dlci9hdnMvc21hcnRyZWZsZXguYwo+IEBAIC05MDUs
NyArOTA1LDcgQEAgc3RhdGljIGludCBvbWFwX3NyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gIAlzcl9pbmZvLT5kYmdfZGlyID0gZGVidWdmc19jcmVhdGVfZGlyKHNyX2lu
Zm8tPm5hbWUsIHNyX2RiZ19kaXIpOwo+ICAKPiAgCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImF1dG9j
b21wIiwgU19JUlVHTyB8IFNfSVdVU1IsIHNyX2luZm8tPmRiZ19kaXIsCj4gLQkJCSAgICAodm9p
ZCAqKXNyX2luZm8sICZwbV9zcl9mb3BzKTsKPiArCQkJICAgIHNyX2luZm8sICZwbV9zcl9mb3Bz
KTsKPiAgCWRlYnVnZnNfY3JlYXRlX3gzMigiZXJyd2VpZ2h0IiwgU19JUlVHTywgc3JfaW5mby0+
ZGJnX2RpciwKPiAgCQkJICAgJnNyX2luZm8tPmVycl93ZWlnaHQpOwo+ICAJZGVidWdmc19jcmVh
dGVfeDMyKCJlcnJtYXhsaW1pdCIsIFNfSVJVR08sIHNyX2luZm8tPmRiZ19kaXIsCj4gCgpBcHBs
eWluZyBhcyA1LjUgbWF0ZXJpYWwsIHRoYW5rcyEKCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==

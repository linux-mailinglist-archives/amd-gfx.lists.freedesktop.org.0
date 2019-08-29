Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF675A1B13
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 15:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AB56E0DF;
	Thu, 29 Aug 2019 13:11:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465486E08E;
 Thu, 29 Aug 2019 09:48:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C1AF2AFC2;
 Thu, 29 Aug 2019 09:47:59 +0000 (UTC)
Date: Thu, 29 Aug 2019 11:48:06 +0200
From: Jean Delvare <jdelvare@suse.de>
To: amd-gfx@lists.freedesktop.org
Subject: Couldn't read Speaker Allocation Data Block/SADs
Message-ID: <20190829114806.7dc21753@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Aug 2019 13:11:50 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, Christian =?UTF-8?B?S8O2?=
 =?UTF-8?B?bmlnXA==?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgYWxsLAoKU2luY2UgSSBjb25uZWN0ZWQgbXkgRGVsbCBkaXNwbGF5IG9uIG15IFJhZGVvbiBS
NSAyNDAgKE9sYW5kKSBjYXJkIG92ZXIKRGlzcGxheVBvcnQgaW5zdGVhZCBvZiBWR0EsIEkgZ2V0
IHRoZSBmb2xsb3dpbmcgZXJyb3IgbWVzc2FnZXMgbG9nZ2VkIGF0IGV2ZXJ5IGJvb3Q6CgpbZHJt
OmRjZV92Nl8wX2VuY29kZXJfbW9kZV9zZXQgW2FtZGdwdV1dICpFUlJPUiogQ291bGRuJ3QgcmVh
ZCBTcGVha2VyIEFsbG9jYXRpb24gRGF0YSBCbG9jazogLTIKW2RybTpkY2VfdjZfMF9lbmNvZGVy
X21vZGVfc2V0IFthbWRncHVdXSAqRVJST1IqIENvdWxkbid0IHJlYWQgU0FEczogLTIKCkkgYWxz
byBzZWUgdGhlbSBlYWNoIHRpbWUgdGhlIGRpc3BsYXkgd2FrZXMgdXAgYW5kIGFsc28gb24gVlQg
Y2hhbmdlLgpUaGlzIGlzIHdpdGgga2VybmVsIDUuMi45LgoKVGhpcyB3YXMgYWxzbyByZXBvcnRl
ZCBhcyBidWcgIzEwNzgyNSBieSBQYXVsIE1lbnplbDoKaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9w
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA3ODI1CgpFcnJvciAtMiBpcyBFTk9FTlQgKE5vIHN1Y2gg
ZmlsZSBvciBkaXJlY3RvcnkpLiBUaGUgZHJpdmVyIHF1ZXJpZXMgdGhlCmRpc3BsYXkgZm9yIGF1
ZGlvLXJlbGF0ZWQgaW5mb3JtYXRpb24sIHdoaWxlIG15IGRpc3BsYXkgZG9lcyBub3QgaGF2ZQpz
cGVha2VycyBub3IgaGVhZHNldCBjb25uZWN0b3IuCgpJIHN1c3BlY3QgdGhhdCB0aGUgImVycm9y
IiBpcyBwcmV0dHkgbXVjaCBleHBlY3RlZCBpbiB0aGlzIGNhc2UgYW5kIHRoZQpkcml2ZXIgaXMg
YmVpbmcgdG9vIHZlcmJvc2UgYWJvdXQgaXQuIEVpdGhlciB0aGUgY2FsbGluZyBjb2RlIHNob3Vs
ZApjb25zaWRlciAtRU5PRU5UIGFzIGEgbm9uLWVycm9yICgxMSBjYWxsaW5nIHNpdGVzIHRvIGZp
eCksIG9yIHRoZQpoZWxwZXIgZnVuY3Rpb25zIHNob3VsZCBzaW1wbHkgcmV0dXJuIDAgd2hlbiBu
byBhdWRpby1yZWxhdGVkIGRhdGEgaXMKYXZhaWxhYmxlIGZyb20gdGhlIGRpc3BsYXkgKDIgZnVu
Y3Rpb25zIHRvIGZpeCwgY2FsbGluZyBzaXRlcyBtYXkgaGF2ZQp0byBiZSBpbnNwZWN0ZWQgdG9v
IGFzIHNvbWUgdHJlYXQgMCBhcyBhbiBlcnJvciB0b28sIHdoaWNoIHNlZW1zCmluY29ycmVjdCB0
byBtZSkuCgpPcHRpb24gMSBzZWVtcyBjbGVhbmVyIHRvIG1lLCBidXQgSSBkb24ndCBrbm93IGlm
IHRoZXJlIGNvdWxkIGJlCmxlZ2l0aW1hdGUgcmVhc29ucyB0byBkaXN0aW5ndWlzaCBiZXR3ZWVu
IG5vIGF1ZGlvIGluZm9ybWF0aW9uIGJsb2NrCmZyb20gZGlzcGxheSBhbmQgZW1wdHkgYXVkaW8g
aW5mb3JtYXRpb24gZnJvbSBkaXNwbGF5IGluIHRoZSBmdXR1cmUuCgpXaGF0IGRvIHlvdSB0aGlu
az8KClRoYW5rcywKLS0gCkplYW4gRGVsdmFyZQpTVVNFIEwzIFN1cHBvcnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

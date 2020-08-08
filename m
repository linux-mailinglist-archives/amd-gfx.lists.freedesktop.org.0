Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C117324007A
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Aug 2020 01:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759856E34C;
	Sun,  9 Aug 2020 23:59:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 414 seconds by postgrey-1.36 at gabe;
 Sat, 08 Aug 2020 13:58:17 UTC
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C43C8925D
 for <amd-gfx@lists.freedesktop.org>; Sat,  8 Aug 2020 13:58:17 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 8E6D920EBA
 for <amd-gfx@lists.freedesktop.org>; Sat,  8 Aug 2020 13:51:21 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com
 [217.182.119.157])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 0E0EA2008F
 for <amd-gfx@lists.freedesktop.org>; Sat,  8 Aug 2020 13:51:18 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 8226F3F15F;
 Sat,  8 Aug 2020 15:51:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 59A9E2A7CD;
 Sat,  8 Aug 2020 15:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1596894675;
 bh=aMvdZDiGSkgDY34UFhCXqMYg0yzNL97YlcKNxs7qbyM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ylgj3ZeC6SrvHrTDxBpi2JJuB5D7RxGXVhJeE0bC76iqaf7IVqu6A2BNQtR2+U+DB
 vnPnz11HPKDlUFGFTjtkk/cE8Wg0i+vxqh3wd6vNALWoLc8YA9TFTemd8zcarvpg8Q
 QxW1w/GTjxJYHX953UiWIlZ0KKp1FyeP5OtJmmTY=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKApvAm2ixEj; Sat,  8 Aug 2020 15:51:13 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Sat,  8 Aug 2020 15:51:13 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 9CC79419E4;
 Sat,  8 Aug 2020 13:51:11 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="MJHIzbWP"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [203.86.239.91])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 14D50419E4;
 Sat,  8 Aug 2020 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1596894667;
 bh=aMvdZDiGSkgDY34UFhCXqMYg0yzNL97YlcKNxs7qbyM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MJHIzbWPjOIoXUO93z3n0T2+G0nMiFSPIIPlB237bMTBEFDgVBTc0BIb3nV+BtZRI
 cz3Mi7mHVmLK9Qo6WQ41zTNeQtb+WGgVP/pA/Ak+NP31tLS6Eh4Ggn5xPVFuRLKTep
 /wz/8xlJ0A/eVao6Qh2XTZxKy1TCkbsaHMUVB0j8=
Subject: Re: [PATCH] gpu/drm: Remove TTM_PL_FLAG_WC of VRAM to fix
 writecombine issue for Loongson64
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
References: <1596871502-3432-1-git-send-email-yangtiezhu@loongson.cn>
 <20200808134147.GA5772@alpha.franken.de>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <b7b16df1-d661-d59a-005b-da594ce9fc95@flygoat.com>
Date: Sat, 8 Aug 2020 21:50:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200808134147.GA5772@alpha.franken.de>
Content-Language: en-US
X-Rspamd-Queue-Id: 9CC79419E4
X-Spamd-Result: default: False [-0.10 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 R_SPF_SOFTFAIL(0.00)[~all]; ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
X-Mailman-Approved-At: Sun, 09 Aug 2020 23:59:03 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Huacai Chen <chenhc@lemote.com>, christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgrU2iAyMDIwLzgvOCDPws7nOTo0MSwgVGhvbWFzIEJvZ2VuZG9lcmZlciDQtLXAOgo+IE9uIFNh
dCwgQXVnIDA4LCAyMDIwIGF0IDAzOjI1OjAyUE0gKzA4MDAsIFRpZXpodSBZYW5nIHdyb3RlOgo+
PiBMb29uZ3NvbiBwcm9jZXNzb3JzIGhhdmUgYSB3cml0ZWNvbWJpbmUgaXNzdWUgdGhhdCBtYXli
ZSBmYWlsZWQgdG8KPj4gd3JpdGUgYmFjayBmcmFtZWJ1ZmZlciB1c2VkIHdpdGggQVRJIFJhZGVv
biBvciBBTUQgR1BVIGF0IHRpbWVzLAo+PiBhZnRlciBjb21taXQgOGEwOGU1MGNlZTY2ICgiZHJt
OiBQZXJtaXQgdmlkZW8tYnVmZmVycyB3cml0ZWNvbWJpbmUKPj4gbWFwcGluZyBmb3IgTUlQUyIp
LCB0aGVyZSBleGlzdHMgc29tZSBlcnJvcnMgc3VjaCBhcyBibHVycmVkIHNjcmVlbgo+PiBhbmQg
bG9ja3VwLCBhbmQgc28gb24uCj4+Cj4+IFJlbW92ZSB0aGUgZmxhZyBUVE1fUExfRkxBR19XQyBv
ZiBWUkFNIHRvIGZpeCB3cml0ZWNvbWJpbmUgaXNzdWUgZm9yCj4+IExvb25nc29uNjQgdG8gd29y
ayB3ZWxsIHdpdGggQVRJIFJhZGVvbiBvciBBTUQgR1BVLCBhbmQgaXQgaGFzIG5vIGFueQo+PiBp
bmZsdWVuY2Ugb24gdGhlIG90aGVyIHBsYXRmb3Jtcy4KPiB3ZWxsIGl0J3Mgbm90IG15IGNhbGwg
dG8gdGFrZSBvciByZWplY3QgdGhpcyBwYXRjaCwgYnV0IEkgYWxyZWFkeQo+IGluZGljYXRlZCBp
dCBtaWdodCBiZSBiZXR0ZXIgdG8gZGlzYWJsZSB3cml0ZWNvbWJpbmUgb24gdGhlIENQVQo+IGRl
dGVjdGlvbiBzaWRlIChvciBkbyB5b3UgaGF2ZSBvdGhlciBkZXZpY2VzIHdoZXJlIHdyaXRlY29t
YmluaW5nCj4gd29ya3MgPykuIFNvbWV0aGluZyBsaWtlIGJlbG93IHdpbGwgZGlzYmFsZSBpdCBm
b3IgYWxsIGxvb25nc29uNjQgQ1BVcy4KPiBJZiB5b3Ugbm93IGZpbmQgb3V0IHdoZXJlIGl0IHdv
cmtzIGFuZCB3aGVyZSBpdCBkb2Vzbid0LCB5b3UgY2FuIGV2ZW4KPiByZWR1Y2UgaXQgdG8gdGhl
IHJlcXVpcmVkIG1pbml1bSBvZiBhZmZlY3RlZCBDUFVzLgpIaSBUaWV6aHUsIFRob21hcywKClll
cywgd3JpdGVjb21iaW5lIHdvcmtzIHdlbGwgb24gTFM3QSdzIGludGVybmFsIEdQVS4uLi4KQW5k
IGV2ZW4gd29ya3Mgd2VsbCB3aXRoIHNvbWUgQU1EIEdQVXMgKGluIG15IGNhc2UsIFJYNTUwKS4K
ClRpZXpodSwgaXMgaXQgcG9zc2libGUgdG8gaW52ZXN0aWdhdGUgdGhlIGlzc3VlIGRlZXBlciBp
biBMb29uZ3Nvbj8KUHJvYmFibHkgd2UganVzdCBuZWVkIHRvIGFkZCBzb21lIGJhcnJpZXIgdG8g
bWFpbnRhaW4gdGhlIGRhdGEgY29oZXJlbmN5LApvciBkaXNhYmxlIHdyaXRlY29tYmluZSBmb3Ig
QU1EIEdQVSdzIGNvbW1hbmQgYnVmZmVyIGFuZCBsZWF2ZSB0ZXh0dXJlL2ZyYW1lCmJ1ZmZlciB3
YyBhY2NlbGVyYXRlZC4KClRoYW5rcy4KCi0gSmlheHVuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeAo=

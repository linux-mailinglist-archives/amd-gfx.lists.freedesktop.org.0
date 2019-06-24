Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18DC51B75
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 21:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2632389C51;
	Mon, 24 Jun 2019 19:35:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.ud03.udmedia.de (ud03.udmedia.de [194.117.254.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48AF89C51
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 19:35:18 +0000 (UTC)
Received: (qmail 10535 invoked from network); 24 Jun 2019 21:35:15 +0200
Received: by mail.ud03.udmedia.de with ESMTPA; 24 Jun 2019 21:35:15 +0200
X-UD-Smtp-Session: ud03?335p7@a3Za6RaMYIbCdf4e
MIME-Version: 1.0
Date: Mon, 24 Jun 2019 21:35:15 +0200
From: =?UTF-8?Q?Dieter_N=C3=BCtzel?= <Dieter@nuetzel-hh.de>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: Re: [amd-staging-drm-next] broken after Navi merge
In-Reply-To: <DM5PR12MB141886EE5B99F13C6AFA16EBFCE00@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <9ec82cfce8a6ee8f24e085e1a423ecaf@nuetzel-hh.de>
 <DM5PR12MB1418BDB2340B377498F22901FCE00@DM5PR12MB1418.namprd12.prod.outlook.com>
 <DM5PR12MB141886EE5B99F13C6AFA16EBFCE00@DM5PR12MB1418.namprd12.prod.outlook.com>
Message-ID: <926c919e5048d172cc33d08d10da6dc7@nuetzel-hh.de>
X-Sender: Dieter@nuetzel-hh.de
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=nuetzel-hh.de;
 h=
 mime-version:content-type:content-transfer-encoding:date:from:to
 :cc:subject:in-reply-to:references:message-id; s=k1; bh=AafZkxc2
 9C7/6pKHrkm4p28Km7Cy8AVXN/sg0WCXJUA=; b=W3uBjuAaDHiPUTztnZNRpPG8
 R19Rbnj3uG+Peh1ZWpFpSj/rakTGlSkSJ6Vktmy9auPffBVOo3YX3zLbJheGSRMt
 B7RF8UxOj1HgY4DiuOj3SJ2ic0FCLrteagRFvouajhC7YYruXrk6hCwvY0wzBgRq
 GyuTb/L6cQyS3tJOllM=
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
Cc: Alex Deucher <alexdeucher@gmail.com>,
 amd-devel <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVsbG8gSGF3a2luZywgaGVsbG8gYWxsLAoKdXAgYW5kIHJ1bm5pbmcuCkkgc2F3IHRoYXQgQWxl
eCBzZW50IGl0IGluIGZvciA1LjMgYWxyZWFkeS4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ghCgpCVFcK
VGhpcyBpc24ndCBuZWVkZWQgZm9yIHByZSBOYXZpPwpDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzA9
eQpDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVD15CkJ1dCBkbyBub3QgaGFybT8KCmdsbWFy
azIgc2VlbXMgdG8gYmUgc29tZXdoYXQgZmFzdGVyLCBhZ2FpbiA7LSkKCkRpZXRlcgoKQW0gMjQu
MDYuMjAxOSAxNTo1Mywgc2NocmllYiBaaGFuZywgSGF3a2luZzoKPiBBaCwgc29ycnksIGl0IGhh
cyBub3QgbGFuZGVkIHlldC4gYnV0IHRoZSBwYXRjaCBpcyBpbiByZXZpZXcgbGlzdCBub3cuCj4g
W1BBVENIXSBkcm0vYW1kZ3B1OiBmaXggbW9kcHJvYmUgZmFpbHVyZSBmb3IgdXZkXzQvNS82Cj4g
Cj4gUmVnYXJkcywKPiBIYXdraW5nCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9t
OiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYgT2YKPiBaaGFuZywgSGF3a2luZwo+IFNlbnQ6IDIwMTnlubQ25pyIMjTml6UgMjE6NTAKPiBU
bzogRGlldGVyIE7DvHR6ZWwgPERpZXRlckBudWV0emVsLWhoLmRlPjsgQWxleCBEZXVjaGVyIAo+
IDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+Cj4gQ2M6IGFtZC1kZXZlbCA8YW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc+Cj4gU3ViamVjdDogUkU6IFthbWQtc3RhZ2luZy1kcm0tbmV4dF0gYnJv
a2VuIGFmdGVyIE5hdmkgbWVyZ2UKPiAKPiBQbGVhc2UgcHVsbCBteSBsYXRlc3QgZml4ZXMgdGhh
dCBwcm9iYWJseSBoZWxwcyBvbiBpc3N1ZSB5b3UgcmFuIGludG8uCj4gNjFhZGRhMWY2ZjA4MDcx
N2E5ZWU0Yzk2YTc0YzhkZjZmZmFiMWZmMCBkcm0vYW1kZ3B1OiBmaXggbW9kcHJvYmUKPiBmYWls
dXJlIGZvciB1dmRfNC81LzYKPiAKPiBSZWdhcmRzLAo+IEhhd2tpbmcKPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiAKPiBEaWV0ZXIgTsO8dHplbAo+IFNlbnQ6IDIwMTnl
ubQ25pyIMjTml6UgMjE6MjkKPiBUbzogQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5j
b20+Cj4gQ2M6IGFtZC1kZXZlbCA8YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+Cj4gU3Vi
amVjdDogW2FtZC1zdGFnaW5nLWRybS1uZXh0XSBicm9rZW4gYWZ0ZXIgTmF2aSBtZXJnZQo+IAo+
IEhlbGxvIEFsZXgsCj4gCj4gYWZ0ZXIgeW91ciBsYXRlc3QgTmF2aSBtZXJnZSAnYW1kLXN0YWdp
bmctZHJtLW5leHQnIGlzIGJyb2tlbiB3aXRoIAo+IFBvbGFyaXMgMjAuCj4gCj4gSXQgaGFuZ3Mg
d2l0aCB2ZXJ5IGxpZ2h0IGdyYXkgKG1vc3RseSBibGFjaykgc2NyZWVuIGFmdGVyIGZpcnN0IG1v
ZGUgCj4gc3dpdGNoLgo+IAo+IFRlc3RlZCBjb21taXQ6Cj4gMzE3ZDUwMzNhYjZjIChIRUFEIC0+
IGFtZC1zdGFnaW5nLWRybS1uZXh0LCAKPiBvcmlnaW4vYW1kLXN0YWdpbmctZHJtLW5leHQpCj4g
ZHJtL2FtZGdwdTogYWRkIGpvYi0+cHJlYW1ibGVfc3RhdHVzIGJhY2sgdG8gc3RhdHVzIHZhbHVl
Cj4gCj4gRXZlbiBydW4gbW9kZSAzfDEgd2l0aCBncnViMiBkbyBub3Qgd29ya3MuCj4gCj4gU2Vl
IGFsc286Cj4gaHR0cHM6Ly93d3cucGhvcm9uaXguY29tL2ZvcnVtcy9mb3J1bS9waG9yb25peC9s
YXRlc3QtcGhvcm9uaXgtYXJ0aWNsZXMvMTEwODUwMC1hbWQtc2VuZHMtaW4tbmF2aS1zdXBwb3J0
LW90aGVyLXJlbWFpbmluZy1hbWRncHUtY2hhbmdlcy1mb3ItbGludXgtNS0zP3A9MTEwODY4NiNw
b3N0MTEwODY4Ngo+IAo+IEkgaGF2ZSB0byByb2xsIGJhY2sgYmVmb3JlIE5hdmkgY29tbWl0cyB0
byBnZXQgd29ya2luZwo+ICdhbWQtc3RhZ2luZy1kcm0tbmV4dCcga2VybmVsLCBhZ2Fpbi4KPiAK
PiBNYXliZSB5b3UgaGF2ZSBzb21lICdzcGFyZScgdGltZSBkZXNwaXRlIGFsbCB5b3VyIE5hdmkg
ZW5hYmxlbWVudCB3b3JrCj4gdG8gbGlmdCAnYW1kLXN0YWdpbmctZHJtLW5leHQnIHRvIGF0IGxl
YXN0IDUuMi1yYzYgKHRoZSBTdGVhbSBUQ1AKPiB0aGluZykuCj4gCj4gR3JlZXRpbmdzLAo+IERp
ZXRlcgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBt
YWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

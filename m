Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DC03904A6
	for <lists+amd-gfx@lfdr.de>; Tue, 25 May 2021 17:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CE16E405;
	Tue, 25 May 2021 15:10:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACB26E405
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 May 2021 15:10:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so10395337wmq.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 May 2021 08:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=PVhK8bgWfjJ5ls1gnhNKV3N0QNeVb4joi90tugeIatM=;
 b=VO4+DMNLX9sWgGbLZqdV8aR2NVJGsLf9IQ8umgAzym8r5odhpFhYf1joXkD8N27Gcw
 hCB2Vb0Gp3XFPC0yTlSvaKnfp2S61kHhiTxI66ah9oHRAwLmnpaBhaHIeWPfXKY5oXl1
 r59XKH5NEht6FnMTBQrHLLVUPTi8Of1Q0KN5hkwgSMeR1GvmWXoiU02eddcpOeL8GlDl
 5ajER0gxxpxOrkESmTB13G8P39tzh467z9w6VWBjP9OSbBXJ+eZ0Fy5umaV5n9ENpwOR
 eWP6nL8VKpdEgh1EV8RKSEb5VAlV7442uL1nhlt0fkAVVhC+JIhJuDT4j1Qu3ppig47g
 VZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PVhK8bgWfjJ5ls1gnhNKV3N0QNeVb4joi90tugeIatM=;
 b=GK/9xRWnsvkKCQeTRzK6Affna9BcIGQuJ+RQw+bDh6WmGkCZ1eH79Xh7o1hIzM/B1R
 QWBN3lu8XNnrSUwdXxXNpn5tb/4e2fDURT+P6qPfTEOLFdbzMzhUMZoXXKSt7cXCZpte
 ISLqGdymRnLLh4ypIEje8eJxb7XR5YzKajQe+tPyYA5d9hgaIR7WYCEBHoSKyQXOP4Ms
 c69kjWD+ifxcQf/7A7gRaHfVXECi7FvqKBxeOKOb46INB1y1MujXkJ0zuszVRF3C5n/F
 Nc5rlbxqMqbM/7o6PHS108to6Ai+QMVvyhoLvonCUJf6Dt7H9DX8BbSESfWqqQ/Hg7oK
 z/bA==
X-Gm-Message-State: AOAM531yj62Fa1akYOQxbOrsLBiwwUeIEI7S4jesE2pjlDiquHAlizgG
 WJ4/KGSjwiw6+9iURD/UtBuTBb0b7Fo=
X-Google-Smtp-Source: ABdhPJxSGKL88ppY1bW4UgH5XCCQZZLY0uj/m3vUuON3M21ttPp98Ys9rRWYQK055d4IvMiSrXm40g==
X-Received: by 2002:a7b:ca55:: with SMTP id m21mr4330269wml.77.1621955401070; 
 Tue, 25 May 2021 08:10:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1?
 ([2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1])
 by smtp.gmail.com with ESMTPSA id i1sm16398218wrp.51.2021.05.25.08.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 08:10:00 -0700 (PDT)
Subject: Re: radeon ring 0 test failed on arm64
To: Peter Geis <pgwipeout@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <CAMdYzYptw9L=5SECtVkNZruTT-x57+03vj0A+5efvq8cESzLyQ@mail.gmail.com>
 <ea6a7137-f8c0-ecaf-2476-13b54cc72138@amd.com>
 <CAMdYzYpnY7uR213G5k_PTD8_a-TO=yYJOpNB5pL-TDan6CFHAA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0566196a-baea-452b-7215-ca9b5bc6abcb@gmail.com>
Date: Tue, 25 May 2021 17:09:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMdYzYpnY7uR213G5k_PTD8_a-TO=yYJOpNB5pL-TDan6CFHAA@mail.gmail.com>
Content-Language: en-US
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjUuMDUuMjEgdW0gMTY6MTkgc2NocmllYiBQZXRlciBHZWlzOgo+IE9uIFR1ZSwgTWF5IDI1
LCAyMDIxIGF0IDEwOjA4IEFNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPiB3cm90ZToKPj4gSGkgUGV0ZXIsCj4+Cj4+IHNvbWUgY29tbWVudCBhZGRpdGlvbmFs
bHkgd2hhdCBBbGV4IHNhaWQuCj4+Cj4+IEFtIDI1LjA1LjIxIHVtIDA0OjM0IHNjaHJpZWIgUGV0
ZXIgR2VpczoKPj4gW1NOSVBdCj4+PiAgICAgICAgICAgTWVtb3J5IGF0IDMwMDkwMDAwMCAoNjQt
Yml0LCBub24tcHJlZmV0Y2hhYmxlKSBbc2l6ZT0xMjhLXQo+PiBUaGlzIGhlcmUuLi4KPj4KPj4+
ICAgICAgIFtTTklQXQo+Pj4gICAgICAgICAgIE1lbW9yeSBhdCAzMDA5NDAwMDAgKDY0LWJpdCwg
bm9uLXByZWZldGNoYWJsZSkgW3NpemU9MTZLXQo+PiBBbmQgdGhhdCBsb29rIHJhdGhlciBmaXNo
eSB0byBtZS4gVGhlIG5vbi1wcmVmZXRjaGFibGUgbWVtb3J5IG9uIEFNRAo+PiBHUFVzIGlzIDMy
Yml0LCBiaXQgNjRiaXQuCj4+Cj4+IExvb2tzIGxpa2Ugc29tZXRoaW5nIGlzIHdyb25nIHdpdGgg
dGhlIGRldGVjdGlvbiBjb2RlIGhlcmUuCj4+Cj4+IENocmlzdGlhbi4KPiBZZXMsIHlvdSBhcmUg
Y29ycmVjdC4gVGhlcmUncyBzb21ldGhpbmcgd2VpcmQgd2l0aCB0aGUgYWxsb2NhdGlvbgo+IGRl
dGVjdGlvbiBjb2RlIGFuZCBmbGFncy4KPiBJdCdzIGN1cnJlbnRseSBiZWluZyBkaXNjdXNzZWQg
b24gWzFdLgo+IFBlcmhhcHMgc29tZSBjcm9zc3RhbGsgd291bGQgYmUgYmVuZWZpY2lhbC4KPgo+
IEkgZGlkIG5vdGljZSB0aGF0IGV2ZW4gaWYgSSBmbGFnIHRoZSBtZW1vcnkgaW4gdGhlIGRldmlj
ZS10cmVlIHJhbmdlcwo+IGFzIDMyYml0IHdoZW4gdGhlIGZpbmFsIGFsbG9jYXRpb24gb2NjdXJz
IGl0J3MgZmxhZ2dlZCBhcyA2NGJpdC4KPiBCdXQgaXQgY2hhbmdlcyB0aGUgYmVoYXZpb3IsIGJl
Y2F1c2UgaWYgaXQncyBmbGFnZ2VkIGFzIDY0Yml0IGluIHRoZQo+IGRldmljZSB0cmVlIHRoZSBh
bGxvY2F0aW9uIGZhaWxzIGZvciBtb3N0IG9mIHRoZSBBTUQgQkFScy4KCldlbGwgdGhhdCB0aGUg
YWxsb2NhdGlvbiBmYWlscyBpcyB0aGUgbGVhc3Qgb2YgeW91ciBwcm9ibGVtcy4KCldoZW4geW91
IHByb2dyYW0gYSAzMmJpdCBCQVIgYXMgNjRiaXQgeW91IG92ZXJ3cml0ZSB0aGUgcmVnaXN0ZXIg
YmVoaW5kIAp0aGUgQkFSIGFkZHJlc3Mgd2l0aCB0aGUgdXBwZXIgMzJiaXRzIG9mIHRoZSA2NGJp
dCBhZGRyZXNzIHZhbHVlLgoKU28gZXZlbiBpZiB0aGUgYWxsb2NhdGlvbiBmaXRzIGludG8gMzJi
aXRzLCB0aGUgZXh0cmEgcmVnaXN0ZXIgd3JpdGUgCndpbGwgY2VydGFpbmx5IHB1dCB5b3VyIGRl
dmljZSBpbnRvIGEgYmFuYW5hIHN0YXRlLgoKRmVlbCBmcmVlIHRvIGxvb3AgbWUgaW4gb24gdGhv
c2UgZGlzY3Vzc2lvbnMuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgoKPiBbMV1odHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sLzdhMWUyZWJjLWY3ZDgtODQzMS1kODQ0LTQxYTljMzZhODkxMUBhcm0u
Y29tLwo+Cj4+PiAgICAgICAgICAgQ2FwYWJpbGl0aWVzOiBbNTBdIFBvd2VyIE1hbmFnZW1lbnQg
dmVyc2lvbiAzCj4+PiAgICAgICAgICAgQ2FwYWJpbGl0aWVzOiBbNThdIEV4cHJlc3MgTGVnYWN5
IEVuZHBvaW50LCBNU0kgMDAKPj4+ICAgICAgICAgICBDYXBhYmlsaXRpZXM6IFthMF0gTVNJOiBF
bmFibGUrIENvdW50PTEvMSBNYXNrYWJsZS0gNjRiaXQrCj4+PiAgICAgICAgICAgQ2FwYWJpbGl0
aWVzOiBbMTAwXSBWZW5kb3IgU3BlY2lmaWMgSW5mb3JtYXRpb246IElEPTAwMDEgUmV2PTEKPj4+
IExlbj0wMTAgPD8+Cj4+PiAgICAgICAgICAgQ2FwYWJpbGl0aWVzOiBbMTUwXSBBZHZhbmNlZCBF
cnJvciBSZXBvcnRpbmcKPj4+ICAgICAgICAgICBLZXJuZWwgZHJpdmVyIGluIHVzZTogc25kX2hk
YV9pbnRlbAo+Pj4KPj4+IFsgICAgNi40MzEzMTJdIHJvY2tjaGlwLWR3LXBjaWUgM2MwMDAwMDAw
LnBjaWU6IExvb2tpbmcgdXAKPj4+IHZwY2llM3YzLXN1cHBseSBmcm9tIGRldmljZSB0cmVlCj4+
PiBbICAgIDYuNDM0NjE5XSByb2NrY2hpcC1kdy1wY2llIDNjMDAwMDAwMC5wY2llOiBob3N0IGJy
aWRnZQo+Pj4gL3BjaWVAZmUyNjAwMDAgcmFuZ2VzOgo+Pj4gWyAgICA2LjQzNTM1MF0gcm9ja2No
aXAtZHctcGNpZSAzYzAwMDAwMDAucGNpZTogUGFyc2luZyByYW5nZXMgcHJvcGVydHkuLi4KPj4+
IFsgICAgNi40MzYwMThdIHJvY2tjaGlwLWR3LXBjaWUgM2MwMDAwMDAwLnBjaWU6ICAgICAgIElP
Cj4+PiAweDAzMDA4MDAwMDAuLjB4MDMwMDhmZmZmZiAtPiAweDAwMDA4MDAwMDAKPj4+IFsgICAg
Ni40MzY5NzhdIHJvY2tjaGlwLWR3LXBjaWUgM2MwMDAwMDAwLnBjaWU6ICAgICAgTUVNCj4+PiAw
eDAzMDA5MDAwMDAuLjB4MDMzZmZmZmZmZiAtPiAweDAwMDA5MDAwMDAKPj4+IFsgICAgNi40Mzgw
NjVdIHJvY2tjaGlwLWR3LXBjaWUgM2MwMDAwMDAwLnBjaWU6IGdvdCA0OSBmb3IgbGVnYWN5IGlu
dGVycnVwdAo+Pj4gWyAgICA2LjQzOTM4Nl0gcm9ja2NoaXAtZHctcGNpZSAzYzAwMDAwMDAucGNp
ZTogZm91bmQgNSBpbnRlcnJ1cHRzCj4+PiBbICAgIDYuNDM5OTM0XSByb2NrY2hpcC1kdy1wY2ll
IDNjMDAwMDAwMC5wY2llOiBpbnZhbGlkIHJlc291cmNlCj4+PiBbICAgIDYuNDQwNDczXSByb2Nr
Y2hpcC1kdy1wY2llIDNjMDAwMDAwMC5wY2llOiBpQVRVIHVucm9sbDogZW5hYmxlZAo+Pj4gWyAg
ICA2LjQ0MTAyOV0gcm9ja2NoaXAtZHctcGNpZSAzYzAwMDAwMDAucGNpZTogRGV0ZWN0ZWQgaUFU
VSByZWdpb25zOgo+Pj4gOCBvdXRib3VuZCwgOCBpbmJvdW5kCj4+PiBbICAgIDYuNjUwMTY1XSBy
b2NrY2hpcC1kdy1wY2llIDNjMDAwMDAwMC5wY2llOiBMaW5rIHVwCj4+PiBbICAgIDYuNjUyNDM4
XSByb2NrY2hpcC1kdy1wY2llIDNjMDAwMDAwMC5wY2llOiBQQ0kgaG9zdCBicmlkZ2UgdG8gYnVz
IDAwMDA6MDAKPj4+IFsgICAgNi42NTMxNDJdIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVz
b3VyY2UgW2J1cyAwMF0KPj4+IFsgICAgNi42NTM4OTldIHBjaV9idXMgMDAwMDowMDogcm9vdCBi
dXMgcmVzb3VyY2UgW2lvICAweDAwMDAtMHhmZmZmZl0KPj4+IChidXMgYWRkcmVzcyBbMHg4MDAw
MDAtMHg4ZmZmZmZdKQo+Pj4gWyAgICA2LjY1NDc4MV0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1
cyByZXNvdXJjZSBbbWVtCj4+PiAweDMwMDkwMDAwMC0weDMzZmZmZmZmZl0gKGJ1cyBhZGRyZXNz
IFsweDAwOTAwMDAwLTB4M2ZmZmZmZmZdKQo+Pj4gWyAgICA2LjY1NTc4Ml0gcGNpX2J1cyAwMDAw
OjAwOiBzY2FubmluZyBidXMKPj4+IFsgICAgNi42NTY2ODldIHBjaSAwMDAwOjAwOjAwLjA6IGRp
c2FibGluZyBFeHRlbmRlZCBUYWdzICh0aGlzIGRldmljZQo+Pj4gY2FuJ3QgaGFuZGxlIHRoZW0p
Cj4+PiBbICAgIDYuNjU3NjA1XSBwY2kgMDAwMDowMDowMC4wOiBbMWQ4NzozNTY2XSB0eXBlIDAx
IGNsYXNzIDB4MDYwNDAwCj4+PiBbICAgIDYuNjU4NDE4XSBwY2kgMDAwMDowMDowMC4wOiByZWcg
MHgzODogW21lbSAweDAwMDAwMDAwLTB4MDAwMGZmZmYgcHJlZl0KPj4+IFsgICAgNi42NTk5MjNd
IHBjaSAwMDAwOjAwOjAwLjA6IHN1cHBvcnRzIEQxIEQyCj4+PiBbICAgIDYuNjYwMzYwXSBwY2kg
MDAwMDowMDowMC4wOiBQTUUjIHN1cHBvcnRlZCBmcm9tIEQwIEQxIEQzaG90Cj4+PiBbICAgIDYu
NjYxMDUzXSBwY2kgMDAwMDowMDowMC4wOiBQTUUjIGRpc2FibGVkCj4+PiBbICAgIDYuNjcyNTc4
XSBwY2lfYnVzIDAwMDA6MDA6IGZpeHVwcyBmb3IgYnVzCj4+PiBbICAgIDYuNjczMDYzXSBwY2kg
MDAwMDowMDowMC4wOiBzY2FubmluZyBbYnVzIDAxLWZmXSBiZWhpbmQgYnJpZGdlLCBwYXNzIDAK
Pj4+IFsgICAgNi42NzUwMjFdIHBjaV9idXMgMDAwMDowMTogYnVzbl9yZXM6IGNhbiBub3QgaW5z
ZXJ0IFtidXMgMDEtZmZdCj4+PiB1bmRlciBbYnVzIDAwXSAoY29uZmxpY3RzIHdpdGggKG51bGwp
IFtidXMgMDBdKQo+Pj4gWyAgICA2LjY3NTk5M10gcGNpX2J1cyAwMDAwOjAxOiBzY2FubmluZyBi
dXMKPj4+IFsgICAgNi42NzY3MDVdIHBjaSAwMDAwOjAxOjAwLjA6IFsxMDAyOjY3NWRdIHR5cGUg
MDAgY2xhc3MgMHgwMzAwMDAKPj4+IFsgICAgNi42Nzc2NzJdIHBjaSAwMDAwOjAxOjAwLjA6IHJl
ZyAweDEwOiBbbWVtIDB4MDAwMDAwMDAtMHgwZmZmZmZmZgo+Pj4gNjRiaXQgcHJlZl0KPj4+IFsg
ICAgNi42Nzg0OTNdIHBjaSAwMDAwOjAxOjAwLjA6IHJlZyAweDE4OiBbbWVtIDB4MDAwMDAwMDAt
MHgwMDAxZmZmZiA2NGJpdF0KPj4+IFsgICAgNi42NzkyMTddIHBjaSAwMDAwOjAxOjAwLjA6IHJl
ZyAweDIwOiBpbml0aWFsIEJBUiB2YWx1ZSAweDAwMDAwMDAwIGludmFsaWQKPj4+IFsgICAgNi42
Nzk4OTRdIHBjaSAwMDAwOjAxOjAwLjA6IHJlZyAweDIwOiBbaW8gIHNpemUgMHgwMTAwXQo+Pj4g
WyAgICA2LjY4MDU2NV0gcGNpIDAwMDA6MDE6MDAuMDogcmVnIDB4MzA6IFttZW0gMHgwMDAwMDAw
MC0weDAwMDFmZmZmIHByZWZdCj4+PiBbICAgIDYuNjgyMTcwXSBwY2kgMDAwMDowMTowMC4wOiBz
dXBwb3J0cyBEMSBEMgo+Pj4gWyAgICA2LjY4Mjg5N10gcGNpIDAwMDA6MDE6MDAuMDogMi4wMDAg
R2IvcyBhdmFpbGFibGUgUENJZSBiYW5kd2lkdGgsCj4+PiBsaW1pdGVkIGJ5IDIuNSBHVC9zIFBD
SWUgeDEgbGluayBhdCAwMDAwOjAwOjAwLjAgKGNhcGFibGUgb2YgMzIuMDAwCj4+PiBHYi9zIHdp
dGggMi41IEdUL3MgUENJZSB4MTYgbGluaykKPj4+IFsgICAgNi42ODY2NzBdIHBjaSAwMDAwOjAx
OjAwLjA6IHZnYWFyYjogVkdBIGRldmljZSBhZGRlZDoKPj4+IGRlY29kZXM9aW8rbWVtLG93bnM9
bm9uZSxsb2Nrcz1ub25lCj4+PiBbICAgIDYuNjg4MzY3XSBwY2kgMDAwMDowMTowMC4xOiBbMTAw
MjphYTkwXSB0eXBlIDAwIGNsYXNzIDB4MDQwMzAwCj4+PiBbICAgIDYuNjg5MTY4XSBwY2kgMDAw
MDowMTowMC4xOiByZWcgMHgxMDogW21lbSAweDAwMDAwMDAwLTB4MDAwMDNmZmYgNjRiaXRdCj4+
PiBbICAgIDYuNjkxMDk5XSBwY2kgMDAwMDowMTowMC4xOiBzdXBwb3J0cyBEMSBEMgo+Pj4gWyAg
ICA2LjcwMjQ5NV0gcGNpX2J1cyAwMDAwOjAxOiBmaXh1cHMgZm9yIGJ1cwo+Pj4gWyAgICA2Ljcw
MjkzNV0gcGNpX2J1cyAwMDAwOjAxOiBidXMgc2NhbiByZXR1cm5pbmcgd2l0aCBtYXg9MDEKPj4+
IFsgICAgNi43MDM1MDBdIHBjaSAwMDAwOjAwOjAwLjA6IHNjYW5uaW5nIFtidXMgMDEtZmZdIGJl
aGluZCBicmlkZ2UsIHBhc3MgMQo+Pj4gWyAgICA2LjcwNDE3MV0gcGNpX2J1cyAwMDAwOjAwOiBi
dXMgc2NhbiByZXR1cm5pbmcgd2l0aCBtYXg9ZmYKPj4+IFsgICAgNi43MDQ3NjhdIHBjaSAwMDAw
OjAwOjAwLjA6IEJBUiAxNTogYXNzaWduZWQgW21lbQo+Pj4gMHgzMTAwMDAwMDAtMHgzMWZmZmZm
ZmYgNjRiaXQgcHJlZl0KPj4+IFsgICAgNi43MDU2NjRdIHBjaSAwMDAwOjAwOjAwLjA6IEJBUiAx
NDogYXNzaWduZWQgW21lbSAweDMwMDkwMDAwMC0weDMwMDlmZmZmZl0KPj4+IFsgICAgNi43MDYz
MzddIHBjaSAwMDAwOjAwOjAwLjA6IEJBUiA2OiBhc3NpZ25lZCBbbWVtCj4+PiAweDMwMGEwMDAw
MC0weDMwMGEwZmZmZiBwcmVmXQo+Pj4gWyAgICA2LjcwNzAzNV0gcGNpIDAwMDA6MDA6MDAuMDog
QkFSIDEzOiBhc3NpZ25lZCBbaW8gIDB4MTAwMC0weDFmZmZdCj4+PiBbICAgIDYuNzA3Njg3XSBw
Y2kgMDAwMDowMTowMC4wOiBCQVIgMDogYXNzaWduZWQgW21lbQo+Pj4gMHgzMTAwMDAwMDAtMHgz
MWZmZmZmZmYgNjRiaXQgcHJlZl0KPj4+IFsgICAgNi43MDg1MjJdIHBjaSAwMDAwOjAxOjAwLjA6
IEJBUiAyOiBhc3NpZ25lZCBbbWVtCj4+PiAweDMwMDkwMDAwMC0weDMwMDkxZmZmZiA2NGJpdF0K
Pj4+IFsgICAgNi43MDk0MTFdIHBjaSAwMDAwOjAxOjAwLjA6IEJBUiA2OiBhc3NpZ25lZCBbbWVt
Cj4+PiAweDMwMDkyMDAwMC0weDMwMDkzZmZmZiBwcmVmXQo+Pj4gWyAgICA2LjcxMDExNl0gcGNp
IDAwMDA6MDE6MDAuMTogQkFSIDA6IGFzc2lnbmVkIFttZW0KPj4+IDB4MzAwOTQwMDAwLTB4MzAw
OTQzZmZmIDY0Yml0XQo+Pj4gWyAgICA2LjcxMDg5N10gcGNpIDAwMDA6MDE6MDAuMDogQkFSIDQ6
IGFzc2lnbmVkIFtpbyAgMHgxMDAwLTB4MTBmZl0KPj4+IFsgICAgNi43MTE1MTZdIHBjaSAwMDAw
OjAwOjAwLjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwMS1mZl0KPj4+IFsgICAgNi43MTIwMjJdIHBj
aSAwMDAwOjAwOjAwLjA6ICAgYnJpZGdlIHdpbmRvdyBbaW8gIDB4MTAwMC0weDFmZmZdCj4+PiBb
ICAgIDYuNzEyNjE3XSBwY2kgMDAwMDowMDowMC4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweDMw
MDkwMDAwMC0weDMwMDlmZmZmZl0KPj4+IFsgICAgNi43MTMyNzhdIHBjaSAwMDAwOjAwOjAwLjA6
ICAgYnJpZGdlIHdpbmRvdyBbbWVtCj4+PiAweDMxMDAwMDAwMC0weDMxZmZmZmZmZiA2NGJpdCBw
cmVmXQo+Pj4gWyAgICA2LjcxNjE2NV0gcGNpZXBvcnQgMDAwMDowMDowMC4wOiBhc3NpZ24gSVJR
OiBnb3QgOTUKPj4+IFsgICAgNi43NDk4MzldIHBjaWVwb3J0IDAwMDA6MDA6MDAuMDogUE1FOiBT
aWduYWxpbmcgd2l0aCBJUlEgOTYKPj4+IFsgICAgNi43NTE3MzhdIHBjaWVwb3J0IDAwMDA6MDA6
MDAuMDogc2F2aW5nIGNvbmZpZyBzcGFjZSBhdCBvZmZzZXQKPj4+IDB4MCAocmVhZGluZyAweDM1
NjYxZDg3KQo+Pj4gWyAgICA2Ljc1MjQ5NV0gcGNpZXBvcnQgMDAwMDowMDowMC4wOiBzYXZpbmcg
Y29uZmlnIHNwYWNlIGF0IG9mZnNldAo+Pj4gMHg0IChyZWFkaW5nIDB4MTAwNTA3KQo+Pj4gWyAg
ICA2Ljc1MzIyNF0gcGNpZXBvcnQgMDAwMDowMDowMC4wOiBzYXZpbmcgY29uZmlnIHNwYWNlIGF0
IG9mZnNldAo+Pj4gMHg4IChyZWFkaW5nIDB4NjA0MDAwMSkKPj4+IFsgICAgNi43NTQyMTddIHBj
aWVwb3J0IDAwMDA6MDA6MDAuMDogc2F2aW5nIGNvbmZpZyBzcGFjZSBhdCBvZmZzZXQKPj4+IDB4
YyAocmVhZGluZyAweDEwMDAwKQo+Pj4gWyAgICA2Ljc1NDk0Ml0gcGNpZXBvcnQgMDAwMDowMDow
MC4wOiBzYXZpbmcgY29uZmlnIHNwYWNlIGF0IG9mZnNldAo+Pj4gMHgxMCAocmVhZGluZyAweDAp
Cj4+PiBbICAgIDYuNzU1NjQwXSBwY2llcG9ydCAwMDAwOjAwOjAwLjA6IHNhdmluZyBjb25maWcg
c3BhY2UgYXQgb2Zmc2V0Cj4+PiAweDE0IChyZWFkaW5nIDB4MCkKPj4+IFsgICAgNi43NTYzMzdd
IHBjaWVwb3J0IDAwMDA6MDA6MDAuMDogc2F2aW5nIGNvbmZpZyBzcGFjZSBhdCBvZmZzZXQKPj4+
IDB4MTggKHJlYWRpbmcgMHhmZjAxMDApCj4+PiBbICAgIDYuNzU3MDczXSBwY2llcG9ydCAwMDAw
OjAwOjAwLjA6IHNhdmluZyBjb25maWcgc3BhY2UgYXQgb2Zmc2V0Cj4+PiAweDFjIChyZWFkaW5n
IDB4MjAwMDEwMTApCj4+PiBbICAgIDYuNzU3ODc4XSBwY2llcG9ydCAwMDAwOjAwOjAwLjA6IHNh
dmluZyBjb25maWcgc3BhY2UgYXQgb2Zmc2V0Cj4+PiAweDIwIChyZWFkaW5nIDB4OTAwMDkwKQo+
Pj4gWyAgICA2Ljc1ODYxNF0gcGNpZXBvcnQgMDAwMDowMDowMC4wOiBzYXZpbmcgY29uZmlnIHNw
YWNlIGF0IG9mZnNldAo+Pj4gMHgyNCAocmVhZGluZyAweDFmZjExMDAxKQo+Pj4gWyAgICA2Ljc1
OTM2MV0gcGNpZXBvcnQgMDAwMDowMDowMC4wOiBzYXZpbmcgY29uZmlnIHNwYWNlIGF0IG9mZnNl
dAo+Pj4gMHgyOCAocmVhZGluZyAweDApCj4+PiBbICAgIDYuNzYwMDU3XSBwY2llcG9ydCAwMDAw
OjAwOjAwLjA6IHNhdmluZyBjb25maWcgc3BhY2UgYXQgb2Zmc2V0Cj4+PiAweDJjIChyZWFkaW5n
IDB4MCkKPj4+IFsgICAgNi43NjA3NTJdIHBjaWVwb3J0IDAwMDA6MDA6MDAuMDogc2F2aW5nIGNv
bmZpZyBzcGFjZSBhdCBvZmZzZXQKPj4+IDB4MzAgKHJlYWRpbmcgMHgwKQo+Pj4gWyAgICA2Ljc2
MTUwMV0gcGNpZXBvcnQgMDAwMDowMDowMC4wOiBzYXZpbmcgY29uZmlnIHNwYWNlIGF0IG9mZnNl
dAo+Pj4gMHgzNCAocmVhZGluZyAweDQwKQo+Pj4gWyAgICA2Ljc2MjIwNl0gcGNpZXBvcnQgMDAw
MDowMDowMC4wOiBzYXZpbmcgY29uZmlnIHNwYWNlIGF0IG9mZnNldAo+Pj4gMHgzOCAocmVhZGlu
ZyAweDApCj4+PiBbICAgIDYuNzYyOTAyXSBwY2llcG9ydCAwMDAwOjAwOjAwLjA6IHNhdmluZyBj
b25maWcgc3BhY2UgYXQgb2Zmc2V0Cj4+PiAweDNjIChyZWFkaW5nIDB4MjAxNWYpCj4+PiBbICAg
IDYuNzY0MzUwXSByYWRlb24gMDAwMDowMTowMC4wOiBhc3NpZ24gSVJROiBnb3QgOTUKPj4+IFsg
ICAgNi43NjYyMTJdIHJhZGVvbiAwMDAwOjAxOjAwLjA6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAt
PiAwMDAzKQo+Pj4gWyAgICA2Ljc2NjkxMV0gW2RybTpkcm1fbWlub3JfcmVnaXN0ZXJdCj4+PiBb
ICAgIDYuNzcwMDUxXSBbZHJtOmRybV9taW5vcl9yZWdpc3Rlcl0gbmV3IG1pbm9yIHJlZ2lzdGVy
ZWQgMTI4Cj4+PiBbICAgIDYuNzcwNjA2XSBbZHJtOmRybV9taW5vcl9yZWdpc3Rlcl0KPj4+IFsg
ICAgNi43NzE5NThdIFtkcm06ZHJtX21pbm9yX3JlZ2lzdGVyXSBuZXcgbWlub3IgcmVnaXN0ZXJl
ZCAwCj4+PiBbICAgIDYuNzcyNjQwXSBbZHJtXSBpbml0aWFsaXppbmcga2VybmVsIG1vZGVzZXR0
aW5nIChUVVJLUwo+Pj4gMHgxMDAyOjB4Njc1RCAweDEwMjg6MHgyQjIwIDB4MDApLgo+Pj4gWyAg
ICA3LjAyOTI1MV0gW2RybTpyYWRlb25fZ2V0X2Jpb3NdIEFUT01CSU9TIGRldGVjdGVkCj4+PiBb
ICAgIDcuMDI5ODE0XSBBVE9NIEJJT1M6IFRVUktTCj4+PiBbICAgIDcuMDMwMTAwXSBbZHJtOmF0
b21fYWxsb2NhdGVfZmJfc2NyYXRjaF0gYXRvbSBmaXJtd2FyZSByZXF1ZXN0ZWQKPj4+IDAwMDAw
MDAwIDBrYgo+Pj4gWyAgICA3LjAzMDkwMV0gW2RybV0gR1BVIG5vdCBwb3N0ZWQuIHBvc3Rpbmcg
bm93Li4uCj4+PiBbICAgIDcuMDM3NTc1XSByYWRlb24gMDAwMDowMTowMC4wOiBWUkFNOiAxMDI0
TSAweDAwMDAwMDAwMDAwMDAwMDAgLQo+Pj4gMHgwMDAwMDAwMDNGRkZGRkZGICgxMDI0TSB1c2Vk
KQo+Pj4gWyAgICA3LjAzODM4OF0gcmFkZW9uIDAwMDA6MDE6MDAuMDogR1RUOiAxMDI0TSAweDAw
MDAwMDAwNDAwMDAwMDAgLQo+Pj4gMHgwMDAwMDAwMDdGRkZGRkZGCj4+PiBbICAgIDcuMDM5MDgy
XSBbZHJtXSBEZXRlY3RlZCBWUkFNIFJBTT0xMDI0TSwgQkFSPTI1Nk0KPj4+IFsgICAgNy4wMzk1
MzNdIFtkcm1dIFJBTSB3aWR0aCAxMjhiaXRzIEREUgo+Pj4gWyAgICA3LjA0MDk3NV0gW2RybV0g
cmFkZW9uOiAxMDI0TSBvZiBWUkFNIG1lbW9yeSByZWFkeQo+Pj4gWyAgICA3LjA0MTU0M10gW2Ry
bV0gcmFkZW9uOiAxMDI0TSBvZiBHVFQgbWVtb3J5IHJlYWR5Lgo+Pj4gWyAgICA3LjA0MjI4OV0g
W2RybTpuaV9pbml0X21pY3JvY29kZV0KPj4+IFsgICAgNy4wNDI2MzldIFtkcm1dIExvYWRpbmcg
VFVSS1MgTWljcm9jb2RlCj4+PiBbICAgIDcuMDQzMDQ3XSBbZHJtXSBJbnRlcm5hbCB0aGVybWFs
IGNvbnRyb2xsZXIgd2l0aCBmYW4gY29udHJvbAo+Pj4gWyAgICA3LjA1OTcxM10gW2RybV0gcmFk
ZW9uOiBkcG0gaW5pdGlhbGl6ZWQKPj4+IFsgICAgNy4wNjAzNzVdIFtkcm1dIEdBUlQ6IG51bSBj
cHUgcGFnZXMgMjYyMTQ0LCBudW0gZ3B1IHBhZ2VzIDI2MjE0NAo+Pj4gWyAgICA3LjA2OTQ1N10g
W2RybV0gZW5hYmxpbmcgUENJRSBnZW4gMiBsaW5rIHNwZWVkcywgZGlzYWJsZSB3aXRoCj4+PiBy
YWRlb24ucGNpZV9nZW4yPTAKPj4+IFsgICAgNy4xNjc5MDFdIFtkcm1dIFBDSUUgR0FSVCBvZiAx
MDI0TSBlbmFibGVkICh0YWJsZSBhdCAweDAwMDAwMDAwMDAxNjIwMDApLgo+Pj4gWyAgICA3LjE2
OTI1N10gcmFkZW9uIDAwMDA6MDE6MDAuMDogV0IgZW5hYmxlZAo+Pj4gWyAgICA3LjE2OTc3MF0g
cmFkZW9uIDAwMDA6MDE6MDAuMDogZmVuY2UgZHJpdmVyIG9uIHJpbmcgMCB1c2UgZ3B1Cj4+PiBh
ZGRyIDB4MDAwMDAwMDA0MDAwMGMwMAo+Pj4gWyAgICA3LjE3MDQ5Nl0gcmFkZW9uIDAwMDA6MDE6
MDAuMDogZmVuY2UgZHJpdmVyIG9uIHJpbmcgMyB1c2UgZ3B1Cj4+PiBhZGRyIDB4MDAwMDAwMDA0
MDAwMGMwYwo+Pj4gWyAgICA3LjE3NzYzNl0gcmFkZW9uIDAwMDA6MDE6MDAuMDogZmVuY2UgZHJp
dmVyIG9uIHJpbmcgNSB1c2UgZ3B1Cj4+PiBhZGRyIDB4MDAwMDAwMDAwMDA3MjExOAo+Pj4gWyAg
ICA3LjE4MjM2NV0gcmFkZW9uIDAwMDA6MDE6MDAuMDogcmFkZW9uOiBNU0kgbGltaXRlZCB0byAz
Mi1iaXQKPj4+IFsgICAgNy4xODQxMDVdIHJhZGVvbiAwMDAwOjAxOjAwLjA6IHJhZGVvbjogdXNp
bmcgTVNJLgo+Pj4gWyAgICA3LjE4NDU3MV0gW2RybTpkcm1faXJxX2luc3RhbGxdIGlycT05Nwo+
Pj4gWyAgICA3LjE4NTYxOV0gW2RybV0gcmFkZW9uOiBpcnEgaW5pdGlhbGl6ZWQuCj4+PiBbICAg
IDcuMTg2Nzk1XSByYWRlb24gMDAwMDowMTowMC4wOiBlbmFibGluZyBidXMgbWFzdGVyaW5nCj4+
PiBbICAgIDcuMTg3MzQ2XSBbZHJtOmV2ZXJncmVlbl9pcnFfcHJvY2Vzc10gZXZlcmdyZWVuX2ly
cV9wcm9jZXNzCj4+PiBzdGFydDogcnB0ciAwLCB3cHRyIDk2Cj4+PiBbICAgIDcuMTg4MTE4XSBb
ZHJtOmV2ZXJncmVlbl9pcnFfcHJvY2Vzc10gSUg6IEQxIGZsaXAKPj4+IFsgICAgNy4xODg1NjNd
IFtkcm06ZXZlcmdyZWVuX2lycV9wcm9jZXNzXSBJSDogRDIgZmxpcAo+Pj4gWyAgICA3LjE4OTAw
Nl0gW2RybTpldmVyZ3JlZW5faXJxX3Byb2Nlc3NdIElIOiBEMyBmbGlwCj4+PiBbICAgIDcuMTg5
NDUwXSBbZHJtOmV2ZXJncmVlbl9pcnFfcHJvY2Vzc10gSUg6IEQ0IGZsaXAKPj4+IFsgICAgNy4x
ODk4OTRdIFtkcm06ZXZlcmdyZWVuX2lycV9wcm9jZXNzXSBJSDogRDUgZmxpcAo+Pj4gWyAgICA3
LjE5MDMzN10gW2RybTpldmVyZ3JlZW5faXJxX3Byb2Nlc3NdIElIOiBENiBmbGlwCj4+PiBbICAg
IDcuMTkwODExXSBbZHJtOmV2ZXJncmVlbl9pcnFfcHJvY2Vzc10gZXZlcmdyZWVuX2lycV9wcm9j
ZXNzCj4+PiBzdGFydDogcnB0ciA5Niwgd3B0ciA5Ngo+Pj4gWyAgICA3LjUzMDc1M10gW2RybTpy
NjAwX3JpbmdfdGVzdF0gKkVSUk9SKiByYWRlb246IHJpbmcgMCB0ZXN0IGZhaWxlZAo+Pj4gKHNj
cmF0Y2goMHg4NTA0KT0weENBRkVERUFEKQo+Pj4gWyAgICA3LjUzMTU2NF0gcmFkZW9uIDAwMDA6
MDE6MDAuMDogZGlzYWJsaW5nIEdQVSBhY2NlbGVyYXRpb24KPj4+IFsgICAgNy41MzM5NjFdIFtk
cm06ZHJtX2lycV91bmluc3RhbGxdIGlycT05Nwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4Cg==

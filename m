Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D6F3748
	for <lists+amd-gfx@lfdr.de>; Thu,  7 Nov 2019 19:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC156F781;
	Thu,  7 Nov 2019 18:32:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859866F781
 for <amd-gfx@lists.freedesktop.org>; Thu,  7 Nov 2019 18:32:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a15so4175457wrf.9
 for <amd-gfx@lists.freedesktop.org>; Thu, 07 Nov 2019 10:32:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2sqm7OwVqWVgtHZtTOs0rsjvYjIvEBHQg/T+MlzKU5Y=;
 b=LDfNQeV+VcUteRgwSDGAKCRoJoG4RbArhhtg0GHnNb4mkgIYVupB0KgGCRP3VM+f88
 N69ZgQ1npGlWGzeN42tind8U6/3PKrZZtoWBO2RkCg00qTcuEBAunPS/iKuQnTIOXRZ6
 cJS+xWWSDj70QZKswhJ1WvHoDNa6gZUzehSMZvyjVFq6q/QMcRqH1EK88hFoal0QDVoT
 qmy7ovO4z09d8Wn24lsEW0zYYWobxTVD32+p81zCQlKdrK6RkDLUk3UYzyj8VKhRnjBq
 YQ/zoHodIANlu07RyBQt7U0F1TII3JDM7QzDizxmgj/xiUt32EkJ7lobSOxiFqnBoXPL
 4z3A==
X-Gm-Message-State: APjAAAWcyJJVXOIAIIxeU0mCebvaoXKBmryIfDPSX8GiA8HwQLcMapkj
 4fdHHV7fcSBA0tJSi1DNY8ZNuvFlroi7W6knVnc=
X-Google-Smtp-Source: APXvYqy9jx4eXDDrlb/3TqZbPYIH9rWGvKQCLN2TW7i1gvA+1xWhO7pUapHO9F6ULHoKWXvbefQxAB5phyxWpz3k2SQ=
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr4470803wrw.206.1573151544974; 
 Thu, 07 Nov 2019 10:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20191031001739.10764-1-Yong.Zhao@amd.com>
 <20191031001739.10764-2-Yong.Zhao@amd.com>
 <31102345-20f7-1b0e-dd2a-f7984b253a07@amd.com>
 <DM6PR12MB2778C141CFEA0006DA2CEC6DF0780@DM6PR12MB2778.namprd12.prod.outlook.com>
 <CY4PR1201MB2533087B346C4619F461FF3185780@CY4PR1201MB2533.namprd12.prod.outlook.com>
 <41a6b535-ab7a-44f4-2899-f211f5ddc296@amd.com>
 <85fd399c-5fa9-bdef-cdf6-433e80ba6407@amd.com>
In-Reply-To: <85fd399c-5fa9-bdef-cdf6-433e80ba6407@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Nov 2019 13:32:12 -0500
Message-ID: <CADnq5_Og4AWKdYFpa8hvmd2XXjr1Wzb_a26gqsq1H6c7NkWmMA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/amdkfd: only keep release_mem function for Hawaii
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2sqm7OwVqWVgtHZtTOs0rsjvYjIvEBHQg/T+MlzKU5Y=;
 b=LpjsZVmqTjzoy3lAnCZvSKWwQHNerxpAJNmKvVQvFpWKc5LqeNpp9GTQuL8p/l//IU
 oKauWVfykQ938+hqw7e4Moe4Z+h0daSha44FbhKLthDw3HJLR9gQBZsgSFIqnMaR2u7w
 2BdCeBnNL0o67ezprgzL4bllN+XnVgOyGx02vpPQ5gHJ3tlzO8sr4d7OedVRoZLmbPfc
 QCBPab7nsFbzXI9N0delrYgZmKYCt+Df3xwPgD396ZQzu6hnpRoyrKcAYdMpRf3lHRhq
 MGtPiUBv2iyrIn1uMWwEUmS6yeeHJ5L5nx+hoOjlGXz55F7UI6yEmHvd7x7YzBIhCuFL
 3LXg==
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>, "Russell, Kent" <Kent.Russell@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgNywgMjAxOSBhdCAxMjo0NyBQTSBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4gTm8sIHBsZWFzZSBsZXRzIG5vdCBhZGQgYSBuZXcg
bm9tZW5jbGF0dXJlIGZvciBQTTQgcGFja2V0IHZlcnNpb25zLiBHRlggdmVyc2lvbnMgYXJlIGFn
cmVlZCBvbiBiZXR3ZWVuIGhhcmR3YXJlLCBmaXJtd2FyZSwgYW5kIHNvZnR3YXJlIGFuZCBpdCdz
IGdlbmVyYWxseSB1bmRlcnN0b29kIHdoYXQgdGhleSBtZWFuLiBJZiB3ZSBhZGQgYSBuZXcgUE00
IHBhY2tldCB2ZXJzaW9uaW5nIHNjaGVtZSBvbiBvdXIgb3duLCB0aGVuIHRoaXMgd2lsbCBhZGQg
YSBsb3Qgb2YgY29uZnVzaW9uIHdoZW4gdGFsa2luZyB0byBmaXJtd2FyZSB0ZWFtcy4KPgo+IFlv
dSBrbm93LCB0aGlzIHdvdWxkIGFsbCBiZSBtb3JlIHN0cmFpZ2h0IGZvcndhcmQgaWYgd2UgYWNj
ZXB0ZWQgYSBsaXR0bGUgYml0IG9mIGNvZGUgZHVwbGljYXRpb24gYW5kIGhhZCBwYWNrZXQgd3Jp
dGluZyBmdW5jdGlvbnMgcGVyIEdGWCB2ZXJzaW9uLiBZb3UnbGwgc2VlIHRoaXMgcGF0dGVybiBh
IGxvdCBpbiB0aGUgYW1kZ3B1IGRyaXZlciB3aGVyZSBlYWNoIElQIHZlcnNpb24gZHVwbGljYXRl
cyBhIGJ1bmNoIG9mIGNvZGUuIEluIG1hbnkgY2FzZXMgeW91IG1heSBiZSBhYmxlIHRvIHNhdmUg
YSBmZXcgbGluZXMgb2YgY29kZSBieSBzaGFyaW5nIGZ1bmN0aW9ucyBiZXR3ZWVuIElQIHZlcnNp
b25zLiBCdXQgeW91J2xsIGFkZCBzb21lIGNvbmZ1c2lvbiBhbmQgYnVyZGVuIG9uIGZ1dHVyZSBt
YWludGVuYW5jZS4KPgo+IFRoaXMgaXMgdGhlIHByaWNlIHdlIHBheSBmb3IgbWljcm8tb3B0aW1p
emluZyBtaW5vciBjb2RlIGR1cGxpY2F0aW9uLgoKV2hhdCB3ZSd2ZSB0cmllZCB0byBkbyBpbiBh
bWRncHUgaXMgdG8gYnJlYWsgb3V0IHNoYXJlZCBjb2RlIGluIHRvCmNvbW1vbiBoZWxwZXJzIHRo
YXQgYXJlIG5vdCBJUCBzcGVjaWZpYyBhbmQgdXNlIHRoYXQgaW4gZWFjaCBJUCBtb2R1bGUKKGUu
Zy4sIGFtZGdwdV91dmQuYyBhbWRncHVfZ2Z4LmMsIGV0Yy4pLiAgU29tZXRpbWVzIHdlIGNhbiB1
c2UgYQpwYXJ0aWN1bGFyIGNodW5rIG9mIGNvZGUgYWNyb3NzIG11bHRpcGxlIGdlbmVyYXRpb25z
LiAgRS5nLiwgdGhlIHV2ZApzdHVmZiBpcyBhIGdvb2QgZXhhbXBsZS4gIFdlIGhhdmUgc2hhcmVk
IGdlbmVyaWMgdXZkIGhlbHBlcnMgdGhhdCB3b3JrCmZvciBtb3N0IFVWRCBJUCB2ZXJzaW9ucywg
YW5kIHRoZW4gaWYgd2UgbmVlZCBhbiBJUCBzcGVjaWZpYyB2ZXJzaW9uLAp3ZSBvdmVycmlkZSB0
aGF0IGluIHRoZSBjYWxsYmFja3Mgd2l0aCBhIHZlcnNpb24gc3BlY2lmaWMgb25lLiAgRS5nLiwK
Zm9yIHRoZSB2aWRlbyBkZWNvZGUgZW5naW5lcyB3ZSB1c2UgdGhlIGdlbmVyaWMgaGVscGVycyBm
b3IgYSBudW1iZXIKb2YgcmluZyBmdW5jdGlvbnM6CgpzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdw
dV9yaW5nX2Z1bmNzIHV2ZF92N18wX3Jpbmdfdm1fZnVuY3MgPSB7Ci4uLgogICAgLnRlc3Rfcmlu
ZyA9IHV2ZF92N18wX3JpbmdfdGVzdF9yaW5nLAogICAgICAgIC50ZXN0X2liID0gYW1kZ3B1X3V2
ZF9yaW5nX3Rlc3RfaWIsCiAgICAgICAgLmluc2VydF9ub3AgPSB1dmRfdjdfMF9yaW5nX2luc2Vy
dF9ub3AsCiAgICAgICAgLnBhZF9pYiA9IGFtZGdwdV9yaW5nX2dlbmVyaWNfcGFkX2liLAogICAg
ICAgIC5iZWdpbl91c2UgPSBhbWRncHVfdXZkX3JpbmdfYmVnaW5fdXNlLAogICAgICAgIC5lbmRf
dXNlID0gYW1kZ3B1X3V2ZF9yaW5nX2VuZF91c2UsCi4uLgp9OwoKd2hpbGUgd2Ugb3ZlcnJpZGUg
bW9yZSBvZiB0aGVtIGZvciB0aGUgdmlkZW8gZW5jb2RlIGVuZ2luZXM6CgpzdGF0aWMgY29uc3Qg
c3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzIHV2ZF92N18wX2VuY19yaW5nX3ZtX2Z1bmNzID0gewou
Li4KICAgIC50ZXN0X3JpbmcgPSB1dmRfdjdfMF9lbmNfcmluZ190ZXN0X3JpbmcsCiAgICAgICAg
LnRlc3RfaWIgPSB1dmRfdjdfMF9lbmNfcmluZ190ZXN0X2liLAogICAgICAgIC5pbnNlcnRfbm9w
ID0gYW1kZ3B1X3JpbmdfaW5zZXJ0X25vcCwKICAgIC5pbnNlcnRfZW5kID0gdXZkX3Y3XzBfZW5j
X3JpbmdfaW5zZXJ0X2VuZCwKICAgICAgICAucGFkX2liID0gYW1kZ3B1X3JpbmdfZ2VuZXJpY19w
YWRfaWIsCiAgICAgICAgLmJlZ2luX3VzZSA9IGFtZGdwdV91dmRfcmluZ19iZWdpbl91c2UsCiAg
ICAgICAgLmVuZF91c2UgPSBhbWRncHVfdXZkX3JpbmdfZW5kX3VzZSwKLi4uCn07CgpCdXQgc3Rp
bGwgbWFpbnRhaW4gSVAgc3BlY2lmaWMgY29tcG9uZW50cy4KCkFsZXgKCj4KPiBSZWdhcmRzLAo+
ICAgRmVsaXgKPgo+IE9uIDIwMTktMTEtMDcgMTI6MzksIFpoYW8sIFlvbmcgd3JvdGU6Cj4KPiBI
aSBLZW50LAo+Cj4gSSBjYW4ndCBhZ3JlZSBtb3JlIG9uIHRoaXMuIEFsc28sIHRoZSBzYW1lIGFw
cGxpZXMgdG8gdGhlIGZpbGUgbmFtZXMuIERlZmluaXRlbHkgd2UgbmVlZCB0byBhZ3JlZSBvbiB0
aGUgbmFtaW5nIHNjaGVtZSBiZWZvcmUgbWFraW5nIGl0IGhhcHBlbi4KPgo+IFlvbmcKPgo+IE9u
IDIwMTktMTEtMDcgMTI6MzMgcC5tLiwgUnVzc2VsbCwgS2VudCB3cm90ZToKPgo+IEkgdGhpbmsg
dGhhdCB0aGUgdmVyc2lvbmluZyBpcyBnZXR0aW5nIGEgbGl0dGxlIGNvbmZ1c2luZyBzaW5jZSB3
ZeKAmXJlIHVzaW5nIHRoZSBvbGQgR0ZYIHZlcnNpb25zLCBidXQgbm90IHJlYWxseSBzdGlja2lu
ZyB0byBpdCBkdWUgdG8gdGhlIHNoYXJlYWJpbGl0eSBvZiBjZXJ0YWluIG1hbmFnZXJzIGFuZCBz
aGFkZXJzLiBDb3VsZCB3ZSBsb29rIGludG8gZG9pbmcgc29tZXRoaW5nIGxpa2UgZ2VuMSBvciBn
ZW4yLCBvciBzb21lIG90aGVyIG1vcmUgYW1iaWd1b3VzIG5vbi1HRlgtcmVsYXRlZCB2ZXJzaW9u
aW5nPyBPdGhlcndpc2Ugd2XigJlsbCBrZWVwIGhhdmluZyB0aGVzZSBxdWVzdGlvbnMgb2Yg4oCc
d2h5IGlzIEhhd2FpaSBHRlg44oCdLCDigJx3aHkgaXMgQXJjdHVydXMgR0ZYOeKAnSwgZXRjLiBU
aGVuIGlmIHRoaW5ncyBjaGFuZ2UsIHdlIGp1c3QgdXAgdGhlIHZhbHVlIGNvbmNyZXRlbHksIGlu
c3RlYWQgb2YgbWF5YmUgZG9pbmcgYSB2MTEgaWYgR0ZYMTEgY2hhbmdlcyB0aGluZ3MsIGFuZCBv
bmx5IEdGWDExIEFTSUNzIHVzZSB0aG9zZSBmdW5jdGlvbnMvdmFyaWFibGVzLgo+Cj4KPgo+IE9i
dmlvdXNseSBub3QgaGlnaC1wcmlvcml0eSwgYnV0IG1heWJlIHNvbWV0aGluZyB0byBjb25zaWRl
ciBhcyB5b3UgY29udGludWUgdG8gY29uc29saWRhdGUgYW5kIHJlbW92ZSBkdXBsaWNhdGUgY29k
ZS4KPgo+Cj4KPiBLZW50Cj4KPgo+Cj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFpoYW8sIFlvbmcKPiBTZW50OiBUaHVy
c2RheSwgTm92ZW1iZXIgNywgMjAxOSAxMTo1NyBBTQo+IFRvOiBLdWVobGluZywgRmVsaXggPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSBkcm0vYW1ka2ZkOiBvbmx5IGtlZXAgcmVsZWFzZV9tZW0g
ZnVuY3Rpb24gZm9yIEhhd2FpaQo+Cj4KPgo+IEhpIEZlbGl4LAo+Cj4KPgo+IFRoYXQncyBiZWNh
dXNlIHY4IGFuZCB2NyBzaGFyZSB0aGUgc2FtZSBwYWNrZXRfbWFuYWdlcl9mdW5jcy4gSW4gdGhp
cyBjYXNlLCBpdCBpcyBiZXR0ZXIgdG8ga2VlcCBpdCBhcyBpdCBpcy4KPgo+Cj4KPiBSZWdhcmRz
LAo+Cj4gWW9uZwo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPgo+IEZyb206
IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiBTZW50OiBXZWRuZXNk
YXksIE5vdmVtYmVyIDYsIDIwMTkgMTE6NDUgUE0KPiBUbzogWmhhbywgWW9uZyA8WW9uZy5aaGFv
QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8YW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIGRybS9hbWRrZmQ6IG9u
bHkga2VlcCByZWxlYXNlX21lbSBmdW5jdGlvbiBmb3IgSGF3YWlpCj4KPgo+Cj4gT24gMjAxOS0x
MC0zMCAyMDoxNywgWmhhbywgWW9uZyB3cm90ZToKPiA+IHJlbGVhc2VfbWVtIHdvbid0IGJlIHVz
ZWQgYXQgYWxsIG9uIEdGWDkgYW5kIEdGWDEwLCBzbyBkZWxldGUgaXQuCj4KPiBIYXdhaWkgd2Fz
IEdGWHY3LiBTbyB3ZSdyZSBub3QgdXNpbmcgdGhlIHJlbGVhc2VfbWVtIHBhY2tldCBvbiBHRlh2
OAo+IGVpdGhlci4gV2h5IGFyYml0cmFyaWx5IGxpbWl0IHRoaXMgY2hhbmdlIHRvIEdGWHY5IGFu
ZCAxMD8KPgo+IFJlZ2FyZHMsCj4gICAgRmVsaXgKPgo+ID4KPiA+IENoYW5nZS1JZDogSTEzNzg3
YThhMjliODNlNzUxNmM1ODJhNzQwMWYyZTE0NzIxZWRmNWYKPiA+IFNpZ25lZC1vZmYtYnk6IFlv
bmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+Cj4gPiAtLS0KPiA+ICAgLi4uL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlX3YxMC5jIHwgMzUgKystLS0tLS0tLS0tLS0tLS0tLQo+
ID4gICAuLi4vZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjkuYyAgfCAzMyAr
Ky0tLS0tLS0tLS0tLS0tLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NjQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfa2VybmVsX3F1ZXVlX3YxMC5jCj4gPiBpbmRleCBhZWQzMmFiNzEwMmUuLmJmZDYyMjFh
Y2FlOSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJu
ZWxfcXVldWVfdjEwLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9r
ZXJuZWxfcXVldWVfdjEwLmMKPiA+IEBAIC0yOTgsMzcgKzI5OCw2IEBAIHN0YXRpYyBpbnQgcG1f
cXVlcnlfc3RhdHVzX3YxMChzdHJ1Y3QgcGFja2V0X21hbmFnZXIgKnBtLCB1aW50MzJfdCAqYnVm
ZmVyLAo+ID4gICAgICAgIHJldHVybiAwOwo+ID4gICB9Cj4gPgo+ID4gLQo+ID4gLXN0YXRpYyBp
bnQgcG1fcmVsZWFzZV9tZW1fdjEwKHVpbnQ2NF90IGdwdV9hZGRyLCB1aW50MzJfdCAqYnVmZmVy
KQo+ID4gLXsKPiA+IC0gICAgIHN0cnVjdCBwbTRfbWVjX3JlbGVhc2VfbWVtICpwYWNrZXQ7Cj4g
PiAtCj4gPiAtICAgICBXQVJOX09OKCFidWZmZXIpOwo+ID4gLQo+ID4gLSAgICAgcGFja2V0ID0g
KHN0cnVjdCBwbTRfbWVjX3JlbGVhc2VfbWVtICopYnVmZmVyOwo+ID4gLSAgICAgbWVtc2V0KGJ1
ZmZlciwgMCwgc2l6ZW9mKHN0cnVjdCBwbTRfbWVjX3JlbGVhc2VfbWVtKSk7Cj4gPiAtCj4gPiAt
ICAgICBwYWNrZXQtPmhlYWRlci51MzJBbGwgPSBwbV9idWlsZF9wbTRfaGVhZGVyKElUX1JFTEVB
U0VfTUVNLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yo
c3RydWN0IHBtNF9tZWNfcmVsZWFzZV9tZW0pKTsKPiA+IC0KPiA+IC0gICAgIHBhY2tldC0+Yml0
ZmllbGRzMi5ldmVudF90eXBlID0gQ0FDSEVfRkxVU0hfQU5EX0lOVl9UU19FVkVOVDsKPiA+IC0g
ICAgIHBhY2tldC0+Yml0ZmllbGRzMi5ldmVudF9pbmRleCA9IGV2ZW50X2luZGV4X19tZWNfcmVs
ZWFzZV9tZW1fX2VuZF9vZl9waXBlOwo+ID4gLSAgICAgcGFja2V0LT5iaXRmaWVsZHMyLnRjbDFf
YWN0aW9uX2VuYSA9IDE7Cj4gPiAtICAgICBwYWNrZXQtPmJpdGZpZWxkczIudGNfYWN0aW9uX2Vu
YSA9IDE7Cj4gPiAtICAgICBwYWNrZXQtPmJpdGZpZWxkczIuY2FjaGVfcG9saWN5ID0gY2FjaGVf
cG9saWN5X19tZWNfcmVsZWFzZV9tZW1fX2xydTsKPiA+IC0KPiA+IC0gICAgIHBhY2tldC0+Yml0
ZmllbGRzMy5kYXRhX3NlbCA9IGRhdGFfc2VsX19tZWNfcmVsZWFzZV9tZW1fX3NlbmRfMzJfYml0
X2xvdzsKPiA+IC0gICAgIHBhY2tldC0+Yml0ZmllbGRzMy5pbnRfc2VsID0KPiA+IC0gICAgICAg
ICAgICAgaW50X3NlbF9fbWVjX3JlbGVhc2VfbWVtX19zZW5kX2ludGVycnVwdF9hZnRlcl93cml0
ZV9jb25maXJtOwo+ID4gLQo+ID4gLSAgICAgcGFja2V0LT5iaXRmaWVsZHM0LmFkZHJlc3NfbG9f
MzJiID0gKGdwdV9hZGRyICYgMHhmZmZmZmZmZikgPj4gMjsKPiA+IC0gICAgIHBhY2tldC0+YWRk
cmVzc19oaSA9IHVwcGVyXzMyX2JpdHMoZ3B1X2FkZHIpOwo+ID4gLQo+ID4gLSAgICAgcGFja2V0
LT5kYXRhX2xvID0gMDsKPiA+IC0KPiA+IC0gICAgIHJldHVybiBzaXplb2Yoc3RydWN0IHBtNF9t
ZWNfcmVsZWFzZV9tZW0pIC8gc2l6ZW9mKHVuc2lnbmVkIGludCk7Cj4gPiAtfQo+ID4gLQo+ID4g
ICBjb25zdCBzdHJ1Y3QgcGFja2V0X21hbmFnZXJfZnVuY3Mga2ZkX3YxMF9wbV9mdW5jcyA9IHsK
PiA+ICAgICAgICAubWFwX3Byb2Nlc3MgICAgICAgICAgICAgICAgICAgID0gcG1fbWFwX3Byb2Nl
c3NfdjEwLAo+ID4gICAgICAgIC5ydW5saXN0ICAgICAgICAgICAgICAgICAgICAgICAgPSBwbV9y
dW5saXN0X3YxMCwKPiA+IEBAIC0zMzYsMTMgKzMwNSwxMyBAQCBjb25zdCBzdHJ1Y3QgcGFja2V0
X21hbmFnZXJfZnVuY3Mga2ZkX3YxMF9wbV9mdW5jcyA9IHsKPiA+ICAgICAgICAubWFwX3F1ZXVl
cyAgICAgICAgICAgICAgICAgICAgID0gcG1fbWFwX3F1ZXVlc192MTAsCj4gPiAgICAgICAgLnVu
bWFwX3F1ZXVlcyAgICAgICAgICAgICAgICAgICA9IHBtX3VubWFwX3F1ZXVlc192MTAsCj4gPiAg
ICAgICAgLnF1ZXJ5X3N0YXR1cyAgICAgICAgICAgICAgICAgICA9IHBtX3F1ZXJ5X3N0YXR1c192
MTAsCj4gPiAtICAgICAucmVsZWFzZV9tZW0gICAgICAgICAgICAgICAgICAgID0gcG1fcmVsZWFz
ZV9tZW1fdjEwLAo+ID4gKyAgICAgLnJlbGVhc2VfbWVtICAgICAgICAgICAgICAgICAgICA9IE5V
TEwsCj4gPiAgICAgICAgLm1hcF9wcm9jZXNzX3NpemUgICAgICAgICAgICAgICA9IHNpemVvZihz
dHJ1Y3QgcG00X21lc19tYXBfcHJvY2VzcyksCj4gPiAgICAgICAgLnJ1bmxpc3Rfc2l6ZSAgICAg
ICAgICAgICAgICAgICA9IHNpemVvZihzdHJ1Y3QgcG00X21lc19ydW5saXN0KSwKPiA+ICAgICAg
ICAuc2V0X3Jlc291cmNlc19zaXplICAgICAgICAgICAgID0gc2l6ZW9mKHN0cnVjdCBwbTRfbWVz
X3NldF9yZXNvdXJjZXMpLAo+ID4gICAgICAgIC5tYXBfcXVldWVzX3NpemUgICAgICAgICAgICAg
ICAgPSBzaXplb2Yoc3RydWN0IHBtNF9tZXNfbWFwX3F1ZXVlcyksCj4gPiAgICAgICAgLnVubWFw
X3F1ZXVlc19zaXplICAgICAgICAgICAgICA9IHNpemVvZihzdHJ1Y3QgcG00X21lc191bm1hcF9x
dWV1ZXMpLAo+ID4gICAgICAgIC5xdWVyeV9zdGF0dXNfc2l6ZSAgICAgICAgICAgICAgPSBzaXpl
b2Yoc3RydWN0IHBtNF9tZXNfcXVlcnlfc3RhdHVzKSwKPiA+IC0gICAgIC5yZWxlYXNlX21lbV9z
aXplICAgICAgICAgICAgICAgPSBzaXplb2Yoc3RydWN0IHBtNF9tZWNfcmVsZWFzZV9tZW0pCj4g
PiArICAgICAucmVsZWFzZV9tZW1fc2l6ZSAgICAgICAgICAgICAgID0gMCwKPiA+ICAgfTsKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9x
dWV1ZV92OS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZV92
OS5jCj4gPiBpbmRleCAzYjVjYTJiMWQ3YTYuLmYwZTQ5MTBhODg2NSAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjkuYwo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZV92OS5jCj4gPiBA
QCAtMzM2LDM1ICszMzYsNiBAQCBzdGF0aWMgaW50IHBtX3F1ZXJ5X3N0YXR1c192OShzdHJ1Y3Qg
cGFja2V0X21hbmFnZXIgKnBtLCB1aW50MzJfdCAqYnVmZmVyLAo+ID4gICAgICAgIHJldHVybiAw
Owo+ID4gICB9Cj4gPgo+ID4gLQo+ID4gLXN0YXRpYyBpbnQgcG1fcmVsZWFzZV9tZW1fdjkodWlu
dDY0X3QgZ3B1X2FkZHIsIHVpbnQzMl90ICpidWZmZXIpCj4gPiAtewo+ID4gLSAgICAgc3RydWN0
IHBtNF9tZWNfcmVsZWFzZV9tZW0gKnBhY2tldDsKPiA+IC0KPiA+IC0gICAgIHBhY2tldCA9IChz
dHJ1Y3QgcG00X21lY19yZWxlYXNlX21lbSAqKWJ1ZmZlcjsKPiA+IC0gICAgIG1lbXNldChidWZm
ZXIsIDAsIHNpemVvZihzdHJ1Y3QgcG00X21lY19yZWxlYXNlX21lbSkpOwo+ID4gLQo+ID4gLSAg
ICAgcGFja2V0LT5oZWFkZXIudTMyQWxsID0gcG1fYnVpbGRfcG00X2hlYWRlcihJVF9SRUxFQVNF
X01FTSwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0
cnVjdCBwbTRfbWVjX3JlbGVhc2VfbWVtKSk7Cj4gPiAtCj4gPiAtICAgICBwYWNrZXQtPmJpdGZp
ZWxkczIuZXZlbnRfdHlwZSA9IENBQ0hFX0ZMVVNIX0FORF9JTlZfVFNfRVZFTlQ7Cj4gPiAtICAg
ICBwYWNrZXQtPmJpdGZpZWxkczIuZXZlbnRfaW5kZXggPSBldmVudF9pbmRleF9fbWVjX3JlbGVh
c2VfbWVtX19lbmRfb2ZfcGlwZTsKPiA+IC0gICAgIHBhY2tldC0+Yml0ZmllbGRzMi50Y2wxX2Fj
dGlvbl9lbmEgPSAxOwo+ID4gLSAgICAgcGFja2V0LT5iaXRmaWVsZHMyLnRjX2FjdGlvbl9lbmEg
PSAxOwo+ID4gLSAgICAgcGFja2V0LT5iaXRmaWVsZHMyLmNhY2hlX3BvbGljeSA9IGNhY2hlX3Bv
bGljeV9fbWVjX3JlbGVhc2VfbWVtX19scnU7Cj4gPiAtCj4gPiAtICAgICBwYWNrZXQtPmJpdGZp
ZWxkczMuZGF0YV9zZWwgPSBkYXRhX3NlbF9fbWVjX3JlbGVhc2VfbWVtX19zZW5kXzMyX2JpdF9s
b3c7Cj4gPiAtICAgICBwYWNrZXQtPmJpdGZpZWxkczMuaW50X3NlbCA9Cj4gPiAtICAgICAgICAg
ICAgIGludF9zZWxfX21lY19yZWxlYXNlX21lbV9fc2VuZF9pbnRlcnJ1cHRfYWZ0ZXJfd3JpdGVf
Y29uZmlybTsKPiA+IC0KPiA+IC0gICAgIHBhY2tldC0+Yml0ZmllbGRzNC5hZGRyZXNzX2xvXzMy
YiA9IChncHVfYWRkciAmIDB4ZmZmZmZmZmYpID4+IDI7Cj4gPiAtICAgICBwYWNrZXQtPmFkZHJl
c3NfaGkgPSB1cHBlcl8zMl9iaXRzKGdwdV9hZGRyKTsKPiA+IC0KPiA+IC0gICAgIHBhY2tldC0+
ZGF0YV9sbyA9IDA7Cj4gPiAtCj4gPiAtICAgICByZXR1cm4gMDsKPiA+IC19Cj4gPiAtCj4gPiAg
IGNvbnN0IHN0cnVjdCBwYWNrZXRfbWFuYWdlcl9mdW5jcyBrZmRfdjlfcG1fZnVuY3MgPSB7Cj4g
PiAgICAgICAgLm1hcF9wcm9jZXNzICAgICAgICAgICAgPSBwbV9tYXBfcHJvY2Vzc192OSwKPiA+
ICAgICAgICAucnVubGlzdCAgICAgICAgICAgICAgICA9IHBtX3J1bmxpc3RfdjksCj4gPiBAQCAt
MzcyLDEyICszNDMsMTIgQEAgY29uc3Qgc3RydWN0IHBhY2tldF9tYW5hZ2VyX2Z1bmNzIGtmZF92
OV9wbV9mdW5jcyA9IHsKPiA+ICAgICAgICAubWFwX3F1ZXVlcyAgICAgICAgICAgICA9IHBtX21h
cF9xdWV1ZXNfdjksCj4gPiAgICAgICAgLnVubWFwX3F1ZXVlcyAgICAgICAgICAgPSBwbV91bm1h
cF9xdWV1ZXNfdjksCj4gPiAgICAgICAgLnF1ZXJ5X3N0YXR1cyAgICAgICAgICAgPSBwbV9xdWVy
eV9zdGF0dXNfdjksCj4gPiAtICAgICAucmVsZWFzZV9tZW0gICAgICAgICAgICA9IHBtX3JlbGVh
c2VfbWVtX3Y5LAo+ID4gKyAgICAgLnJlbGVhc2VfbWVtICAgICAgICAgICAgPSBOVUxMLAo+ID4g
ICAgICAgIC5tYXBfcHJvY2Vzc19zaXplICAgICAgID0gc2l6ZW9mKHN0cnVjdCBwbTRfbWVzX21h
cF9wcm9jZXNzKSwKPiA+ICAgICAgICAucnVubGlzdF9zaXplICAgICAgICAgICA9IHNpemVvZihz
dHJ1Y3QgcG00X21lc19ydW5saXN0KSwKPiA+ICAgICAgICAuc2V0X3Jlc291cmNlc19zaXplICAg
ICA9IHNpemVvZihzdHJ1Y3QgcG00X21lc19zZXRfcmVzb3VyY2VzKSwKPiA+ICAgICAgICAubWFw
X3F1ZXVlc19zaXplICAgICAgICA9IHNpemVvZihzdHJ1Y3QgcG00X21lc19tYXBfcXVldWVzKSwK
PiA+ICAgICAgICAudW5tYXBfcXVldWVzX3NpemUgICAgICA9IHNpemVvZihzdHJ1Y3QgcG00X21l
c191bm1hcF9xdWV1ZXMpLAo+ID4gICAgICAgIC5xdWVyeV9zdGF0dXNfc2l6ZSAgICAgID0gc2l6
ZW9mKHN0cnVjdCBwbTRfbWVzX3F1ZXJ5X3N0YXR1cyksCj4gPiAtICAgICAucmVsZWFzZV9tZW1f
c2l6ZSAgICAgICA9IHNpemVvZihzdHJ1Y3QgcG00X21lY19yZWxlYXNlX21lbSkKPiA+ICsgICAg
IC5yZWxlYXNlX21lbV9zaXplICAgICAgID0gMCwKPiA+ICAgfTsKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QK
PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=

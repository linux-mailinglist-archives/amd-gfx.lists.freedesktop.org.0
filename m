Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2295330D586
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Feb 2021 09:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC906EA1A;
	Wed,  3 Feb 2021 08:48:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555ED6E9DC
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Feb 2021 08:48:52 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id d7so22659283otf.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Feb 2021 00:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VwNp0a42H2HJdUXf2U+NyyGMLQI597ulmFnoEoIfRg8=;
 b=bp4qJgQbbTLWXuU91TsSZAOI41pytifc2W9dIiVN6dXquO6uybAKvlcCPaPH1NpkHd
 P0Mq76vN/q5u7f/lrfgPGRqu2/rWYgb0PAnpfpAeEQ4C/t0wMWRE7aOx1JX0e82Xot46
 WQy0xA2TsNhyd9sdod7biEaozcsh5EHAWKcec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VwNp0a42H2HJdUXf2U+NyyGMLQI597ulmFnoEoIfRg8=;
 b=dGZrzcMTYSXg9lfBg3TeW6PwygGc1v27OANbBXQA1ivgPvNAlnSZhd+xzQ2jhzthSg
 xqCERYSZDQg4G7UC9LpAjKi5OELZ++1TLxZg4JjtLi+uQ5CKeIZcBxwqglkNBe1IWPQP
 yI3nOQSqg0HkZMc1HM+J8W1eF4Cwii0IlEF55IL6eEtpkLwN5TmqA298XoZ46t+650Rd
 4WZSCjq/wFDwsrhENAenE1z9lTLRh7zI82BDQkVTy+2MpmprNzT4ygUnJnN1m429wzHe
 8W52p7ClWLd77Sv4sgFZjadaxdjKP1gjsg5Eq9HKnh6cU/WqOZZ6M65uuSZdPa1GAbVx
 E4Ug==
X-Gm-Message-State: AOAM530kXAOHHwhSwBSBSdqpbAvGYSIRLyu019AOMvj6NDmDtp6DIGKd
 T94sfCPas7Ewd+qVluZFB+Gnm1JteH85DW3vMVtMrQ==
X-Google-Smtp-Source: ABdhPJwFJFhQYQVJPg8AcL5xpSmXQT4nU/vhOSOoGYxm48EBQ+vEBz006Z/ZUAjAOMfXzIp+7+twjGV9i1z1MNucNfM=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr1296084otr.303.1612342130615; 
 Wed, 03 Feb 2021 00:48:50 -0800 (PST)
MIME-Version: 1.0
References: <CAH1Ww+TPCSyiaC3oeoWPtsi-vDfDY=K4ByoLD37-onMvsAB5Rg@mail.gmail.com>
 <58e41b62-b8e0-b036-c87d-a84d53f5a26e@amd.com>
In-Reply-To: <58e41b62-b8e0-b036-c87d-a84d53f5a26e@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 3 Feb 2021 09:48:39 +0100
Message-ID: <CAKMK7uGTFYWnBG+JtbAK=zQVT1dT=nKor_SHP-t958oebgn8_A@mail.gmail.com>
Subject: Re: [amdgpu] deadlock
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Daniel Gomez <daniel@qtec.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMywgMjAyMSBhdCA5OjM2IEFNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBIaSBEYW5pZWwsCj4KPiB0aGlzIGlzIG5vdCBh
IGRlYWRsb2NrLCBidXQgcmF0aGVyIGEgaGFyZHdhcmUgbG9ja3VwLgoKQXJlIHlvdSBzdXJlPyBJ
bWUgZ2V0dGluZyBzdHVjayBpbiBkbWFfZmVuY2Vfd2FpdCBoYXMgZ2VuZXJhbGx5IGdvb2QKY2hh
bmNlIG9mIGJlaW5nIGEgZG1hX2ZlbmNlIGRlYWRsb2NrLiBHUFUgaGFuZyBzaG91bGQgbmV2ZXIg
cmVzdWx0IGluCmEgZm9yZXZlciBzdHVjayBkbWFfZmVuY2UuCgpEYW5pZWwsIGNhbiB5b3UgcGxz
IHJlLWhhbmcgeW91ciBtYWNoaW5lIGFuZCB0aGVuIGR1bXAgYmFja3RyYWNlcyBvZgphbGwgdGFz
a3MgaW50byBkbWVzZyB3aXRoIHN5c3JxLXQsIGFuZCB0aGVuIGF0dGFjaCB0aGF0PyBXaXRob3V0
IGFsbAp0aGUgYmFja3RyYWNlcyBpdCdzIHRyaWNreSB0byBjb25zdHJ1Y3QgdGhlIGZ1bGwgZGVw
ZW5kZW5jeSBjaGFpbiBvZgp3aGF0J3MgZ29pbmcgb24uIEFsc28gaXMgdGhpcyBwbGFpbiAtcmM2
LCBub3Qgc29tZSBtb3JlIHBhdGNoZXMgb24KdG9wPwotRGFuaWVsCgo+IFdoaWNoIE9wZW5DbCBz
dGFjayBhcmUgeW91IHVzaW5nPwo+Cj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCj4KPiBBbSAwMy4w
Mi4yMSB1bSAwOTozMyBzY2hyaWViIERhbmllbCBHb21lejoKPiA+IEhpIGFsbCwKPiA+Cj4gPiBJ
IGhhdmUgYSBkZWFkbG9jayB3aXRoIHRoZSBhbWRncHUgbWFpbmxpbmUgZHJpdmVyIHdoZW4gcnVu
bmluZyBpbiBwYXJhbGxlbCB0d28KPiA+IE9wZW5DTCBhcHBsaWNhdGlvbnMuIFNvIGZhciwgd2Un
dmUgYmVlbiBhYmxlIHRvIHJlcGxpY2F0ZSBpdCBlYXNpbHkgYnkgZXhlY3V0aW5nCj4gPiBjbGlu
Zm8gYW5kIE1hdHJpeE11bHRpcGxpY2F0aW9uIChmcm9tIEFNRCBvcGVuY2wtc2FtcGxlcykuIEl0
J3MgcXVpdGUgb2xkIHRoZQo+ID4gb3BlbmNsLXNhbXBsZXMgc28sIGlmIHlvdSBoYXZlIGFueSBv
dGhlciBzdWdnZXN0aW9uIGZvciB0ZXN0aW5nIEknZCBiZSB2ZXJ5Cj4gPiBoYXBweSB0byB0ZXN0
IGl0IGFzIHdlbGwuCj4gPgo+ID4gSG93IHRvIHJlcGxpY2F0ZSB0aGUgaXNzdWU6Cj4gPgo+ID4g
IyB3aGlsZSB0cnVlOyBkbyAvdXNyL2Jpbi9NYXRyaXhNdWx0aXBsaWNhdGlvbiAtLWRldmljZSBn
cHUgXAo+ID4gICAgICAtLWRldmljZUlkIDAgLXggMTAwMCAteSAxMDAwIC16IDEwMDAgLXEgLXQg
LWkgNTA7IGRvbmUKPiA+ICMgd2hpbGUgdHJ1ZTsgZG8gY2xpbmZvOyBkb25lCj4gPgo+ID4gT3V0
cHV0Ogo+ID4KPiA+IEFmdGVyIGEgbWludXRlIG9yIGxlc3MgKHNvbWV0aW1lcyBjb3VsZCBiZSBt
b3JlKSBJIGNhbiBzZWUgdGhhdAo+ID4gTWF0cml4TXVsdGlwbGljYXRpb24gYW5kIGNsaW5mbyBo
YW5nLiBJbiBhZGRpdGlvbiwgd2l0aCByYWRlb250b3AgeW91IGNhbiBzZWUKPiA+IGhvdyB0aGUg
R3JhcGhpY3MgcGlwZSBnb2VzIGZyb20gfjUwJSB0byAxMDAlLiBBbHNvIHRoZSBzaGFkZXIgY2xv
Y2tzCj4gPiBnb2VzIHVwIGZyb20gfjM1JSB0byB+OTYlLgo+ID4KPiA+IGNsaW5mbyBrZWVwcyBw
cmludGluZzoKPiA+IGlvY3RsKDcsIERSTV9JT0NUTF9TWU5DT0JKX1dBSVQsIDB4N2ZmZTQ2ZTVm
OTUwKSA9IC0xIEVUSU1FIChUaW1lciBleHBpcmVkKQo+ID4KPiA+IEFuZCBNYXRyaXhNdWx0aXBs
aWNhdGlvbiBwcmludHMgdGhlIGZvbGxvd2luZyAoc3RyYWNlKSBpZiB5b3UgdHJ5IHRvCj4gPiBr
aWxsIHRoZSBwcm9jZXNzOgo+ID4KPiA+IHNjaGVkX3lpZWxkKCkgICAgICAgICAgICAgICAgICAg
ICAgICAgICA9IDAKPiA+IGZ1dGV4KDB4NTU3ZTk0NTM0M2I4LCBGVVRFWF9XQUlUX0JJVFNFVF9Q
UklWQVRFfEZVVEVYX0NMT0NLX1JFQUxUSU1FLCAwLAo+ID4gTlVMTCwgRlVURVhfQklUU0VUX01B
VENIX0FOWXN0cmFjZTogUHJvY2VzcyA2NTEgZGV0YWNoZWQKPiA+ICAgPGRldGFjaGVkIC4uLj4K
PiA+Cj4gPiBBZnRlciB0aGlzLCB0aGUgZ3B1IGlzIG5vdCBmdW5jdGlvbmFsIGF0IGFsbCBhbmQg
eW91J2QgbmVlZCBhIHBvd2VyIGN5Y2xlIHJlc2V0Cj4gPiB0byByZXN0b3JlIHRoZSBzeXN0ZW0u
Cj4gPgo+ID4gSGFyZHdhcmUgaW5mbzoKPiA+IENQVTogQU1EIFJ5emVuIEVtYmVkZGVkIFYxNjA1
QiB3aXRoIFJhZGVvbiBWZWdhIEdmeCAoOCkgQCAyLjAwMEdIego+ID4gR1BVOiBBTUQgQVRJIFJh
ZGVvbiBWZWdhIFNlcmllcyAvIFJhZGVvbiBWZWdhIE1vYmlsZSBTZXJpZXMKPiA+Cj4gPiAwMzow
MC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIElu
Yy4KPiA+IFtBTUQvQVRJXSBSYXZlbiBSaWRnZSBbUmFkZW9uIFZlZ2EgU2VyaWVzIC8gUmFkZW9u
IFZlZ2EgTW9iaWxlIFNlcmllc10KPiA+IChyZXYgODMpCj4gPiAgICAgIERldmljZU5hbWU6IEJy
b2FkY29tIDU3NjIKPiA+ICAgICAgU3Vic3lzdGVtOiBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJ
bmMuIFtBTUQvQVRJXSBSYXZlbiBSaWRnZQo+ID4gW1JhZGVvbiBWZWdhIFNlcmllcyAvIFJhZGVv
biBWZWdhIE1vYmlsZSBTZXJpZXNdCj4gPiAgICAgIEtlcm5lbCBkcml2ZXIgaW4gdXNlOiBhbWRn
cHUKPiA+ICAgICAgS2VybmVsIG1vZHVsZXM6IGFtZGdwdQo+ID4KPiA+IExpbnV4IGtlcm5lbCBp
bmZvOgo+ID4KPiA+IHJvb3RAcXQ1MjIyOn4jIHVuYW1lIC1hCj4gPiBMaW51eCBxdDUyMjIgNS4x
MS4wLXJjNi1xdGVjLXN0YW5kYXJkICMyIFNNUCBUdWUgRmViIDIgMDk6NDE6NDYgVVRDCj4gPiAy
MDIxIHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9MaW51eAo+ID4KPiA+IEJ5IGVuYWJsaW5nIHRo
ZSBrZXJuZWwgbG9ja3Mgc3RhdHMgSSBjb3VsZCBzZWUgdGhlIE1hdHJpeE11bHRpcGxpY2F0aW9u
IGlzCj4gPiBoYW5nZWQgaW4gdGhlIGFtZGdwdV9tbl9pbnZhbGlkYXRlX2dmeCBmdW5jdGlvbjoK
PiA+Cj4gPiBbICA3MzguMzU5MjAyXSAxIGxvY2sgaGVsZCBieSBNYXRyaXhNdWx0aXBsaWMvNjUz
Ogo+ID4gWyAgNzM4LjM1OTIwNl0gICMwOiBmZmZmODg4MTBlMzY0ZmUwCj4gPiAoJmFkZXYtPm5v
dGlmaWVyX2xvY2speysuKy59LXszOjN9LCBhdDoKPiA+IGFtZGdwdV9tbl9pbnZhbGlkYXRlX2dm
eCsweDM0LzB4YTAgW2FtZGdwdV0KPiA+Cj4gPiBJIGNhbiBzZWUgaW4gdGhlIHRoZSBhbWRncHVf
bW5faW52YWxpZGF0ZV9nZnggZnVuY3Rpb246IHRoZQo+ID4gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0
X3JjdSB1c2VzIHdhaXRfYWxsIChmZW5jZXMpIGFuZCBNQVhfU0NIRURVTEVfVElNRU9VVCBzbywg
SQo+ID4gZ3Vlc3MgdGhlIGNvZGUgZ2V0cyBzdHVjayB0aGVyZSB3YWl0aW5nIGZvcmV2ZXIuIEFj
Y29yZGluZyB0byB0aGUKPiA+IGRvY3VtZW50YXRpb246ICJXaGVuIHNvbWVib2R5IHRyaWVzIHRv
IGludmFsaWRhdGUgdGhlIHBhZ2UgdGFibGVzIHdlIGJsb2NrIHRoZQo+ID4gdXBkYXRlIHVudGls
IGFsbCBvcGVyYXRpb25zIG9uIHRoZSBwYWdlcyBpbiBxdWVzdGlvbiBhcmUgY29tcGxldGVkLCB0
aGVuIHRob3NlCj4gPiBwYWdlcyBhcmUgbWFya2VkICBhcyBhY2Nlc3NlZCBhbmQgYWxzbyBkaXJ0
eSBpZiBpdCB3YXNu4oCZdCBhIHJlYWQgb25seSBhY2Nlc3MuIgo+ID4gTG9va3MgbGlrZSB0aGUg
ZmVuY2VzIGFyZSBkZWFkbG9ja2VkIGFuZCB0aGVyZWZvcmUsIGl0IG5ldmVyIHJldHVybnMuIENv
dWxkIGl0Cj4gPiBiZSBwb3NzaWJsZT8gYW55IGhpbnQgdG8gd2hlcmUgY2FuIEkgbG9vayB0byBm
aXggdGhpcz8KPiA+Cj4gPiBUaGFuayB5b3UgIGluIGFkdmFuY2UuCj4gPgo+ID4gSGVyZSB0aGUg
ZnVsbCBkbWVzZyBvdXRwdXQ6Cj4gPgo+ID4gWyAgNzM4LjMzNzcyNl0gSU5GTzogdGFzayBNYXRy
aXhNdWx0aXBsaWM6NjUzIGJsb2NrZWQgZm9yIG1vcmUgdGhhbiAxMjIgc2Vjb25kcy4KPiA+IFsg
IDczOC4zNDQ5MzddICAgICAgIE5vdCB0YWludGVkIDUuMTEuMC1yYzYtcXRlYy1zdGFuZGFyZCAj
Mgo+ID4gWyAgNzM4LjM1MDM4NF0gImVjaG8gMCA+IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNr
X3RpbWVvdXRfc2VjcyIKPiA+IGRpc2FibGVzIHRoaXMgbWVzc2FnZS4KPiA+IFsgIDczOC4zNTgy
NDBdIHRhc2s6TWF0cml4TXVsdGlwbGljIHN0YXRlOkQgc3RhY2s6ICAgIDAgcGlkOiAgNjUzCj4g
PiBwcGlkOiAgICAgMSBmbGFnczoweDAwMDA0MDAwCj4gPiBbICA3MzguMzU4MjU0XSBDYWxsIFRy
YWNlOgo+ID4gWyAgNzM4LjM1ODI2MV0gID8gZG1hX2ZlbmNlX2RlZmF1bHRfd2FpdCsweDFlYi8w
eDIzMAo+ID4gWyAgNzM4LjM1ODI3Nl0gIF9fc2NoZWR1bGUrMHgzNzAvMHg5NjAKPiA+IFsgIDcz
OC4zNTgyOTFdICA/IGRtYV9mZW5jZV9kZWZhdWx0X3dhaXQrMHgxMTcvMHgyMzAKPiA+IFsgIDcz
OC4zNTgyOTddICA/IGRtYV9mZW5jZV9kZWZhdWx0X3dhaXQrMHgxZWIvMHgyMzAKPiA+IFsgIDcz
OC4zNTgzMDVdICBzY2hlZHVsZSsweDUxLzB4YzAKPiA+IFsgIDczOC4zNTgzMTJdICBzY2hlZHVs
ZV90aW1lb3V0KzB4Mjc1LzB4MzgwCj4gPiBbICA3MzguMzU4MzI0XSAgPyBkbWFfZmVuY2VfZGVm
YXVsdF93YWl0KzB4MWViLzB4MjMwCj4gPiBbICA3MzguMzU4MzMyXSAgPyBtYXJrX2hlbGRfbG9j
a3MrMHg0Zi8weDcwCj4gPiBbICA3MzguMzU4MzQxXSAgPyBkbWFfZmVuY2VfZGVmYXVsdF93YWl0
KzB4MTE3LzB4MjMwCj4gPiBbICA3MzguMzU4MzQ3XSAgPyBsb2NrZGVwX2hhcmRpcnFzX29uX3By
ZXBhcmUrMHhkNC8weDE4MAo+ID4gWyAgNzM4LjM1ODM1M10gID8gX3Jhd19zcGluX3VubG9ja19p
cnFyZXN0b3JlKzB4MzkvMHg0MAo+ID4gWyAgNzM4LjM1ODM2Ml0gID8gZG1hX2ZlbmNlX2RlZmF1
bHRfd2FpdCsweDExNy8weDIzMAo+ID4gWyAgNzM4LjM1ODM3MF0gID8gZG1hX2ZlbmNlX2RlZmF1
bHRfd2FpdCsweDFlYi8weDIzMAo+ID4gWyAgNzM4LjM1ODM3NV0gIGRtYV9mZW5jZV9kZWZhdWx0
X3dhaXQrMHgyMTQvMHgyMzAKPiA+IFsgIDczOC4zNTgzODRdICA/IGRtYV9mZW5jZV9yZWxlYXNl
KzB4MWEwLzB4MWEwCj4gPiBbICA3MzguMzU4Mzk2XSAgZG1hX2ZlbmNlX3dhaXRfdGltZW91dCsw
eDEwNS8weDIwMAo+ID4gWyAgNzM4LjM1ODQwNV0gIGRtYV9yZXN2X3dhaXRfdGltZW91dF9yY3Ur
MHgxYWEvMHg1ZTAKPiA+IFsgIDczOC4zNTg0MjFdICBhbWRncHVfbW5faW52YWxpZGF0ZV9nZngr
MHg1NS8weGEwIFthbWRncHVdCj4gPiBbICA3MzguMzU4Njg4XSAgX19tbXVfbm90aWZpZXJfcmVs
ZWFzZSsweDFiYi8weDIxMAo+ID4gWyAgNzM4LjM1ODcxMF0gIGV4aXRfbW1hcCsweDJmLzB4MWUw
Cj4gPiBbICA3MzguMzU4NzIzXSAgPyBmaW5kX2hlbGRfbG9jaysweDM0LzB4YTAKPiA+IFsgIDcz
OC4zNTg3NDZdICBtbXB1dCsweDM5LzB4ZTAKPiA+IFsgIDczOC4zNTg3NTZdICBkb19leGl0KzB4
NWMzLzB4YzAwCj4gPiBbICA3MzguMzU4NzYzXSAgPyBmaW5kX2hlbGRfbG9jaysweDM0LzB4YTAK
PiA+IFsgIDczOC4zNTg3ODBdICBkb19ncm91cF9leGl0KzB4NDcvMHhiMAo+ID4gWyAgNzM4LjM1
ODc5MV0gIGdldF9zaWduYWwrMHgxNWIvMHhjNTAKPiA+IFsgIDczOC4zNTg4MDddICBhcmNoX2Rv
X3NpZ25hbF9vcl9yZXN0YXJ0KzB4YWYvMHg3MTAKPiA+IFsgIDczOC4zNTg4MTZdICA/IGxvY2tk
ZXBfaGFyZGlycXNfb25fcHJlcGFyZSsweGQ0LzB4MTgwCj4gPiBbICA3MzguMzU4ODIyXSAgPyBf
cmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUrMHgzOS8weDQwCj4gPiBbICA3MzguMzU4ODMxXSAg
PyBrdGltZV9nZXRfbW9ub19mYXN0X25zKzB4NTAvMHhhMAo+ID4gWyAgNzM4LjM1ODg0NF0gID8g
YW1kZ3B1X2RybV9pb2N0bCsweDZiLzB4ODAgW2FtZGdwdV0KPiA+IFsgIDczOC4zNTkwNDRdICBl
eGl0X3RvX3VzZXJfbW9kZV9wcmVwYXJlKzB4ZjIvMHgxYjAKPiA+IFsgIDczOC4zNTkwNTRdICBz
eXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKzB4MTkvMHg2MAo+ID4gWyAgNzM4LjM1OTA2Ml0gIGVu
dHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKPiA+IFsgIDczOC4zNTkwNjld
IFJJUDogMDAzMzoweDdmNmI4OWE1MTg4Nwo+ID4gWyAgNzM4LjM1OTA3Nl0gUlNQOiAwMDJiOjAw
MDA3ZjZiODJiNTRiMTggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDoKPiA+IDAwMDAwMDAwMDAw
MDAwMTAKPiA+IFsgIDczOC4zNTkwODZdIFJBWDogZmZmZmZmZmZmZmZmZmUwMCBSQlg6IDAwMDA3
ZjZiODJiNTRiNTAgUkNYOiAwMDAwN2Y2Yjg5YTUxODg3Cj4gPiBbICA3MzguMzU5MDkxXSBSRFg6
IDAwMDA3ZjZiODJiNTRiNTAgUlNJOiAwMDAwMDAwMGMwMjA2NGMzIFJESTogMDAwMDAwMDAwMDAw
MDAwNwo+ID4gWyAgNzM4LjM1OTA5Nl0gUkJQOiAwMDAwMDAwMGMwMjA2NGMzIFIwODogMDAwMDAw
MDAwMDAwMDAwMyBSMDk6IDAwMDA3ZjZiODJiNTRiYmMKPiA+IFsgIDczOC4zNTkxMDFdIFIxMDog
MDAwMDAwMDAwMDAwMDAwMSBSMTE6IDAwMDAwMDAwMDAwMDAyNDYgUjEyOiAwMDAwMDAwMTY1YTBi
YzAwCj4gPiBbICA3MzguMzU5MTA2XSBSMTM6IDAwMDAwMDAwMDAwMDAwMDcgUjE0OiAwMDAwMDAw
MDAwMDAwMDAxIFIxNTogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgNzM4LjM1OTEyOV0KPiA+ICAg
ICAgICAgICAgICAgICBTaG93aW5nIGFsbCBsb2NrcyBoZWxkIGluIHRoZSBzeXN0ZW06Cj4gPiBb
ICA3MzguMzU5MTQxXSAxIGxvY2sgaGVsZCBieSBraHVuZ3Rhc2tkLzU0Ogo+ID4gWyAgNzM4LjM1
OTE0OF0gICMwOiBmZmZmZmZmZjgyOWY2ODQwIChyY3VfcmVhZF9sb2NrKXsuLi4ufS17MToyfSwg
YXQ6Cj4gPiBkZWJ1Z19zaG93X2FsbF9sb2NrcysweDE1LzB4MTgzCj4gPiBbICA3MzguMzU5MTg3
XSAxIGxvY2sgaGVsZCBieSBzeXN0ZW1kLWpvdXJuYWwvMTc0Ogo+ID4gWyAgNzM4LjM1OTIwMl0g
MSBsb2NrIGhlbGQgYnkgTWF0cml4TXVsdGlwbGljLzY1MzoKPiA+IFsgIDczOC4zNTkyMDZdICAj
MDogZmZmZjg4ODEwZTM2NGZlMAo+ID4gKCZhZGV2LT5ub3RpZmllcl9sb2NrKXsrLisufS17Mzoz
fSwgYXQ6Cj4gPiBhbWRncHVfbW5faW52YWxpZGF0ZV9nZngrMHgzNC8weGEwIFthbWRncHVdCj4g
Pgo+ID4gRGFuaWVsCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeAo=

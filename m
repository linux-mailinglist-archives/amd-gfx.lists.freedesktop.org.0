Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0544335B42
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 13:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5C88989C;
	Wed,  5 Jun 2019 11:28:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27558989C
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 11:28:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p11so14243298wre.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 05 Jun 2019 04:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VdSrkJdyp/j1sd/JzyI1TVXl6KTDxjSZeSItRIItkuw=;
 b=SOrMiDt847HxLkThFMpeS9lrBo6kSMyqr4+vjYTjMsNpOBO8ZY81rt3eA7Vx8XPE+w
 neRxphh3uOpqNnoRIDFlxwX20T8HaXscsCm62yJ+Dn5+nweZIKIZIfCtDUPAL7SiUJEJ
 4v/JH8IxOX9DYuEBwmd8pN9FHy/tpBLPhF8mFauybWS7QyHM4D7r0BAhsdMRWlu/scH1
 6nH7Z38/KofMjHVVQj/KIYcC9N/bgQXKK1bIKYAhAEek7vYQM8TN/HcLJ/IkKJYO7QYK
 kNexgID15sV2S52M/7sUaSHAh9g7qcVXx+rca/PZ1ba+Lv19XkHEZZ5Bk2UXxtpzstAq
 3vTA==
X-Gm-Message-State: APjAAAU4+TOXTSTYQyEHe0EtmjKpM9qTzETKOZbzCWm01rxq4sOqjhD6
 QlD9Q6Vk3aJHCL+fEk8cl48sde1T
X-Google-Smtp-Source: APXvYqz18IYUnH9+qFQ4AHOZxT0L1FxLLqL0etK+dfrZ8j/E7Z+D2lmHXDkXAsLwPY55gUmrxz1s4g==
X-Received: by 2002:adf:e841:: with SMTP id d1mr24972213wrn.204.1559734132529; 
 Wed, 05 Jun 2019 04:28:52 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g8sm7339235wmf.17.2019.06.05.04.28.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 04:28:52 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: bump the DRM version for GDS ENOMEM fixes
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 amd-gfx@lists.freedesktop.org
References: <20190605025015.15204-1-maraeo@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3af7ec68-34c4-c7db-7df3-f8ac1a029461@gmail.com>
Date: Wed, 5 Jun 2019 13:28:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605025015.15204-1-maraeo@gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=VdSrkJdyp/j1sd/JzyI1TVXl6KTDxjSZeSItRIItkuw=;
 b=H0dWh4M6DOt9uOFo9pNibe+aZzs1fGBkjQP2TGGGNac0jRJ4tSQ2EqiVUlVkhg0M2G
 l3IiyVEvkWX5Dybi1lzttX2G2sSnTh+7s7fCoOO9Fh6z5f1SDPMcRuHb5yJfKAT+eTrV
 xuW7rHTDH7qi2pGmIEXRW1WJ8T46bAA7233mHNeyLNxkHaiG0hN65vbhzTb6xh5zy226
 NuIfPDCG6shyTZEh2/47PdNnKcLLHIuaoAOUy2ZmaB2BqhyJ/elbYmCA758D/A+6sbQ7
 JhCbAqENvr4oc3ZgE8Tzl63dtVweYM/4/TcQmCVFHvzirE/Mc1TLTvE/CJy6ikI5dDFF
 vErw==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDUuMDYuMTkgdW0gMDQ6NTAgc2NocmllYiBNYXJlayBPbMWhw6FrOgo+IEZyb206IE1hcmVr
IE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5jb20+Cj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBP
bMWhw6FrIDxtYXJlay5vbHNha0BhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYwo+IGluZGV4IDFmMzhkNmZjMWZlMy4uZjk0NjJhZDJhMzE0IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IEBAIC02OSwyMyArNjksMjQgQEAK
PiAgICAqIC0gMy4yMy4wIC0gQWRkIHF1ZXJ5IGZvciBWUkFNIGxvc3QgY291bnRlcgo+ICAgICog
LSAzLjI0LjAgLSBBZGQgaGlnaCBwcmlvcml0eSBjb21wdXRlIHN1cHBvcnQgZm9yIGdmeDkKPiAg
ICAqIC0gMy4yNS4wIC0gQWRkIHN1cHBvcnQgZm9yIHNlbnNvciBxdWVyeSBpbmZvIChzdGFibGUg
cHN0YXRlIHNjbGsvbWNsaykuCj4gICAgKiAtIDMuMjYuMCAtIEdGWDk6IFByb2Nlc3MgQU1ER1BV
X0lCX0ZMQUdfVENfV0JfTk9UX0lOVkFMSURBVEUuCj4gICAgKiAtIDMuMjcuMCAtIEFkZCBuZXcg
Y2h1bmsgdG8gdG8gQU1ER1BVX0NTIHRvIGVuYWJsZSBCT19MSVNUIGNyZWF0aW9uLgo+ICAgICog
LSAzLjI4LjAgLSBBZGQgQU1ER1BVX0NIVU5LX0lEX1NDSEVEVUxFRF9ERVBFTkRFTkNJRVMKPiAg
ICAqIC0gMy4yOS4wIC0gQWRkIEFNREdQVV9JQl9GTEFHX1JFU0VUX0dEU19NQVhfV0FWRV9JRAo+
ICAgICogLSAzLjMwLjAgLSBBZGQgQU1ER1BVX1NDSEVEX09QX0NPTlRFWFRfUFJJT1JJVFlfT1ZF
UlJJREUuCj4gICAgKiAtIDMuMzEuMCAtIEFkZCBzdXBwb3J0IGZvciBwZXItZmxpcCB0aWxpbmcg
YXR0cmlidXRlIGNoYW5nZXMgd2l0aCBEQwo+ICAgICogLSAzLjMyLjAgLSBBZGQgc3luY29iaiB0
aW1lbGluZSBzdXBwb3J0IHRvIEFNREdQVV9DUy4KPiArICogLSAzLjMzLjAgLSBGaXhlcyBmb3Ig
R0RTIEVOT01FTSBmYWlsdXJlcyBpbiBBTURHUFVfQ1MuCj4gICAgKi8KPiAgICNkZWZpbmUgS01T
X0RSSVZFUl9NQUpPUgkzCj4gLSNkZWZpbmUgS01TX0RSSVZFUl9NSU5PUgkzMgo+ICsjZGVmaW5l
IEtNU19EUklWRVJfTUlOT1IJMzMKPiAgICNkZWZpbmUgS01TX0RSSVZFUl9QQVRDSExFVkVMCTAK
PiAgIAo+ICAgI2RlZmluZSBBTURHUFVfTUFYX1RJTUVPVVRfUEFSQU1fTEVOVEgJMjU2Cj4gICAK
PiAgIGludCBhbWRncHVfdnJhbV9saW1pdCA9IDA7Cj4gICBpbnQgYW1kZ3B1X3Zpc192cmFtX2xp
bWl0ID0gMDsKPiAgIGludCBhbWRncHVfZ2FydF9zaXplID0gLTE7IC8qIGF1dG8gKi8KPiAgIGlu
dCBhbWRncHVfZ3R0X3NpemUgPSAtMTsgLyogYXV0byAqLwo+ICAgaW50IGFtZGdwdV9tb3ZlcmF0
ZSA9IC0xOyAvKiBhdXRvICovCj4gICBpbnQgYW1kZ3B1X2JlbmNobWFya2luZyA9IDA7CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

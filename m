Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8004C25BC78
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Sep 2020 10:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035076E199;
	Thu,  3 Sep 2020 08:11:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFCF6E199
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Sep 2020 08:11:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a65so1877661wme.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 03 Sep 2020 01:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mcCxgVSi1SQhVHMXzFJF12ZIL3/nC/otQtF5buPgtRM=;
 b=FULS8zgInpl93FN4ibhNgLbrQyEBmhLoIFnOoEb5SywJi8Ss6xrkXyhkKczmkXxMQA
 R8Q745SBtW5YHzBectWC5RMOTglI3rE/hiC3GSsb4KU5V+IGgIRAlrtyyIPOH+BayGpN
 OrSMWMKUTbAVOL9HLLEjb9tMt7cC+CBFhlhH/kF2vw5UmCsgVs17V8+FGK8PWE+TEzOg
 paprznREHIfNxqcyJlI275CbonS3vpMuOMCCpqC/RQ4XB4Mb58g6BTYQ61YYYMhZFfzy
 O3YDSbx5ScuvQ6jnNHFejINEYFtHWPISTV+BRbED9IEozjoHyPSuWxvGHRKkHyIU+mnW
 UJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=mcCxgVSi1SQhVHMXzFJF12ZIL3/nC/otQtF5buPgtRM=;
 b=crBYGtU9+kCy9WQrSGuDNTZ/r4KKKDUPD8o9dQHcI/linEfbe4xEyG6Tub/TpVpKRT
 UJFDCfrDJgITDspam77PgWSPNkQyBJJCQHBFt+Na4U9Q9MAJQ+oPKl30SfY29qK1Uj4U
 KOM0NIMwruWRwnGMy5W3Obrtgo7yJiVPNdxCBuyAHkYyqTSzwSbtg5Nc55DybFMYy9Qx
 Ob4yMeHoafE1u6jqTeVHUCoSuFGMNkTN3Uh0sJZRZZO5dJC0z0HJNybp+heIQe8V9ICV
 lDnF73fLFPKgGGihM02trL8vTTf3ptao331+c+pTjiWlq9edzndbrth1GDem80ykKG1z
 TaDA==
X-Gm-Message-State: AOAM532tCp7oHsveEZbq0gQkrwfVg++Xi7Qc317rC7vWlfbwbqNLvlpL
 Pc8YVpz2s2iCsSB/L5tkSzbfjRfKQfE=
X-Google-Smtp-Source: ABdhPJwENf+hUH2ihf8zebTZPzIwMB7Ih0Y6d0NdMKplF8+6cCO2SFmcO84NnfeshNLf6LcemLQuWg==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr1103289wma.141.1599120701447; 
 Thu, 03 Sep 2020 01:11:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z9sm3100989wmg.46.2020.09.03.01.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 01:11:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu/gmc9: print client id string for mmhub
To: Huang Rui <ray.huang@amd.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20200902181640.1559269-1-alexander.deucher@amd.com>
 <20200903063632.GB2470278@hr-amd>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <abb639d4-335a-ab4c-fe80-af547f926f49@gmail.com>
Date: Thu, 3 Sep 2020 10:11:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903063632.GB2470278@hr-amd>
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
Reply-To: christian.koenig@amd.com
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDMuMDkuMjAgdW0gMDg6MzYgc2NocmllYiBIdWFuZyBSdWk6Cj4gT24gV2VkLCBTZXAgMDIs
IDIwMjAgYXQgMDI6MTY6MzlQTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdyb3RlOgo+PiBQcmludCB0
aGUgbmFtZSBvZiB0aGUgY2xpZW50IHJhdGhlciB0aGFuIHRoZSBudW1iZXIuICBUaGlzCj4+IG1h
a2VzIGl0IGVhc2llciB0byBkZWJ1ZyB3aGF0IGJsb2NrIGlzIGNhdXNpbmcgdGhlIGZhdWx0Lgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Cj4gU2VyaWVzIGFyZSBSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4KCkkgd291bGQgZGVsZWdhdGUgdGhhdCB0byB0aGUgbW1odWJfdjFfMCBvbiBnZng5IGFzIHdl
bGwsIGJ1dCB0aGF0J3MganVzdCAKYW4gaWRlYSBmb3IgYSBjbGVhbnVwLgoKU2VyaWVzIFJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+Cj4+
IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCAyMzkgKysr
KysrKysrKysrKysrKysrKysrKysrKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMjMwIGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5
XzAuYwo+PiBpbmRleCA3ZTg2YWVlNjBjNjQuLmY5ZTgxMDEyNjEyNCAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCj4+IEBAIC04Nyw2ICs4NywyMDMgQEAgc3RhdGlj
IGNvbnN0IGNoYXIgKmdmeGh1Yl9jbGllbnRfaWRzW10gPSB7Cj4+ICAgCSJQQSIsCj4+ICAgfTsK
Pj4gICAKPj4gK3N0YXRpYyBjb25zdCBjaGFyICptbWh1Yl9jbGllbnRfaWRzX3JhdmVuW11bMl0g
PSB7Cj4+ICsJWzBdWzBdID0gIk1QMSIsCj4+ICsJWzFdWzBdID0gIk1QMCIsCj4+ICsJWzJdWzBd
ID0gIlZDTiIsCj4+ICsJWzNdWzBdID0gIlZDTlUiLAo+PiArCVs0XVswXSA9ICJIRFAiLAo+PiAr
CVs1XVswXSA9ICJEQ0UiLAo+PiArCVsxM11bMF0gPSAiVVRDTDIiLAo+PiArCVsxOV1bMF0gPSAi
VExTIiwKPj4gKwlbMjZdWzBdID0gIk9TUyIsCj4+ICsJWzI3XVswXSA9ICJTRE1BMCIsCj4+ICsJ
WzBdWzFdID0gIk1QMSIsCj4+ICsJWzFdWzFdID0gIk1QMCIsCj4+ICsJWzJdWzFdID0gIlZDTiIs
Cj4+ICsJWzNdWzFdID0gIlZDTlUiLAo+PiArCVs0XVsxXSA9ICJIRFAiLAo+PiArCVs1XVsxXSA9
ICJYRFAiLAo+PiArCVs2XVsxXSA9ICJEQkdVMCIsCj4+ICsJWzddWzFdID0gIkRDRSIsCj4+ICsJ
WzhdWzFdID0gIkRDRURXQjAiLAo+PiArCVs5XVsxXSA9ICJEQ0VEV0IxIiwKPj4gKwlbMjZdWzFd
ID0gIk9TUyIsCj4+ICsJWzI3XVsxXSA9ICJTRE1BMCIsCj4+ICt9Owo+PiArCj4+ICtzdGF0aWMg
Y29uc3QgY2hhciAqbW1odWJfY2xpZW50X2lkc19yZW5vaXJbXVsyXSA9IHsKPj4gKwlbMF1bMF0g
PSAiTVAxIiwKPj4gKwlbMV1bMF0gPSAiTVAwIiwKPj4gKwlbMl1bMF0gPSAiSERQIiwKPj4gKwlb
NF1bMF0gPSAiRENFRE1DIiwKPj4gKwlbNV1bMF0gPSAiRENFVkdBIiwKPj4gKwlbMTNdWzBdID0g
IlVUQ0wyIiwKPj4gKwlbMTldWzBdID0gIlRMUyIsCj4+ICsJWzI2XVswXSA9ICJPU1MiLAo+PiAr
CVsyN11bMF0gPSAiU0RNQTAiLAo+PiArCVsyOF1bMF0gPSAiVkNOIiwKPj4gKwlbMjldWzBdID0g
IlZDTlUiLAo+PiArCVszMF1bMF0gPSAiSlBFRyIsCj4+ICsJWzBdWzFdID0gIk1QMSIsCj4+ICsJ
WzFdWzFdID0gIk1QMCIsCj4+ICsJWzJdWzFdID0gIkhEUCIsCj4+ICsJWzNdWzFdID0gIlhEUCIs
Cj4+ICsJWzZdWzFdID0gIkRCR1UwIiwKPj4gKwlbN11bMV0gPSAiRENFRE1DIiwKPj4gKwlbOF1b
MV0gPSAiRENFVkdBIiwKPj4gKwlbOV1bMV0gPSAiRENFRFdCIiwKPj4gKwlbMjZdWzFdID0gIk9T
UyIsCj4+ICsJWzI3XVsxXSA9ICJTRE1BMCIsCj4+ICsJWzI4XVsxXSA9ICJWQ04iLAo+PiArCVsy
OV1bMV0gPSAiVkNOVSIsCj4+ICsJWzMwXVsxXSA9ICJKUEVHIiwKPj4gK307Cj4+ICsKPj4gK3N0
YXRpYyBjb25zdCBjaGFyICptbWh1Yl9jbGllbnRfaWRzX3ZlZ2ExMFtdWzJdID0gewo+PiArCVsw
XVswXSA9ICJNUDAiLAo+PiArCVsxXVswXSA9ICJVVkQiLAo+PiArCVsyXVswXSA9ICJVVkRVIiwK
Pj4gKwlbM11bMF0gPSAiSERQIiwKPj4gKwlbMTNdWzBdID0gIlVUQ0wyIiwKPj4gKwlbMTRdWzBd
ID0gIk9TUyIsCj4+ICsJWzE1XVswXSA9ICJTRE1BMSIsCj4+ICsJWzMyKzBdWzBdID0gIlZDRTAi
LAo+PiArCVszMisxXVswXSA9ICJWQ0UwVSIsCj4+ICsJWzMyKzJdWzBdID0gIlhETUEiLAo+PiAr
CVszMiszXVswXSA9ICJEQ0UiLAo+PiArCVszMis0XVswXSA9ICJNUDEiLAo+PiArCVszMisxNF1b
MF0gPSAiU0RNQTAiLAo+PiArCVswXVsxXSA9ICJNUDAiLAo+PiArCVsxXVsxXSA9ICJVVkQiLAo+
PiArCVsyXVsxXSA9ICJVVkRVIiwKPj4gKwlbM11bMV0gPSAiREJHVTAiLAo+PiArCVs0XVsxXSA9
ICJIRFAiLAo+PiArCVs1XVsxXSA9ICJYRFAiLAo+PiArCVsxNF1bMV0gPSAiT1NTIiwKPj4gKwlb
MTVdWzFdID0gIlNETUEwIiwKPj4gKwlbMzIrMF1bMV0gPSAiVkNFMCIsCj4+ICsJWzMyKzFdWzFd
ID0gIlZDRTBVIiwKPj4gKwlbMzIrMl1bMV0gPSAiWERNQSIsCj4+ICsJWzMyKzNdWzFdID0gIkRD
RSIsCj4+ICsJWzMyKzRdWzFdID0gIkRDRURXQiIsCj4+ICsJWzMyKzVdWzFdID0gIk1QMSIsCj4+
ICsJWzMyKzZdWzFdID0gIkRCR1UxIiwKPj4gKwlbMzIrMTRdWzFdID0gIlNETUExIiwKPj4gK307
Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBjaGFyICptbWh1Yl9jbGllbnRfaWRzX3ZlZ2ExMltdWzJd
ID0gewo+PiArCVswXVswXSA9ICJNUDAiLAo+PiArCVsxXVswXSA9ICJWQ0UwIiwKPj4gKwlbMl1b
MF0gPSAiVkNFMFUiLAo+PiArCVszXVswXSA9ICJIRFAiLAo+PiArCVsxM11bMF0gPSAiVVRDTDIi
LAo+PiArCVsxNF1bMF0gPSAiT1NTIiwKPj4gKwlbMTVdWzBdID0gIlNETUExIiwKPj4gKwlbMzIr
MF1bMF0gPSAiRENFIiwKPj4gKwlbMzIrMV1bMF0gPSAiWERNQSIsCj4+ICsJWzMyKzJdWzBdID0g
IlVWRCIsCj4+ICsJWzMyKzNdWzBdID0gIlVWRFUiLAo+PiArCVszMis0XVswXSA9ICJNUDEiLAo+
PiArCVszMisxNV1bMF0gPSAiU0RNQTAiLAo+PiArCVswXVsxXSA9ICJNUDAiLAo+PiArCVsxXVsx
XSA9ICJWQ0UwIiwKPj4gKwlbMl1bMV0gPSAiVkNFMFUiLAo+PiArCVszXVsxXSA9ICJEQkdVMCIs
Cj4+ICsJWzRdWzFdID0gIkhEUCIsCj4+ICsJWzVdWzFdID0gIlhEUCIsCj4+ICsJWzE0XVsxXSA9
ICJPU1MiLAo+PiArCVsxNV1bMV0gPSAiU0RNQTAiLAo+PiArCVszMiswXVsxXSA9ICJEQ0UiLAo+
PiArCVszMisxXVsxXSA9ICJEQ0VEV0IiLAo+PiArCVszMisyXVsxXSA9ICJYRE1BIiwKPj4gKwlb
MzIrM11bMV0gPSAiVVZEIiwKPj4gKwlbMzIrNF1bMV0gPSAiVVZEVSIsCj4+ICsJWzMyKzVdWzFd
ID0gIk1QMSIsCj4+ICsJWzMyKzZdWzFdID0gIkRCR1UxIiwKPj4gKwlbMzIrMTVdWzFdID0gIlNE
TUExIiwKPj4gK307Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBjaGFyICptbWh1Yl9jbGllbnRfaWRz
X3ZlZ2EyMFtdWzJdID0gewo+PiArCVswXVswXSA9ICJYRE1BIiwKPj4gKwlbMV1bMF0gPSAiRENF
IiwKPj4gKwlbMl1bMF0gPSAiVkNFMCIsCj4+ICsJWzNdWzBdID0gIlZDRTBVIiwKPj4gKwlbNF1b
MF0gPSAiVVZEIiwKPj4gKwlbNV1bMF0gPSAiVVZEMVUiLAo+PiArCVsxM11bMF0gPSAiT1NTIiwK
Pj4gKwlbMTRdWzBdID0gIkhEUCIsCj4+ICsJWzE1XVswXSA9ICJTRE1BMCIsCj4+ICsJWzMyKzBd
WzBdID0gIlVWRCIsCj4+ICsJWzMyKzFdWzBdID0gIlVWRFUiLAo+PiArCVszMisyXVswXSA9ICJN
UDEiLAo+PiArCVszMiszXVswXSA9ICJNUDAiLAo+PiArCVszMisxMl1bMF0gPSAiVVRDTDIiLAo+
PiArCVszMisxNF1bMF0gPSAiU0RNQTEiLAo+PiArCVswXVsxXSA9ICJYRE1BIiwKPj4gKwlbMV1b
MV0gPSAiRENFIiwKPj4gKwlbMl1bMV0gPSAiRENFRFdCIiwKPj4gKwlbM11bMV0gPSAiVkNFMCIs
Cj4+ICsJWzRdWzFdID0gIlZDRTBVIiwKPj4gKwlbNV1bMV0gPSAiVVZEMSIsCj4+ICsJWzZdWzFd
ID0gIlVWRDFVIiwKPj4gKwlbN11bMV0gPSAiREJHVTAiLAo+PiArCVs4XVsxXSA9ICJYRFAiLAo+
PiArCVsxM11bMV0gPSAiT1NTIiwKPj4gKwlbMTRdWzFdID0gIkhEUCIsCj4+ICsJWzE1XVsxXSA9
ICJTRE1BMCIsCj4+ICsJWzMyKzBdWzFdID0gIlVWRCIsCj4+ICsJWzMyKzFdWzFdID0gIlVWRFUi
LAo+PiArCVszMisyXVsxXSA9ICJEQkdVMSIsCj4+ICsJWzMyKzNdWzFdID0gIk1QMSIsCj4+ICsJ
WzMyKzRdWzFdID0gIk1QMCIsCj4+ICsJWzMyKzE0XVsxXSA9ICJTRE1BMSIsCj4+ICt9Owo+PiAr
Cj4+ICtzdGF0aWMgY29uc3QgY2hhciAqbW1odWJfY2xpZW50X2lkc19hcmN0dXJ1c1tdWzJdID0g
ewo+PiArCVsyXVswXSA9ICJNUDEiLAo+PiArCVszXVswXSA9ICJNUDAiLAo+PiArCVsxMF1bMF0g
PSAiVVRDTDIiLAo+PiArCVsxM11bMF0gPSAiT1NTIiwKPj4gKwlbMTRdWzBdID0gIkhEUCIsCj4+
ICsJWzE1XVswXSA9ICJTRE1BMCIsCj4+ICsJWzMyKzE1XVswXSA9ICJTRE1BMSIsCj4+ICsJWzY0
KzE1XVswXSA9ICJTRE1BMiIsCj4+ICsJWzk2KzE1XVswXSA9ICJTRE1BMyIsCj4+ICsJWzEyOCsx
NV1bMF0gPSAiU0RNQTQiLAo+PiArCVsxNjArMTFdWzBdID0gIkpQRUciLAo+PiArCVsxNjArMTJd
WzBdID0gIlZDTiIsCj4+ICsJWzE2MCsxM11bMF0gPSAiVkNOVSIsCj4+ICsJWzE2MCsxNV1bMF0g
PSAiU0RNQTUiLAo+PiArCVsxOTIrMTBdWzBdID0gIlVUQ0wyIiwKPj4gKwlbMTkyKzExXVswXSA9
ICJKUEVHMSIsCj4+ICsJWzE5MisxMl1bMF0gPSAiVkNOMSIsCj4+ICsJWzE5MisxM11bMF0gPSAi
VkNOMVUiLAo+PiArCVsxOTIrMTVdWzBdID0gIlNETUE2IiwKPj4gKwlbMjI0KzE1XVswXSA9ICJT
RE1BNyIsCj4+ICsJWzBdWzFdID0gIkRCR1UxIiwKPj4gKwlbMV1bMV0gPSAiWERQIiwKPj4gKwlb
Ml1bMV0gPSAiTVAxIiwKPj4gKwlbM11bMV0gPSAiTVAwIiwKPj4gKwlbMTNdWzFdID0gIk9TUyIs
Cj4+ICsJWzE0XVsxXSA9ICJIRFAiLAo+PiArCVsxNV1bMV0gPSAiU0RNQTAiLAo+PiArCVszMisx
NV1bMV0gPSAiU0RNQTEiLAo+PiArCVszMisxNV1bMV0gPSAiU0RNQTEiLAo+PiArCVs2NCsxNV1b
MV0gPSAiU0RNQTIiLAo+PiArCVs5NisxNV1bMV0gPSAiU0RNQTMiLAo+PiArCVsxMjgrMTVdWzFd
ID0gIlNETUE0IiwKPj4gKwlbMTYwKzExXVsxXSA9ICJKUEVHIiwKPj4gKwlbMTYwKzEyXVsxXSA9
ICJWQ04iLAo+PiArCVsxNjArMTNdWzFdID0gIlZDTlUiLAo+PiArCVsxNjArMTVdWzFdID0gIlNE
TUE1IiwKPj4gKwlbMTkyKzExXVsxXSA9ICJKUEVHMSIsCj4+ICsJWzE5MisxMl1bMV0gPSAiVkNO
MSIsCj4+ICsJWzE5MisxM11bMV0gPSAiVkNOMVUiLAo+PiArCVsxOTIrMTVdWzFdID0gIlNETUE2
IiwKPj4gKwlbMjI0KzE1XVsxXSA9ICJTRE1BNyIsCj4+ICt9Owo+PiArCj4+ICAgc3RhdGljIGNv
bnN0IHUzMiBnb2xkZW5fc2V0dGluZ3NfdmVnYTEwX2hkcFtdID0KPj4gICB7Cj4+ICAgCTB4ZjY0
LCAweDBmZmZmZmZmLCAweDAwMDAwMDAwLAo+PiBAQCAtMzE5LDkgKzUxNiwxMCBAQCBzdGF0aWMg
aW50IGdtY192OV8wX3Byb2Nlc3NfaW50ZXJydXB0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAo+PiAgIHsKPj4gICAJc3RydWN0IGFtZGdwdV92bWh1YiAqaHViOwo+PiAgIAlib29sIHJldHJ5
X2ZhdWx0ID0gISEoZW50cnktPnNyY19kYXRhWzFdICYgMHg4MCk7Cj4+IC0JdWludDMyX3Qgc3Rh
dHVzID0gMCwgY2lkID0gMDsKPj4gKwl1aW50MzJfdCBzdGF0dXMgPSAwLCBjaWQgPSAwLCBydyA9
IDA7Cj4+ICAgCXU2NCBhZGRyOwo+PiAgIAljaGFyIGh1Yl9uYW1lWzEwXTsKPj4gKwljb25zdCBj
aGFyICptbWh1Yl9jaWQ7Cj4+ICAgCj4+ICAgCWFkZHIgPSAodTY0KWVudHJ5LT5zcmNfZGF0YVsw
XSA8PCAxMjsKPj4gICAJYWRkciB8PSAoKHU2NCllbnRyeS0+c3JjX2RhdGFbMV0gJiAweGYpIDw8
IDQ0Owo+PiBAQCAtMzU4LDYgKzU1Niw4IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfcHJvY2Vzc19p
bnRlcnJ1cHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+ICAgCQlzdGF0dXMgPSBSUkVH
MzIoaHViLT52bV9sMl9wcm9fZmF1bHRfc3RhdHVzKTsKPj4gICAJCWNpZCA9IFJFR19HRVRfRklF
TEQoc3RhdHVzLAo+PiAgIAkJCQkgICAgVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVMsIENJ
RCk7Cj4+ICsJCXJ3ID0gUkVHX0dFVF9GSUVMRChzdGF0dXMsCj4+ICsJCQkJICAgVk1fTDJfUFJP
VEVDVElPTl9GQVVMVF9TVEFUVVMsIFJXKTsKPj4gICAJCVdSRUczMl9QKGh1Yi0+dm1fbDJfcHJv
X2ZhdWx0X2NudGwsIDEsIH4xKTsKPj4gICAJfQo+PiAgIAo+PiBAQCAtMzgwLDEzICs1ODAsMzcg
QEAgc3RhdGljIGludCBnbWNfdjlfMF9wcm9jZXNzX2ludGVycnVwdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKPj4gICAJCQlkZXZfZXJyKGFkZXYtPmRldiwKPj4gICAJCQkJIlZNX0wyX1BS
T1RFQ1RJT05fRkFVTFRfU1RBVFVTOjB4JTA4WFxuIiwKPj4gICAJCQkJc3RhdHVzKTsKPj4gLQkJ
CWlmIChodWIgPT0gJmFkZXYtPnZtaHViW0FNREdQVV9HRlhIVUJfMF0pCj4+ICsJCQlpZiAoaHVi
ID09ICZhZGV2LT52bWh1YltBTURHUFVfR0ZYSFVCXzBdKSB7Cj4+ICAgCQkJCWRldl9lcnIoYWRl
di0+ZGV2LCAiXHQgRmF1bHR5IFVUQ0wyIGNsaWVudCBJRDogJXMgKDB4JXgpXG4iLAo+PiAgIAkJ
CQkJY2lkID49IEFSUkFZX1NJWkUoZ2Z4aHViX2NsaWVudF9pZHMpID8gInVua25vd24iIDogZ2Z4
aHViX2NsaWVudF9pZHNbY2lkXSwKPj4gICAJCQkJCWNpZCk7Cj4+IC0JCQllbHNlCj4+IC0JCQkJ
ZGV2X2VycihhZGV2LT5kZXYsICJcdCBGYXVsdHkgVVRDTDIgY2xpZW50IElEOiAweCV4XG4iLAo+
PiAtCQkJCQljaWQpOwo+PiArCQkJfSBlbHNlIHsKPj4gKwkJCQlzd2l0Y2ggKGFkZXYtPmFzaWNf
dHlwZSkgewo+PiArCQkJCWNhc2UgQ0hJUF9WRUdBMTA6Cj4+ICsJCQkJCW1taHViX2NpZCA9IG1t
aHViX2NsaWVudF9pZHNfdmVnYTEwW2NpZF1bcnddOwo+PiArCQkJCQlicmVhazsKPj4gKwkJCQlj
YXNlIENISVBfVkVHQTEyOgo+PiArCQkJCQltbWh1Yl9jaWQgPSBtbWh1Yl9jbGllbnRfaWRzX3Zl
Z2ExMltjaWRdW3J3XTsKPj4gKwkJCQkJYnJlYWs7Cj4+ICsJCQkJY2FzZSBDSElQX1ZFR0EyMDoK
Pj4gKwkJCQkJbW1odWJfY2lkID0gbW1odWJfY2xpZW50X2lkc192ZWdhMjBbY2lkXVtyd107Cj4+
ICsJCQkJCWJyZWFrOwo+PiArCQkJCWNhc2UgQ0hJUF9BUkNUVVJVUzoKPj4gKwkJCQkJbW1odWJf
Y2lkID0gbW1odWJfY2xpZW50X2lkc19hcmN0dXJ1c1tjaWRdW3J3XTsKPj4gKwkJCQkJYnJlYWs7
Cj4+ICsJCQkJY2FzZSBDSElQX1JBVkVOOgo+PiArCQkJCQltbWh1Yl9jaWQgPSBtbWh1Yl9jbGll
bnRfaWRzX3JhdmVuW2NpZF1bcnddOwo+PiArCQkJCQlicmVhazsKPj4gKwkJCQljYXNlIENISVBf
UkVOT0lSOgo+PiArCQkJCQltbWh1Yl9jaWQgPSBtbWh1Yl9jbGllbnRfaWRzX3Jlbm9pcltjaWRd
W3J3XTsKPj4gKwkJCQkJYnJlYWs7Cj4+ICsJCQkJZGVmYXVsdDoKPj4gKwkJCQkJbW1odWJfY2lk
ID0gTlVMTDsKPj4gKwkJCQkJYnJlYWs7Cj4+ICsJCQkJfQo+PiArCQkJCWRldl9lcnIoYWRldi0+
ZGV2LCAiXHQgRmF1bHR5IFVUQ0wyIGNsaWVudCBJRDogJXMgKDB4JXgpXG4iLAo+PiArCQkJCQlt
bWh1Yl9jaWQgPyBtbWh1Yl9jaWQgOiAidW5rbm93biIsIGNpZCk7Cj4+ICsJCQl9Cj4+ICAgCQkJ
ZGV2X2VycihhZGV2LT5kZXYsICJcdCBNT1JFX0ZBVUxUUzogMHglbHhcbiIsCj4+ICAgCQkJCVJF
R19HRVRfRklFTEQoc3RhdHVzLAo+PiAgIAkJCQlWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NUQVRV
UywgTU9SRV9GQVVMVFMpKTsKPj4gQEAgLTM5OSwxMCArNjIzLDcgQEAgc3RhdGljIGludCBnbWNf
djlfMF9wcm9jZXNzX2ludGVycnVwdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4gICAJ
CQlkZXZfZXJyKGFkZXYtPmRldiwgIlx0IE1BUFBJTkdfRVJST1I6IDB4JWx4XG4iLAo+PiAgIAkJ
CQlSRUdfR0VUX0ZJRUxEKHN0YXR1cywKPj4gICAJCQkJVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9T
VEFUVVMsIE1BUFBJTkdfRVJST1IpKTsKPj4gLQkJCWRldl9lcnIoYWRldi0+ZGV2LCAiXHQgUlc6
IDB4JWx4XG4iLAo+PiAtCQkJCVJFR19HRVRfRklFTEQoc3RhdHVzLAo+PiAtCQkJCVZNX0wyX1BS
T1RFQ1RJT05fRkFVTFRfU1RBVFVTLCBSVykpOwo+PiAtCj4+ICsJCQlkZXZfZXJyKGFkZXYtPmRl
diwgIlx0IFJXOiAweCV4XG4iLCBydyk7Cj4+ICAgCQl9Cj4+ICAgCX0KPj4gICAKPj4gLS0gCj4+
IDIuMjUuNAo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGlu
Zm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdDMDElN0NyYXkuaHVhbmclNDBhbWQuY29tJTdDYWNi
MWNmMGNjNTA2NGIzZGZiZDAwOGQ4NGY2YzVmZDAlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5
OTRlMTgzZCU3QzAlN0MwJTdDNjM3MzQ2Njc0MTk1MDIzNzQ4JmFtcDtzZGF0YT16WlJOVVhmeWNl
d0t4Rnd1VmsxZ0JHYzlDaVBHSU9oaG0xVXY5S0Flb2VjJTNEJmFtcDtyZXNlcnZlZD0wCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1h
aWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D3B1CFBA6
	for <lists+amd-gfx@lfdr.de>; Tue, 12 May 2020 19:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CE36E946;
	Tue, 12 May 2020 17:09:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7707C6E947
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 May 2020 17:09:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nR+TYmioMRxYnBg35hHfs5MNx58sZ2l2nfLmhxNJC9QewczBhj5hlxyhwZ4NIqEgBh3JGhkN5KzSx3Y8DRPjUgZFDg94iiQXBbHQsy2iF4ERz1gcfIeR2a0SzFlWO2ZgrliDaVStL/mc9t7686PIi/PEpU/zC1k9Txx3+tQwyLV5AUFXkUYB61xFUxMTM7HnPPRs7Yul1WeaEOE48U2iH2pS99SHJ0fGeAshINLsvK+OcM1WXTxze0gOek1UO49dPXH9od8onlbz10JJeKXb09NKKKF+KVxLYh5BEa+6Ix/bywAwZV4TX2I4yUbSpnWMBsxSFWyg2eH/DX7sL27l6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCtPg1+yjqPp16nqSFFTn5DQL7MQ4GvNdASd6ep4KZY=;
 b=DWzPauUnPT4gZ95gRCsOh1Fl7BEJWoioAkAWtztBZ9wyhUoztiz7eh2gE+4+iWs1eG7dkc4HfpSmN7FUKLAfI+glkAek6JTW+o8NNlB+8lUUEXMZjG1WEIHXniKYD53aYbpABCBAieo3PrmYxpBENvdvw8l28CAQZUASK4YQGgIMmdlqSCOSzGZ4cC1No84G5XlAwQHHMQfV+ujymHsYmzxR21LZsnm71kSed0PgKJjnLfcwQiXOl7W7MuFEY9AJMmYyGup71LJiNZ+m3t0RgoR3s/LFdfdCIxeZjqvl0nHSn1SwjKmLX6lDdH+q7nVMKKN/OGLPr3NqJSjsZmzxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCtPg1+yjqPp16nqSFFTn5DQL7MQ4GvNdASd6ep4KZY=;
 b=fFGtm6qyn25x4c8BwNkDj6L2gI1oeh/sbtbfbn32xeIhYI1vgh+JbjXr75d8wmL96oUPS7X6Fihusx/4YspRcVwMd8stfOvO3q6YTzjLqCKTMrTCoBtgm9c4IoGcPfaxQhXpze2K7SwIdKvDAEb4Wqtp5Eq6AkVPGbyatGuPVaw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4394.namprd12.prod.outlook.com (2603:10b6:303:54::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Tue, 12 May
 2020 17:09:31 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97%5]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 17:09:31 +0000
Subject: Re: [PATCH 1/3] drm/amd/display: Add DC Debug mask to disable
 features for bringup
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org
References: <20200512164506.26861-1-harry.wentland@amd.com>
 <20200512164506.26861-2-harry.wentland@amd.com>
 <abc30620-b441-8f03-91c1-ade40d9ebf6e@amd.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <551d3f74-77a0-47fa-b63a-120b50e926f1@amd.com>
Date: Tue, 12 May 2020 13:09:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <abc30620-b441-8f03-91c1-ade40d9ebf6e@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::37) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (99.254.88.27) by
 YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 17:09:30 +0000
X-Originating-IP: [99.254.88.27]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9b10c3cd-6c87-45ec-91c5-08d7f6973c9c
X-MS-TrafficTypeDiagnostic: MW3PR12MB4394:|MW3PR12MB4394:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4394E7FAC5A3D56297394D178CBE0@MW3PR12MB4394.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOT+3EbMRX+iF0KkVvlwECiUfYrEE9HtuH7hiUSIeXwLm0I1Lftlkv1nyg71ZTM4hW7hVUdP7u68DdJkDnoWaqMKIJTlYfZEr7uSzobXUUPJ/YI1QVqZFvdvOrHVukc/0l2CVPn4T9LCZ3TzNYJdGzLOptHkrsrurkCm2wGrQOnJww4P791wyPJmxhaec4h75DiOP5Ycakqkz6kLw98N6ZArUnxFQvq4sOInFrd2p3aaT2T3VJk1rwWsZTFOYKxePeq43RSI68NXFYmrjBhecZDqR0oO5nHdquEXj/Fy1dWwW/h1HzfvwDM9Dvg2CJiJStKwnvkGgul5EnrsHLuOiJVl0I8Kk/akOn7O6me31oQvIqz0bIObgZkOj9l45KD2nZHEadva6mJjeG7zeqNdqavoswmM84bjNxa+G+zbAYlM8kGrtgslQzRYTMljEY1B2tFpUn83+u6mwe1flGSCG+khiz84Go4Oqf99VbOQNcHvW5GZ5NaTYt5CXFRndh6XxUUTd1zCE4pv2Nsnjb1nTF8YIM6KrNBkma6vBYsXg+EeQBib8M7Fzj2zBQrXXtw0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(33430700001)(2906002)(16526019)(31686004)(52116002)(186003)(26005)(33440700001)(53546011)(6486002)(66556008)(8676002)(5660300002)(36756003)(8936002)(478600001)(31696002)(6666004)(110136005)(66476007)(66946007)(2616005)(956004)(316002)(16576012)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: I2/3YVAQ8iI9uvT44fMKx04YM/vKhonfONpmuKl3yxAmmIuCv4mNsLWmUFs7PTr8ksexAZCSX3ByXWmlv5s3EIo+ap63w7Z8BspYtyrDgXN7zyiPXxuit2C+1TyKfwdLvf9KDfEJrMmuRUGdD0pnp9FbcxM3Lwo4TGY3qZV4DNFbOkzSXQYAFL+ThQr5sIX0YmzjRlXP6JqPCmHqm3SliuBZVA4G44AQiuqpElUHG4SVjA5OoARFCh+EDyljy76ggI83JhKRb4x+Qan2Aiu+rXqzzxzplla7y1NNhnmpJNtv/141mzKrFERt3LmY4lGlQvf5Xe2y+8k5ctA4/QIqerkzcACJsLqwItMF2JkAjTWP+LSL76NdNC5yNFJOKM3N+Zu6IT3mG8FR6H2/Ge7MYYO7FAEHHwZhT+ppi7Kbfky24IiHWCrlf2CC4f2/+qFaebaOBLcsIHtgu9OZ5QXETK3tE14MNhNhbihHAeCmie0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b10c3cd-6c87-45ec-91c5-08d7f6973c9c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 17:09:31.5375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUaw60dLDu+NFEKAqojUdGbKyk71yBNkKwuFRDsGi/+cSCobiPoYGSd0yPaoDpYJZUj7tz0e2jVoih+w/pjpYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4394
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpPbiAyMDIwLTA1LTEyIDEyOjU0IHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOgo+
IE9uIDIwMjAtMDUtMTIgMTI6NDUgcC5tLiwgSGFycnkgV2VudGxhbmQgd3JvdGU6Cj4+IFtXaHld
Cj4+IEF0IGJyaW5ndXAgd2Ugd2FudCB0byBiZSBhYmxlIHRvIGRpc2FibGUgdmFyaW91cyBwb3dl
ciBmZWF0dXJlcy4KPj4KPj4gW0hvd10KPj4gVGhlc2UgZmVhdHVyZXMgYXJlIGFscmVhZHkgZXhw
b3NlZCBhcyBkY19kZWJ1Z19vcHRpb25zIGFuZCBleGVyY2lzZWQKPj4gb24gb3RoZXIgT1Nlcy4g
Q3JlYXRlIGEgbmV3IGRjX2RlYnVnX21hc2sgbW9kdWxlIHBhcmFtZXRlciBhbmQgZXhwb3NlCj4+
IHJlbGV2YW50IGJpdHMsIGluIHBhcnRpY3VsYXIKPj4gwqAgKiBEQ19ESVNBQkxFX1BJUEVfU1BM
SVQKPj4gwqAgKiBEQ19ESVNBQkxFX1NUVVRURVIKPj4gwqAgKiBEQ19ESVNBQkxFX0RTQwo+PiDC
oCAqIERDX0RJU0FCTEVfQ0xPQ0tfR0FUSU5HCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEhhcnJ5IFdl
bnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAx
ICsKPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDggKysrKysrKysKPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDE0ICsrKysrKysrKysrKysrCj4+IMKgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmjCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDcgKysrKysrKwo+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKPj4gaW5kZXggMmE4MDZjYjU1Yjc4Li4x
M2M4Y2NkYjI5NDggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdS5oCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4+IEBA
IC0xNzMsNiArMTczLDcgQEAgZXh0ZXJuIGludCBhbWRncHVfZ3B1X3JlY292ZXJ5Owo+PiDCoCBl
eHRlcm4gaW50IGFtZGdwdV9lbXVfbW9kZTsKPj4gwqAgZXh0ZXJuIHVpbnQgYW1kZ3B1X3NtdV9t
ZW1vcnlfcG9vbF9zaXplOwo+PiDCoCBleHRlcm4gdWludCBhbWRncHVfZGNfZmVhdHVyZV9tYXNr
Owo+PiArZXh0ZXJuIHVpbnQgYW1kZ3B1X2RjX2RlYnVnX21hc2s7Cj4+IMKgIGV4dGVybiB1aW50
IGFtZGdwdV9kbV9hYm1fbGV2ZWw7Cj4+IMKgIGV4dGVybiBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5m
byBtZ3B1X2luZm87Cj4+IMKgIGV4dGVybiBpbnQgYW1kZ3B1X3Jhc19lbmFibGU7Cj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPj4gaW5kZXggNTg5MDAwOTM4YWI2
Li43NjcwNzQ5MTY1N2UgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kcnYuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMKPj4gQEAgLTE0MCw2ICsxNDAsNyBAQCBpbnQgYW1kZ3B1X2VtdV9tb2RlID0gMDsKPj4g
wqAgdWludCBhbWRncHVfc211X21lbW9yeV9wb29sX3NpemUgPSAwOwo+PiDCoCAvKiBGQkMgKGJp
dCAwKSBkaXNhYmxlZCBieSBkZWZhdWx0Ki8KPj4gwqAgdWludCBhbWRncHVfZGNfZmVhdHVyZV9t
YXNrID0gMDsKPj4gK3VpbnQgYW1kZ3B1X2RjX2RlYnVnX21hc2sgPSAwOwo+PiDCoCBpbnQgYW1k
Z3B1X2FzeW5jX2dmeF9yaW5nID0gMTsKPj4gwqAgaW50IGFtZGdwdV9tY2JwID0gMDsKPj4gwqAg
aW50IGFtZGdwdV9kaXNjb3ZlcnkgPSAtMTsKPj4gQEAgLTcxNCw2ICs3MTUsMTMgQEAgTU9EVUxF
X1BBUk1fREVTQyhxdWV1ZV9wcmVlbXB0aW9uX3RpbWVvdXRfbXMsCj4+ICJxdWV1ZSBwcmVlbXB0
aW9uIHRpbWVvdXQgaW4gbXMgKDEKPj4gwqAgTU9EVUxFX1BBUk1fREVTQyhkY2ZlYXR1cmVtYXNr
LCAiYWxsIHN0YWJsZSBEQyBmZWF0dXJlcyBlbmFibGVkCj4+IChkZWZhdWx0KSkiKTsKPj4gwqAg
bW9kdWxlX3BhcmFtX25hbWVkKGRjZmVhdHVyZW1hc2ssIGFtZGdwdV9kY19mZWF0dXJlX21hc2ss
IHVpbnQsIDA0NDQpOwo+PiDCoCArLyoqCj4+ICsgKiBET0M6IGRjZGVidWdtYXNrICh1aW50KQo+
PiArICogT3ZlcnJpZGUgZGlzcGxheSBmZWF0dXJlcyBlbmFibGVkLiBTZWUgZW51bSBEQ19ERUJV
R19NQVNLIGluCj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmguCj4+
ICsgKi8KPj4gK01PRFVMRV9QQVJNX0RFU0MoZGNkZWJ1Z21hc2ssICJhbGwgZGVidWcgb3B0aW9u
cyBkaXNhYmxlZCAoZGVmYXVsdCkpIik7Cj4+ICttb2R1bGVfcGFyYW1fbmFtZWQoZGNkZWJ1Z21h
c2ssIGFtZGdwdV9kY19kZWJ1Z19tYXNrLCB1aW50LCAwNDQ0KTsKPj4gKwo+PiDCoCAvKioKPj4g
wqDCoCAqIERPQzogYWJtbGV2ZWwgKHVpbnQpCj4+IMKgwqAgKiBPdmVycmlkZSB0aGUgZGVmYXVs
dCBBQk0gKEFkYXB0aXZlIEJhY2tsaWdodCBNYW5hZ2VtZW50KSBsZXZlbAo+PiB1c2VkIGZvciBE
Qwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMKPj4gaW5kZXggNjBmZTY0YWVmMTFiLi5iZjM0N2NhNDMwNjQgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+
PiBAQCAtOTE4LDYgKzkxOCwyMCBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlCj4+ICphZGV2KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcjsK
Pj4gwqDCoMKgwqDCoCB9Cj4+IMKgICvCoMKgwqAgaWYgKGFtZGdwdV9kY19kZWJ1Z19tYXNrICYg
RENfRElTQUJMRV9QSVBFX1NQTElUKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBhZGV2LT5kbS5kYy0+
ZGVidWcuZm9yY2Vfc2luZ2xlX2Rpc3BfcGlwZV9zcGxpdCA9IGZhbHNlOwo+PiArwqDCoMKgwqDC
oMKgwqAgYWRldi0+ZG0uZGMtPmRlYnVnLnBpcGVfc3BsaXRfcG9saWN5ID0gTVBDX1NQTElUX0FW
T0lEOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIGlmIChhbWRncHVfZGNfZGVidWdfbWFz
ayAmIERDX0RJU0FCTEVfU1RVVFRFUikKPj4gK8KgwqDCoMKgwqDCoMKgIGFkZXYtPmRtLmRjLT5k
ZWJ1Zy5kaXNhYmxlX3N0dXR0ZXIgPSB0cnVlOwo+PiArCj4+ICvCoMKgwqAgaWYgKGFtZGdwdV9k
Y19kZWJ1Z19tYXNrICYgRENfRElTQUJMRV9EU0MpCj4+ICvCoMKgwqDCoMKgwqDCoCBhZGV2LT5k
bS5kYy0+ZGVidWcuZGlzYWJsZV9kc2MgPSB0cnVlOwo+PiArCj4+ICvCoMKgwqAgaWYgKGFtZGdw
dV9kY19kZWJ1Z19tYXNrICYgRENfRElTQUJMRV9DTE9DS19HQVRJTkcpCj4+ICvCoMKgwqDCoMKg
wqDCoCBhZGV2LT5kbS5kYy0+ZGVidWcuZGlzYWJsZV9jbG9ja19nYXRlID0gdHJ1ZTsKPj4gKwo+
IAo+IFNlcmllcyBpcyBSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMu
a2F6bGF1c2thc0BhbWQuY29tPgo+IAo+IE5vdGUgdGhhdCB3ZSBmaWxsIGluIGRldmljZSBkZWZh
dWx0cyBkdXJpbmcgZGNfY3JlYXRlLCBidXQgdGhlcmUgYXJlCj4gc29tZSBkZWJ1ZyBvcHRpb25z
IHdoaWNoIHdlIHVuZm9ydHVuYXRlbHkgZG8gcmVmZXJlbmNlIGR1cmluZwo+IGRjX2NyZWF0ZSgp
IGl0c2VsZiB3aGljaCB3b3VsZCBhcHBseSBzb21lIG9wdGlvbnMgdG9vIGxhdGUgaW4gdGhlIHNl
cXVlbmNlLgo+IAo+IEZvcnR1bmF0ZWx5LCBJIGRvbid0IHRoaW5rIHRoYXQncyB0aGUgY2FzZSBm
b3IgYW55IG9mIHRoZXNlIGRlYnVnCj4gb3B0aW9ucywgYnV0IGl0J3Mgc29tZXRoaW5nIHRvIGtl
ZXAgaW4gbWluZCBhdCBsZWFzdC4gVGhhdCdzIHdoYXQgdGhlCj4gaW5pdF9mbGFncyB3ZXJlIGFk
ZGVkIGZvciBJIHRoaW5rLCBhbmQgdGhvc2UgZ2VuZXJhbGx5IGhhdmUgcHJlZmVyZW5jZQo+IG92
ZXIgZGVidWcgb3B0aW9uIG92ZXJyaWRlcyB3aGVuIGF2YWlsYWJsZSAoZnJvbSBteSB1bmRlcnN0
YW5kaW5nKS4KPiAKClRoYW5rcy4KCmRjX2RlYnVnIGlzbid0IHByb3ZpZGVkIHZpYSBkY19pbml0
X2RhdGEsIHNvIHdlIGNhbiBvbmx5IG1vZGlmeSBkY19kZWJ1ZwphZnRlcndhcmRzLiBpZiBkY19j
cmVhdGUgdXNlcyBkZWJ1ZyBvcHRpb25zIHRoYXQncyBhIGJpdCB1bmZvcnR1bmF0ZSBidXQKd2Un
ZCBwcm9iYWJseSBoYXZlIHRvIGFkZHJlc3MgdGhhdCBvbmUtYnktb25lIGlmIGl0IG1hdHRlcnMu
CgpIYXJyeQoKPiBSZWdhcmRzLAo+IE5pY2hvbGFzIEthemxhdXNrYXMKPiAKPj4gwqDCoMKgwqDC
oCByID0gZG1fZG11Yl9od19pbml0KGFkZXYpOwo+PiDCoMKgwqDCoMKgIGlmIChyKSB7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoIkRNVUIgaW50ZXJmYWNlIGZhaWxlZCB0byBpbml0
aWFsaXplOgo+PiBzdGF0dXM9JWRcbiIsIHIpOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9hbWRfc2hhcmVkLmgKPj4gaW5kZXggZDY1NWE3NmJlZGM2Li45MjEyNmM1NGNiMWMgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmgKPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaAo+PiBAQCAtMTUw
LDYgKzE1MCwxMyBAQCBlbnVtIERDX0ZFQVRVUkVfTUFTSyB7Cj4+IMKgwqDCoMKgwqAgRENfUFNS
X01BU0sgPSAweDgsCj4+IMKgIH07Cj4+IMKgICtlbnVtIERDX0RFQlVHX01BU0sgewo+PiArwqDC
oMKgIERDX0RJU0FCTEVfUElQRV9TUExJVCA9IDB4MSwKPj4gK8KgwqDCoCBEQ19ESVNBQkxFX1NU
VVRURVIgPSAweDIsCj4+ICvCoMKgwqAgRENfRElTQUJMRV9EU0MgPSAweDQsCj4+ICvCoMKgwqAg
RENfRElTQUJMRV9DTE9DS19HQVRJTkcgPSAweDgKPj4gK307Cj4+ICsKPj4gwqAgZW51bSBhbWRf
ZHBtX2ZvcmNlZF9sZXZlbDsKPj4gwqAgLyoqCj4+IMKgwqAgKiBzdHJ1Y3QgYW1kX2lwX2Z1bmNz
IC0gZ2VuZXJhbCBob29rcyBmb3IgbWFuYWdpbmcgYW1kZ3B1IElQIEJsb2Nrcwo+Pgo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK

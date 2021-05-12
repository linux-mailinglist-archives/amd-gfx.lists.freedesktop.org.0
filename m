Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B072E37C6B3
	for <lists+amd-gfx@lfdr.de>; Wed, 12 May 2021 17:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DB66E23D;
	Wed, 12 May 2021 15:54:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0FE6E23D
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 May 2021 15:54:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWHFK2pMdrG+WFxwlGcE+wIu1nUHIdpI6g2EsDRlchzoyQkBzbytwTa1B7IX2UYuMPN9n2NKorUUdPD3aOGNkmhCoX0aoxEPOP6SxwKcZjCRykN889sXOM7e9Em8xdEWDPT2Bj2RsiUgeD4eS7ynHk33GxCDPjZzkNA/+vgG2C5fsmlQW+kylkC1XQ3r+LhEVMpgiC8LbC8uZea+aAdvbetsEXcs9r2e9QyauucU/+gU3g3E6KQwTuyihr+V26GuM+TCHRJH6+bUHfn3C/VW/gwjZseghTu0o4cQlG8ZJ2wU1WdJmyZmPv41Jjc+sSEK51dVaFi4hvQEepfeukAbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kc53zCu9SgUaH88JXLfQa6C5QfWNNy6kDwZejN+ECUw=;
 b=cAlNDwZSueB6jxgMPKaatfrJzzFriTq0bl3IAffKjD+eW2qV69fWGr6KXB2ObMVzr2+aOUTePj6vYBIxLoJc0CyM7PH8gth0IybxK2/V0XrbuoA/41HdlZp0GYM0DmFdjNYkhYA7EtB08GPv/HouUMUFMEf4AtV8S/k+ac+qvNZ5yOHC6/k0Pkn7Ev5sLCmswQNYkUx6PgAfmOzN+Ivu79rsf9PYnytxm0VZhUJY4Q+Zedi8Fh35DqEZZtwxVyAR4RnTSux8eOxKWHfEvZK1Mus8dmCtS+QTwYEhHunXzaHsRN2fRSc4Gd4q7BBqdtkDCfT1TJXNoSWkNdrXimBwxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kc53zCu9SgUaH88JXLfQa6C5QfWNNy6kDwZejN+ECUw=;
 b=TmOYqF6bHUWnvpVTc9l9U7dwhvq+R0iPfXerr1++LMSf/BTCclcmznkYIeSHkkgy3J7TOkWbgT/+GE8p/caXRgIqHNRC+RKwkARxfp8DwSn2lbbaQHmS5Gu7sOx7YLm90Xna8JdtZDt94UwFxCiHxQNd/KqEfyLEiSK3bPNeIMM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5146.namprd12.prod.outlook.com (2603:10b6:408:137::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 12 May
 2021 15:54:34 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4129.025; Wed, 12 May 2021
 15:54:34 +0000
Subject: Re: [PATCH] drm/amdgpu: flush TLB if valid PDE turns into PTE
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Philip Yang <Philip.Yang@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210512123451.25900-1-Philip.Yang@amd.com>
 <6fd68338-f7b9-5ffc-70e7-45920149bfcf@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <3fa73d87-bd13-4f60-b737-a5a7e0293a1d@amd.com>
Date: Wed, 12 May 2021 11:54:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <6fd68338-f7b9-5ffc-70e7-45920149bfcf@gmail.com>
Content-Language: en-US
X-Originating-IP: [142.116.138.207]
X-ClientProxiedBy: YTOPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::45) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.138.207) by
 YTOPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 15:54:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d5b1f2c-a49e-4098-9b31-08d9155e3ca6
X-MS-TrafficTypeDiagnostic: BN9PR12MB5146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB51463CF2C21FD0813354F34A92529@BN9PR12MB5146.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cRqj9aDNPHIfLJDwTyJpf+H1udsl+Mv8VwG+Bqpy6Ji8lW6h0T2E5Cx0+BDUXpb9Y4yziAAdGak0dKFiqn3S1+wKP6Pg+KBrk+NVMx3q/TSTFmDWl+rMwamznT3Mz9Cb3Cv9rBZxBCrTIe1t5woADNd2pf0xU9LYIywLV7hOpRLmLC6d/1OL6zWXP/2RN48XAxs36C9/5dJDaG6LDIugBbdKJ+1tEvovbDHhT74U28sF8FU0ssuUGQ0Z/Gbp+AzFYM60nJt/8gd3iRm2MJ2L+E22Yx8E5FopcOuZReSVYz7gEfpfNsqP2H5Smp/PQrhmTM4xYqM+FhCGMc/M2w+iGq6nFLhQ1oDGLldCv+CMA5nMesk2/BaFuGdddry68OBXCYEUxhWku8EjOlohRzGqWD+glm873wz11a4dwznhUt0XeUVG9ZAaZpotKt6saBXuv4GFeZ7LxUPFTXJLCzJJg+BAxB5BEfC8zo37gn/P4Q7QGW4E+np/mWzVVzbKPRt7LJxOMBRXkb/sVrYroSi4d8f4QiyBINcrAWvcAGVAGMor5sQDyCuOuEC3PKmKrCPjC25SMTGGWIXXz/rDDz/0wPGkapXvKadUAd9vstVEqlYs8qkdlGoXxBqqAP5xSRpHNPGhcK0RJEgkWxOZKgU6JZ/8uTTba4yeVE6rARNE7xxlieynJJm4PuVbHgmh1DrkmvP8ShQTP+1BjyMUPi3MTQ7HN3BmoAxoiushJa0iwPg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(66574015)(31686004)(86362001)(36756003)(26005)(8676002)(31696002)(38100700002)(83380400001)(8936002)(316002)(16526019)(5660300002)(478600001)(16576012)(2906002)(110136005)(966005)(66946007)(66476007)(186003)(66556008)(44832011)(2616005)(6486002)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?LzE2eCtMMlZwaVErakxkQ0YrY21xbzR5WDJjb1UzV1NJRm5odDZCWlMvU0po?=
 =?utf-8?B?TEpjUjJCWk5Tdmw2TU5lT0o5NWo4RjJDZHd4Q2pncFFKZmh1NFpmRjRjMkY0?=
 =?utf-8?B?c00rWWt4MGI3STlwWkg5VEkvRE12L2hnYUtiRHo3aHZsOUdWMk9iWU1wL0Rl?=
 =?utf-8?B?akpmRU5rbDNCWm9Ob29IRUgwQkVUN2tJV3VuMUloQitSS3V4L3N0SkVhTFdK?=
 =?utf-8?B?d3pLRzlSTnVlalNnLzdZVVVhSzJJbXR4dEFmN3hRaUkwSTFJZEQxSkdsaEx3?=
 =?utf-8?B?bTI1cC9vTEpHU0poUzdXalYxcWZxc0RqVm9JTFhFMnVQdTF0Q1hzMGVNbmhs?=
 =?utf-8?B?WEIraSs3T25LN3JZSWpqeGJpc3hRRTlNWDBjaGQrOWpHcDRvZmN6NENOWkRC?=
 =?utf-8?B?cGF0ZEdxU2pBVEhNaS80LzY4Nk5RVjBUaVBhQzdJcEljSzlTa3U4ei9lajly?=
 =?utf-8?B?L0NneHVTUTZnblBVZUM2ai9NbWRNOEVJSk8zZldhMmt4RlhYeHlKZ0Z4MXNP?=
 =?utf-8?B?Z2RKOFRMbG9rV1VIaEdpY2lUMkIwZWNvbFFXRW91WStwQlBFSVRsNDFhSE5B?=
 =?utf-8?B?dDBBcVRSc0dOUll2L0Q2a1hHWHpTQWIxaTJSVEhIRzhhWTNQRVozRVEybXEv?=
 =?utf-8?B?Tkp5NnNxYnZ1eElmQTlZa1Nwd3lkbWw3YnJaYzhkUmlUU2ErSmR3ZVlFK2JW?=
 =?utf-8?B?U3gyTW9zcUYxN1BCSkZMbFdqTXJIbC9weHZSM3YwTkYvYUViemtnT005UmUw?=
 =?utf-8?B?LzVHVWFiVGUrSXgrUkh6N04wbElBNmVnOFRaRGRIS0hNWVlOWlFLQ29BMm52?=
 =?utf-8?B?TjdUcWZHWVQyU0srWE5iL2MxWDJLMlVDQitJZHFmWXkwRlp0WkpuaWE2WlMv?=
 =?utf-8?B?ZDE0OUY3ZU1RaEdnV1dKYWlyZTZ3SlhnUEZiY0pnd2lTSkQxZkxaamlOcW10?=
 =?utf-8?B?Mm1lTzJZVExzWjFuSVl2VzE1MGhwdkZJSmNmWDJYU2hHZnJmR0dkaWxSL05Q?=
 =?utf-8?B?MHd4S1FWakducXBMdVNxanJuTnFSZjRINjB0Y09CWkJrT0xFckJtZERCMG9n?=
 =?utf-8?B?NHlSeVNwMXBGSVY2Y1V2ZEJHWkF5eEt0QytKZFY0cjlhWHRjQW8rZUJYeTkx?=
 =?utf-8?B?NGE1R08wck1ZeU5TT2w3bHRJSFB3cmlsb1UwWjVxOGRHcUJyRS9nWHMzSmxI?=
 =?utf-8?B?RUtRL3JOejlhKzFlTEJKSkR6QWJSNFFVM0VFMjRBb01kWmZRNm80YlU3ZUdP?=
 =?utf-8?B?bTVnYmFMS2NpOGlhSytWTytKbUdmK0paZ0EwdEpoNkpVUGUxZVFVeGpqY0Z4?=
 =?utf-8?B?bzlvZXZlcUdPOXVoQUY2eEt4R1llNDhjYTRTUUpsR2pkb29qcVVLMURoTm1x?=
 =?utf-8?B?aFU1Y2hLSzlhTDhGVjZiWGdtV3g4RngwU2lVaFY0eHd2NlNyMWVwcElFdVVm?=
 =?utf-8?B?eGJ3OWVvWWpKSFlJbGQxdi9rZndpQ2JkNDJyUHpCRjNZaE5NaFRBblZleTZX?=
 =?utf-8?B?UFo5UlBvb0szRkdYT2RDb2hSYmxGRW1FODF4MzExSVFhNGxvWHd1MDk4Q05N?=
 =?utf-8?B?YXpiZzZWdlYxcHZ2aEJZQ1JoUVpjYVNreWJGYnJUdTFIZ3hmZzhydDZkajlV?=
 =?utf-8?B?bUdkaFJrbXl2YmNuUEFsbWZZZHRIMlBJaDl1ZG9jbmZEZHduNUFVV2pLTkpo?=
 =?utf-8?B?ME9BYmk3QXp2WDhpaVhydVE2RlNVc1NIMCs5UE1keUtWNmJRZEoxMThLbENI?=
 =?utf-8?B?V1Vxcjl5ekJjMGtwZUE5OER4K1RGZ3I2NVk1enE5bDR3dUgyb0taU1p4NkRR?=
 =?utf-8?B?enVwbytwaWYrdlJOWWdOQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5b1f2c-a49e-4098-9b31-08d9155e3ca6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 15:54:33.9770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9lYvivxEqEMBNYPFJo7ZGznFRc25P7LGBzc5Svp23cCPIj7d1/Hdlby5w41TE2NLay5w7KphVEh5fEzpgaqow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5146
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

QW0gMjAyMS0wNS0xMiB1bSA4OjM4IGEubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Cj4K
PiBBbSAxMi4wNS4yMSB1bSAxNDozNCBzY2hyaWViIFBoaWxpcCBZYW5nOgo+PiBNYXBwaW5nIGh1
Z2UgcGFnZSwgMk1CIGFsaWduZWQgYWRkcmVzcyB3aXRoIDJNQiBzaXplLCB1c2VzIFBERTAgYXMg
UFRFLgo+PiBJZiBwcmV2aW91c2x5IHZhbGlkIFBERTAsIFBERTAuVj0xIGFuZCBQREUwLlA9MCB0
dXJucyBpbnRvIFBURSwgdGhpcwo+PiByZXF1aXJlcyBUTEIgZmx1c2gsIG90aGVyd2lzZSBwYWdl
IHRhYmxlIHdhbGtlciB3aWxsIG5vdCByZWFkIHVwZGF0ZWQKPj4gUERFMC4KPj4KPj4gQ2hhbmdl
IHBhZ2UgdGFibGUgdXBkYXRlIG1hcHBpbmcgdG8gcmV0dXJuIGZyZWVfdGFibGUgZmxhZyB0byBp
bmRpY2F0ZQo+PiB0aGUgcHJldmlvdXNseSB2YWxpZCBQREUgbWF5IGhhdmUgdHVybmVkIGludG8g
YSBQVEUgaWYgcGFnZSB0YWJsZSBpcwo+PiBmcmVlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGhp
bGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDE3ICsrKysrKysrKysrLS0tLS0tCj4+IMKgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIHzCoCAyICstCj4+IMKgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uY8KgwqAgfCAxMiArKysrKysrKysrLS0KPj4g
wqAgMyBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+PiBpbmRleCAzZGNkY2M5
ZmY1MjIuLjI3NDE4Zjk0MDdmMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmMKPj4gQEAgLTE0NTcsNyArMTQ1Nyw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV92bV9m
cmFnbWVudChzdHJ1Y3QKPj4gYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnBhcmFtcywKPj4gwqDC
oCAqLwo+PiDCoCBzdGF0aWMgaW50IGFtZGdwdV92bV91cGRhdGVfcHRlcyhzdHJ1Y3QgYW1kZ3B1
X3ZtX3VwZGF0ZV9wYXJhbXMKPj4gKnBhcmFtcywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHVpbnQ2NF90IHN0YXJ0LCB1aW50NjRfdCBlbmQsCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50NjRfdCBkc3QsIHVpbnQ2NF90IGZsYWdzKQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3QgZHN0LCB1aW50NjRfdCBm
bGFncywgYm9vbCAqZnJlZV90YWJsZSkKPgo+IFBsZWFzZSBwdXQgdGhhdCBmbGFnIGludG8gdGhl
IHBhcmFtcyBzdHJ1Y3R1cmUgaW5zdGVhZC4KPgo+IENocmlzdGlhbi4KCkkgYWdyZWUuIENocmlz
dGlhbiwgSSB0aGluayB3ZSBhbHNvIG5lZWQgdG8ga2VlcCB0cmFjayBvZiB0aGlzIGZvcgpncmFw
aGljcyBjb21tYW5kIHN1Ym1pc3Npb25zLiBhbWRncHVfY3Nfdm1faGFuZGxpbmcgbmVlZHMgZ2V0
IHRoaXMgZmxhZwpmcm9tIGFtZGdwdV92bV9ib191cGRhdGUsIGFuZCBhbWRncHVfY3Nfc3VibWl0
IG5lZWRzIHRvIHVwZGF0ZQpqb2ItPnZtX25lZWRzX2ZsdXNoZWQgYmFzZWQgb24gdGhpcy4KClJl
Z2FyZHMsCsKgIEZlbGl4CgoKPgo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSBwYXJhbXMtPmFkZXY7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV92
bV9wdF9jdXJzb3IgY3Vyc29yOwo+PiBAQCAtMTU4Myw2ICsxNTgzLDggQEAgc3RhdGljIGludCBh
bWRncHVfdm1fdXBkYXRlX3B0ZXMoc3RydWN0Cj4+IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpw
YXJhbXMsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdoaWxlIChjdXJzb3IucGZuIDwg
ZnJhZ19zdGFydCkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFtZGdw
dV92bV9mcmVlX3B0cyhhZGV2LCBwYXJhbXMtPnZtLCAmY3Vyc29yKTsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhbWRncHVfdm1fcHRfbmV4dChhZGV2LCAmY3Vyc29yKTsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZnJlZV90YWJsZSkKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICpmcmVlX3RhYmxlID0gdHJ1ZTsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAg
fSBlbHNlIGlmIChmcmFnID49IHNoaWZ0KSB7Cj4+IEBAIC0xNjEwLDYgKzE2MTIsNyBAQCBzdGF0
aWMgaW50IGFtZGdwdV92bV91cGRhdGVfcHRlcyhzdHJ1Y3QKPj4gYW1kZ3B1X3ZtX3VwZGF0ZV9w
YXJhbXMgKnBhcmFtcywKPj4gwqDCoCAqIEBub2RlczogYXJyYXkgb2YgZHJtX21tX25vZGVzIHdp
dGggdGhlIE1DIGFkZHJlc3Nlcwo+PiDCoMKgICogQHBhZ2VzX2FkZHI6IERNQSBhZGRyZXNzZXMg
dG8gdXNlIGZvciBtYXBwaW5nCj4+IMKgwqAgKiBAZmVuY2U6IG9wdGlvbmFsIHJlc3VsdGluZyBm
ZW5jZQo+PiArICogQGZyZWVfdGFibGU6IHJldHVybiB0cnVlIGlmIHBhZ2UgdGFibGUgaXMgZnJl
ZWQKPj4gwqDCoCAqCj4+IMKgwqAgKiBGaWxsIGluIHRoZSBwYWdlIHRhYmxlIGVudHJpZXMgYmV0
d2VlbiBAc3RhcnQgYW5kIEBsYXN0Lgo+PiDCoMKgICoKPj4gQEAgLTE2MjQsNyArMTYyNyw4IEBA
IGludCBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcoc3RydWN0Cj4+IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3QgZmxh
Z3MsIHVpbnQ2NF90IG9mZnNldCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGVzLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRtYV9hZGRyX3QgKnBhZ2VzX2FkZHIsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlKQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBib29sICpmcmVlX3RhYmxlKQo+PiDCoCB7Cj4+IMKgwqDCoMKg
wqAgc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zIHBhcmFtczsKPj4gwqDCoMKgwqDCoCBl
bnVtIGFtZGdwdV9zeW5jX21vZGUgc3luY19tb2RlOwo+PiBAQCAtMTcyMSw3ICsxNzI1LDggQEAg
aW50IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QKPj4gYW1kZ3B1X2RldmljZSAq
YWRldiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgIHRt
cCA9IHN0YXJ0ICsgbnVtX2VudHJpZXM7Cj4+IC3CoMKgwqDCoMKgwqDCoCByID0gYW1kZ3B1X3Zt
X3VwZGF0ZV9wdGVzKCZwYXJhbXMsIHN0YXJ0LCB0bXAsIGFkZHIsIGZsYWdzKTsKPj4gK8KgwqDC
oMKgwqDCoMKgIHIgPSBhbWRncHVfdm1fdXBkYXRlX3B0ZXMoJnBhcmFtcywgc3RhcnQsIHRtcCwg
YWRkciwgZmxhZ3MsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZnJlZV90YWJsZSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocikKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcl91bmxvY2s7Cj4+IMKgIEBAIC0xODc5LDcgKzE4
ODQsNyBAQCBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZQo+PiAq
YWRldiwgc3RydWN0IGFtZGdwdV9ib192YSAqYm9fdmEsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc3YsIG1hcHBpbmctPnN0YXJ0LAo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXBwaW5n
LT5sYXN0LCB1cGRhdGVfZmxhZ3MsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG1hcHBpbmctPm9mZnNldCwgbm9kZXMsCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhZ2VzX2FkZHIsIGxhc3RfdXBk
YXRlKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cGFnZXNfYWRkciwgbGFzdF91cGRhdGUsIE5VTEwpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHIpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByOwo+PiDCoMKgwqDCoMKg
IH0KPj4gQEAgLTIwOTAsNyArMjA5NSw3IEBAIGludCBhbWRncHVfdm1fY2xlYXJfZnJlZWQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UKPj4gKmFkZXYsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByID0gYW1k
Z3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKGFkZXYsIGFkZXYsIHZtLCBmYWxzZSwgZmFsc2UsCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc3Ys
IG1hcHBpbmctPnN0YXJ0LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBtYXBwaW5nLT5sYXN0LCBpbml0X3B0ZV92YWx1ZSwKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCwgTlVMTCwgTlVMTCwgJmYp
Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwLCBO
VUxMLCBOVUxMLCAmZiwgTlVMTCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBhbWRncHVfdm1fZnJl
ZV9tYXBwaW5nKGFkZXYsIHZtLCBtYXBwaW5nLCBmKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChyKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQoZik7Cj4+
IEBAIC0zNDI4LDcgKzM0MzMsNyBAQCBib29sIGFtZGdwdV92bV9oYW5kbGVfZmF1bHQoc3RydWN0
Cj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiBwYXNpZCwKPj4gwqDCoMKgwqDCoCB9Cj4+IMKg
IMKgwqDCoMKgwqAgciA9IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhhZGV2LCBhZGV2LCB2
bSwgdHJ1ZSwgZmFsc2UsCj4+IE5VTEwsIGFkZHIsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBhZGRyLCBmbGFncywgdmFsdWUsIE5VTEwsIE5VTEwsCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhZGRyLCBmbGFncywgdmFsdWUsIE5V
TEwsIE5VTEwsIE5VTEwsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBOVUxMKTsKPj4gwqDCoMKgwqDCoCBpZiAocikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdv
dG8gZXJyb3JfdW5sb2NrOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZtLmgKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
aAo+PiBpbmRleCBlYTYwZWMxMjJiNTEuLmY2MWMyMGI3MGI3OSAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKPj4gQEAgLTQwNCw3ICs0MDQsNyBAQCBpbnQgYW1k
Z3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKHN0cnVjdAo+PiBhbWRncHVfZGV2aWNlICphZGV2LAo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQ2NF90IGZsYWdzLCB1aW50
NjRfdCBvZmZzZXQsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IGRybV9tbV9ub2RlICpub2RlcywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkbWFfYWRkcl90ICpwYWdlc19hZGRyLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlLCBib29sICpmcmVlX3RhYmxlKTsKPj4g
wqAgaW50IGFtZGdwdV92bV9ib191cGRhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfYm9fdmEgKmJvX3ZhLAo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIGNsZWFyKTsKPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uYwo+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9zdm0uYwo+PiBpbmRleCBiNjY1ZTlmZjc3ZTMuLjRmMjgwNTJkNDRi
ZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3N2bS5jCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uYwo+PiBAQCAtMTA4NCw3
ICsxMDg0LDcgQEAgc3ZtX3JhbmdlX3VubWFwX2Zyb21fZ3B1KHN0cnVjdCBhbWRncHVfZGV2aWNl
Cj4+ICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKPj4gwqAgwqDCoMKgwqDCoCByZXR1cm4g
YW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKGFkZXYsIGFkZXYsIHZtLCBmYWxzZSwKPj4gdHJ1
ZSwgTlVMTCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0YXJ0LCBsYXN0LCBpbml0X3B0ZV92YWx1ZSwgMCwKPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5VTEwsIE5VTEwsIGZlbmNlKTsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5VTEwsIE5VTEwsIGZlbmNl
LCBOVUxMKTsKPj4gwqAgfQo+PiDCoCDCoCBzdGF0aWMgaW50Cj4+IEBAIC0xMTM3LDEyICsxMTM3
LDE1IEBAIHN2bV9yYW5nZV9tYXBfdG9fZ3B1KHN0cnVjdCBhbWRncHVfZGV2aWNlCj4+ICphZGV2
LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYm9fYWRldiwgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlKQo+
PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9ib192YSBib192YTsKPj4gK8KgwqDC
oCBib29sIGZyZWVfdGFibGUgPSBmYWxzZTsKPj4gK8KgwqDCoCBzdHJ1Y3Qga2ZkX3Byb2Nlc3Mg
KnA7Cj4+IMKgwqDCoMKgwqAgdWludDY0X3QgcHRlX2ZsYWdzOwo+PiDCoMKgwqDCoMKgIGludCBy
ID0gMDsKPj4gwqAgwqDCoMKgwqDCoCBwcl9kZWJ1Zygic3ZtcyAweCVwIFsweCVseCAweCVseF1c
biIsIHByYW5nZS0+c3ZtcywKPj4gcHJhbmdlLT5zdGFydCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcHJhbmdlLT5sYXN0KTsKPj4gwqAgK8KgwqDCoCBwID0gY29udGFpbmVyX29mKHByYW5nZS0+
c3Ztcywgc3RydWN0IGtmZF9wcm9jZXNzLCBzdm1zKTsKPj4gwqDCoMKgwqDCoCBpZiAocHJhbmdl
LT5zdm1fYm8gJiYgcHJhbmdlLT50dG1fcmVzKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBib192
YS5pc194Z21pID0gYW1kZ3B1X3hnbWlfc2FtZV9oaXZlKGFkZXYsIGJvX2FkZXYpOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgcHJhbmdlLT5tYXBwaW5nLmJvX3ZhID0gJmJvX3ZhOwo+PiBAQCAtMTE1
OSw3ICsxMTYyLDggQEAgc3ZtX3JhbmdlX21hcF90b19ncHUoc3RydWN0IGFtZGdwdV9kZXZpY2UK
Pj4gKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJhbmdlLT5tYXBwaW5nLm9mZnNldCwKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByYW5nZS0+dHRtX3JlcyA/Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByYW5nZS0+
dHRtX3Jlcy0+bW1fbm9kZSA6IE5VTEwsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkbWFfYWRkciwgJnZtLT5sYXN0X3VwZGF0ZSk7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfYWRkciwgJnZtLT5sYXN0X3VwZGF0ZSwKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZmcmVlX3RhYmxlKTsKPj4g
wqDCoMKgwqDCoCBpZiAocikgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfZGVidWcoImZhaWxl
ZCAlZCB0byBtYXAgdG8gZ3B1IDB4JWx4XG4iLCByLCBwcmFuZ2UtPnN0YXJ0KTsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+PiBAQCAtMTE3NSw2ICsxMTc5LDEwIEBAIHN2bV9yYW5n
ZV9tYXBfdG9fZ3B1KHN0cnVjdCBhbWRncHVfZGV2aWNlCj4+ICphZGV2LCBzdHJ1Y3QgYW1kZ3B1
X3ZtICp2bSwKPj4gwqDCoMKgwqDCoCBpZiAoZmVuY2UpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAq
ZmVuY2UgPSBkbWFfZmVuY2VfZ2V0KHZtLT5sYXN0X3VwZGF0ZSk7Cj4+IMKgICvCoMKgwqAgaWYg
KGZyZWVfdGFibGUpCj4+ICvCoMKgwqDCoMKgwqDCoCBhbWRncHVfYW1ka2ZkX2ZsdXNoX2dwdV90
bGJfcGFzaWQoKHN0cnVjdCBrZ2RfZGV2ICopYWRldiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHAtPnBhc2lkKTsKPj4gKwo+PiDCoCBvdXQ6
Cj4+IMKgwqDCoMKgwqAgcHJhbmdlLT5tYXBwaW5nLmJvX3ZhID0gTlVMTDsKPj4gwqDCoMKgwqDC
oCByZXR1cm4gcjsKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK

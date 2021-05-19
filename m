Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76775389278
	for <lists+amd-gfx@lfdr.de>; Wed, 19 May 2021 17:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44726EDF7;
	Wed, 19 May 2021 15:22:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00376EDF7
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 May 2021 15:22:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iD9p3HHqBE2faiAaFnR4RwKfh3gFniNWUETFxU1LMeiqjQayZfi2HXPbiMN8MLHl0kSF4h0jAEo18AjHqMsixvMmN5JOkx8m7XYTgPWCBqWOf9NlY0x2UA6bfCsAhYEshCDPqszdvvBsaSlUmaTNjPHGiWdCZZR7qcozp7TpuRMrzK58ZVTzGwLV5F339I0ZDsGoab59Ef27oZgHvu63qq6kjYNHU3+YdDSSsRRjp5SJz6ep0fEz7nFgotas6FOwDuPMi0bQQdBmhWqW1jy7HX1XewsN/ci0eC+Qk4UnSegY+QP+TDBcNvDpSI7I0tHqvgalenmfrqQrN+sK8qsUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6eqlrbDfw3LbRaGR+iaX+VnI/GuG4LBPRLl4QXgiNw=;
 b=M8SSKaguVsVJpoczdS+DsqVmhbjh0Lrq4EagwfmM4sOZZkNZDHyxX9GIANa1ij2zWdDru3R7mdthYq6eU08m5JC6hvioBjvRNzh8OeRGIkKBQawUXEyjH7yhL80d6pSJdlJAE3QCqDCyp8YpRN6ztHMcExIBxt8tGDI6XHplQnQWdsPOXlfVQZcVCdqvxb/aAV+ZHcat/5h79Rr1DST3irvGfq7R/ULNTn4SJ1dkG1krqPB4MGqFyx3A4oKnnjPczzVL2EXMk85aXuvMlIMOWbRB/SrGAcd8kgvVBuW3ZGBgPmNyWxxkAUqM109pmvcu+AQOWSY5CXRPvp77aQmtOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6eqlrbDfw3LbRaGR+iaX+VnI/GuG4LBPRLl4QXgiNw=;
 b=33R2VO6pQKfi31fC4dPA0/B8KfjbX0J4u3392IQfNK03kfTGjPaLbHtC2s9a0JxGSjaja6+CTTAxUBsroPXHfoCmggDj4CS7jjXlbJY6Bzs2VVksNGFYX58LNbW8Yyc2SUgRx5jpFhlELfPC9XqBuEFuW1DmTErmDYr6hZaeLLg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5367.namprd12.prod.outlook.com (2603:10b6:408:104::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 15:22:50 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 15:22:50 +0000
Subject: Re: [PATCH 1/3] drm/amdgpu: Add new domain for preemptible SG BOs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org
References: <20210519054536.4690-1-Felix.Kuehling@amd.com>
 <f6f2efa4-bcc7-aa45-cac9-5ec25b90c322@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <36d2e4c2-05e7-80f3-be51-89a714113672@amd.com>
Date: Wed, 19 May 2021 11:22:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <f6f2efa4-bcc7-aa45-cac9-5ec25b90c322@gmail.com>
Content-Language: en-US
X-Originating-IP: [142.186.56.206]
X-ClientProxiedBy: YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::35) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.56.206) by
 YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Wed, 19 May 2021 15:22:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da2cfb8f-1b00-4276-969a-08d91ad9f6df
X-MS-TrafficTypeDiagnostic: BN9PR12MB5367:
X-Microsoft-Antispam-PRVS: <BN9PR12MB536745DF769178072F32F2EF922B9@BN9PR12MB5367.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7lTBwKDVJAtQ9xxitTnbfJ86WHRMZZ0Wnlg1tjhgecBW3AE4RWxJsb1PjqSAnJ/7WFFqlBfOh2DrSU5/VjCgpUE7juNWho7cRUVCL050pyCMPbJBjV807YO1HPAsmbLW6eyVr+7kPbQw8ekHgcMmK9fjPl5CL5XxMvXAV12wii36Oszq+D6mqxa7SxAyrFT9XXIoEL3o0kSFmX6xC+vQ/Dswzh8ZYcDVb8rIitv/r+Pr717wFJ0QPYc5sCuatq6HBcwgcQs61yfMUiTp2VVd8CFWE0rAIYRZOUCDDMn+JceErWOAIMcDcz8KZ3ZJ6qijW0aqsjUcoPLGMqj1JEiVVzGFuNlkjaaE1n/xgdPvLLx0EWprXWFQ8X9UcpcCmvCU1121lad7D02lsMX3kIosLomgDtoLa+odByu6MLkDFx6Tdxe+QFSgxWxcbeuhnLBs7xXX5ux2Ri7kkZUCsjjskM+N6DAcW41/BvDU5hZ00X6PUE4+yq770iZprCRo3TIdFOO7MHuNgTaIj+LGZq13JB1rlmKcVfqpVk87IffPdeGft4TceiG36fYxRJRIDp0NFAHffgJTENifAdFK/56DDSixc06l6ChJJr2KwUpz8/xojIMw8Db9/P2KOv+KLa8oFAiQrPUoyW6/On2jbglWkCphbzeL9oilPAeQeQ+hHETba1M6PVl3oymmYfeZxLCO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(83380400001)(6486002)(8936002)(66476007)(66556008)(16576012)(8676002)(478600001)(2906002)(36756003)(86362001)(66946007)(31686004)(5660300002)(38100700002)(26005)(30864003)(31696002)(16526019)(186003)(66574015)(316002)(2616005)(956004)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MlhrQWVxZ05YS1JqeWkzSVF6Z1ZNQzIyM29RTGdZU0xWOWEzSzNWWmtWSklu?=
 =?utf-8?B?dDZqSmJTbnBTVHc5ejJwVzJnUmN6NlE3eCthVHhpN0xtaEpIWGZQVlJoMzhB?=
 =?utf-8?B?RTc3VFZ2ZXpLTWRkN2dEZWllUFVtODRxL1pzS0JxaXZrQzhST0JmdlJZcitm?=
 =?utf-8?B?anBVaTlPSEFQbmR2bHVlR3AzYW1jUU1xR3NaQmowRU5nbmFFNmg0ZzhFWk9h?=
 =?utf-8?B?dXVDZXBqQ0txVERyUWpTSFBabXNxcVV4UlZVd0tSMlZNT2dLellJR09FTHl3?=
 =?utf-8?B?Sk9GalJhUzIydm9XdUJrTWdsd2x2ZWduOFhLbEltR0ZlSWVlcFBNaE9QQkN2?=
 =?utf-8?B?bVMxaU1BeHpwbTYzOURtamxQU09MTW1VQTJjZWZjV2d2QlNMaXg2Vlh3V1Bl?=
 =?utf-8?B?RjdHR25QNGhRbHVKcSs5UmlqQUFrSkczSG4wa1I4bFRlOUw0Rk9EOHk2Y0hy?=
 =?utf-8?B?NGx2VjVJSlFBRjR1YUhhdk1uMVN5S0wvbmdaUzEzMkhENUpkZkk5SnBRcC96?=
 =?utf-8?B?ODRmWUZFQ2Z5OWhISW9McjB2L0Q1RVJXb2pyRndFelQvazk4NDROTjJuZUQ1?=
 =?utf-8?B?RlF5SVlMdG5GTjV5emk4bnd4S0lORHNRWTY1NnE1aGp1RVBEWTFWSXFzSkpI?=
 =?utf-8?B?K1I1aWpOWWRJMDU2bGE0d0NrU1BBQUdOeEVFOS9vS3llYVkrM3dxWkI0SEZs?=
 =?utf-8?B?RFFBVDZXMFBRTnB4L2dNOGF1enFJa0RUbWdVeE1xak1Yem9hQ0tnRXBHeExv?=
 =?utf-8?B?eStSV2kyYmN6NGoxWlVoM0g5UmYyK0d2VnpJYmwzaG45N0VhcGdHYjhPTU1r?=
 =?utf-8?B?cCszS2sreDhxcHNyNkJkcXkvTjNoUlhyVzlkUmpCdDQrbHFySllFVzhFMzgz?=
 =?utf-8?B?b2ZYNURJOGhFRVN4d1JVYzV2dnV0anh5dU8rSlpHMDBFSTNraGlsZXFpc2l3?=
 =?utf-8?B?T0E0TkVmZG5MbFZqMTliRExyU3doZ3ByTWxZTGZUVzU1UDV3SS9kYlFSaEt4?=
 =?utf-8?B?K1JJMjRBUUNQZ0FOeWNlcjNtckZaUllmNE9Lank4ZUtwUnluSWJQVEhQR2I3?=
 =?utf-8?B?WXo2L002dHBXaVNtRXlPelg1Y1BlZVJJUkRVQ0VVS1U3bDdjN3AzcHFTOG5Y?=
 =?utf-8?B?TmZrbEhUc283L0lOa3V1OExEK1dqSUVMcTBDc29ubVRJbk4vd082YzYxRWxh?=
 =?utf-8?B?SDF6M2dvYWRyeWc5MWpLYmo1Rm5iWnBJME1HbUVUYnJ0RUhBUU5TK0xqc2lK?=
 =?utf-8?B?NVc4NGV1dWVXZDFvU045QTA3VW9XaEUvWDVTYlY4QjA1N2ZlZzNlYnFSUFZi?=
 =?utf-8?B?U1I2TyszN25CK2xPN2ZmK3ZYV3JpWG9OczZaMHNqNmo2dmdNdjhTbHMxNklI?=
 =?utf-8?B?WVFkZEpEaWZGYTdtK1NxODdENWFuNnRCZm1qOVBiRnVjeStDNVRKbE15cmJB?=
 =?utf-8?B?K1lWWWs5clc2SzZ5aEhCbVh3UWNpbzB0aWxOdjNDaEZ4eHdXcjRzWUNGSG9W?=
 =?utf-8?B?bUQ2ZTNpT1BMR0ordHpCc3hHNCtTWVdJVkI2aFUyK1FXUFpuTkgrSUZHVFJ5?=
 =?utf-8?B?cGFiR2xQUVhnTmhCalVSNVNicHBRV3kxWE9DejJ2ZDhhQUQrN1JTaHdpTHZE?=
 =?utf-8?B?YTgxdXpwcVErRkUzektuNUhNUHZ6S1NyV21ZVmZveW4vTlB5Ykd5Ymorck9n?=
 =?utf-8?B?cXZZRnFINjUzdU9adjZqNjRveGRwc2gxSEpOZmFZSkJVUkxuUDdZMjBGVkpx?=
 =?utf-8?Q?raofcSjMYRW+ZEgCoTinIx8pgr5E2YKN9UIqssc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2cfb8f-1b00-4276-969a-08d91ad9f6df
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 15:22:50.2774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lU2hSviFs0xu2tr//sclDcxu/lp9S+7L2j9/IDvseJdfe9tcYGn2YDatVyZb7mP/W2ATahzeCsIFbDDETAwz/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5367
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

QW0gMjAyMS0wNS0xOSB1bSA2OjA0IGEubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFt
IDE5LjA1LjIxIHVtIDA3OjQ1IHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6Cj4+IFNHIEJPcyBzdWNo
IGFzIGRtYWJ1ZiBpbXBvcnRzIGFuZCB1c2VycHRyIEJPcyBkbyBub3QgY29uc3VtZSBzeXN0ZW0K
Pj4gcmVzb3VyY2VzIGRpcmVjdGx5LiBJbnN0ZWFkIHRoZXkgcG9pbnQgdG8gcmVzb3VyY2VzIG93
bmVkIGVsc2V3aGVyZS4KPj4gVGhleSB0eXBpY2FsbHkgZ2V0IGV2aWN0ZWQgYnkgRE1BQnVmIG1v
dmUgbm90aWZpZXJzIG9mIE1NVSBub3RpZmllcnMuCj4+IElmIHRob3NlIG5vdGlmaWVycyBkb24n
dCBuZWVkIHRvIHdhaXQgZm9yIGhhcmR3YXJlIGZlbmNlcyAoaS5lLiB0aGUgU0cKPj4gQk9zIGFy
ZSB1c2VkIGluIGEgcHJlZW1wdGlibGUgY29udGV4dCksIHRoZW4gd2UgZG9uJ3QgbmVlZCB0byBs
aW1pdAo+PiB0aGVtIHRvIHRoZSBHVFQgc2l6ZSBhbmQgd2UgZG9uJ3QgbmVlZCBUVE0gdG8gZXZp
Y3QgdGhlbS4KPj4KPj4gQ3JlYXRlIGEgbmV3IGRvbWFpbiBmb3Igc3VjaCBwcmVlbXB0aWJsZSBT
RyBCT3MgdGhhdCBkb2VzIG5vdCBpbXBvc2UKPj4gYXJ0aWZpY2lhbCBzaXplIGxpbWl0cyBhbmQg
VFRNIGV2aWN0aW9ucy4KPgo+IFBsZWFzZSBkb24ndCBjcmVhdGUgYW4gR0VNIGRvbWFpbiBmb3Ig
dGhpcy4gVGhpcyBoYXMganVzdCB0byBtdWNoCj4gcG90ZW50aWFsIHRvIGJlIGFidXNlZCBieSB1
c2Vyc3BhY2UuCj4KPiBUaGUga2VybmVsIGlzIHRoZSBvbmx5IHBsYWNlIHdoZXJlIHdlIGNhbiBk
ZWNpZGUgaWYgdGhlIEJPIGlzCj4gcHJlZW1wdGlibGUgb3Igbm90LgoKSSBkaWQgcHV0IGEgY2hl
Y2sgaW4gYW1kZ3B1X2dlbV9jcmVhdGVfaW9jdGwgdG8gcHJldmVudCB1c2VyIG1vZGUgZnJvbQpk
aXJlY3RseSBjcmVhdGluZyBwcmVlbXB0aWJsZSBCT3MuCgpJbnN0ZWFkIG9mIGEgZG9tYWluIEkg
Y2FuIHVzZSBhIGZsYWcgaW4gdGhlIEJPLiBCdXQgaWYgSSBwdXQgaXQgaW4gYQpmbGFnIChzYXkg
QU1ER1BVX0dFTV9DUkVBVEVfUFJFRU1QVElCTEUpLCB0aGF0J3MgYWxzbyBhY2Nlc3NpYmxlIHRv
IHVzZXIKbW9kZSBhbmQgSSBuZWVkIHRvIGZpbHRlciBpdCBvdXQgaW4gdGhlIGlvY3RsIEFQSS4g
SSBkb24ndCBzZWUgaG93CnRoYXQncyBhbnkgZGlmZmVyZW50LgoKQW55IG90aGVyIGlkZWFzPwoK
VGhhbmtzLArCoCBGZWxpeAoKCj4KPiBDaHJpc3RpYW4uCj4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
RmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
IDcgKy0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jwqDCoMKg
wqDCoMKgIHzCoMKgIDQgKwo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
b2JqZWN0LmPCoMKgwqAgfMKgwqAgOCArCj4+IMKgIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ByZWVtcHRfbWdyLmPCoMKgIHwgMTkwICsrKysrKysrKysrKysrKysrKwo+PiDCoCBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmPCoMKgwqDCoMKgwqAgfMKgIDM3ICsr
Ky0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5owqDCoMKgwqDC
oMKgIHzCoCAxMSArCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5j
wqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQo+PiDCoCBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9k
cm0uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDcgKy0KPj4gwqAgOCBm
aWxlcyBjaGFuZ2VkLCAyNTggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4gwqAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wcmVlbXB0
X21nci5jCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtl
ZmlsZQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlCj4+IGluZGV4IDYz
MzFhMTEyOTlkMC4uNmNmMGZlODcxZDZjIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9NYWtlZmlsZQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9N
YWtlZmlsZQo+PiBAQCAtNTEsOSArNTEsMTAgQEAgYW1kZ3B1LXkgKz0gYW1kZ3B1X2RldmljZS5v
IGFtZGdwdV9rbXMubyBcCj4+IMKgwqDCoMKgwqAgYXRvbWJpb3NfZW5jb2RlcnMubyBhbWRncHVf
c2EubyBhdG9tYmlvc19pMmMubyBcCj4+IMKgwqDCoMKgwqAgYW1kZ3B1X2RtYV9idWYubyBhbWRn
cHVfdm0ubyBhbWRncHVfaWIubyBhbWRncHVfcGxsLm8gXAo+PiDCoMKgwqDCoMKgIGFtZGdwdV91
Y29kZS5vIGFtZGdwdV9ib19saXN0Lm8gYW1kZ3B1X2N0eC5vIGFtZGdwdV9zeW5jLm8gXAo+PiAt
wqDCoMKgIGFtZGdwdV9ndHRfbWdyLm8gYW1kZ3B1X3ZyYW1fbWdyLm8gYW1kZ3B1X3ZpcnQubwo+
PiBhbWRncHVfYXRvbWZpcm13YXJlLm8gXAo+PiAtwqDCoMKgIGFtZGdwdV92Zl9lcnJvci5vIGFt
ZGdwdV9zY2hlZC5vIGFtZGdwdV9kZWJ1Z2ZzLm8gYW1kZ3B1X2lkcy5vIFwKPj4gLcKgwqDCoCBh
bWRncHVfZ21jLm8gYW1kZ3B1X21taHViLm8gYW1kZ3B1X3hnbWkubyBhbWRncHVfY3NhLm8KPj4g
YW1kZ3B1X3Jhcy5vIGFtZGdwdV92bV9jcHUubyBcCj4+ICvCoMKgwqAgYW1kZ3B1X2d0dF9tZ3Iu
byBhbWRncHVfcHJlZW1wdF9tZ3IubyBhbWRncHVfdnJhbV9tZ3Iubwo+PiBhbWRncHVfdmlydC5v
IFwKPj4gK8KgwqDCoCBhbWRncHVfYXRvbWZpcm13YXJlLm8gYW1kZ3B1X3ZmX2Vycm9yLm8gYW1k
Z3B1X3NjaGVkLm8gXAo+PiArwqDCoMKgIGFtZGdwdV9kZWJ1Z2ZzLm8gYW1kZ3B1X2lkcy5vIGFt
ZGdwdV9nbWMubyBhbWRncHVfbW1odWIubyBcCj4+ICvCoMKgwqAgYW1kZ3B1X3hnbWkubyBhbWRn
cHVfY3NhLm8gYW1kZ3B1X3Jhcy5vIGFtZGdwdV92bV9jcHUubyBcCj4+IMKgwqDCoMKgwqAgYW1k
Z3B1X3ZtX3NkbWEubyBhbWRncHVfZGlzY292ZXJ5Lm8gYW1kZ3B1X3Jhc19lZXByb20ubwo+PiBh
bWRncHVfbmJpby5vIFwKPj4gwqDCoMKgwqDCoCBhbWRncHVfdW1jLm8gc211X3YxMV8wX2kyYy5v
IGFtZGdwdV9mcnVfZWVwcm9tLm8gYW1kZ3B1X3JhcC5vIFwKPj4gwqDCoMKgwqDCoCBhbWRncHVf
ZndfYXR0ZXN0YXRpb24ubyBhbWRncHVfc2VjdXJlZGlzcGxheS5vIGFtZGdwdV9oZHAubwo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCj4+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCj4+IGluZGV4IDMxMWJjZGM1
OWVkYS4uMjgwY2MwYzBhOWIzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2VtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dlbS5jCj4+IEBAIC0yNDYsNiArMjQ2LDEwIEBAIGludCBhbWRncHVfZ2VtX2NyZWF0ZV9p
b2N0bChzdHJ1Y3QgZHJtX2RldmljZQo+PiAqZGV2LCB2b2lkICpkYXRhLAo+PiDCoMKgwqDCoMKg
IGlmIChhcmdzLT5pbi5kb21haW5zICYgfkFNREdQVV9HRU1fRE9NQUlOX01BU0spCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gwqAgK8KgwqDCoCAvKiBwcmVlbXB0aWJs
ZSBkb21haW4gbm90IHN1cHBvcnRlZCBieSBjdXJyZW50IENTIEFQSSAqLwo+PiArwqDCoMKgIGlm
IChhcmdzLT5pbi5kb21haW5zICYgQU1ER1BVX0dFTV9ET01BSU5fUFJFRU1QVCkKPj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiArCj4+IMKgwqDCoMKgwqAgaWYgKCFhbWRncHVf
aXNfdG16KGFkZXYpICYmIChmbGFncyAmCj4+IEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRFRCkp
IHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIERSTV9OT1RFX09OQ0UoIkNhbm5vdCBhbGxvY2F0ZSBz
ZWN1cmUgYnVmZmVyIHNpbmNlIFRNWiBpcwo+PiBkaXNhYmxlZFxuIik7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuYwo+PiBpbmRleCA3NDVmY2YzZWE0NTAuLjViNTM4ZTc0NmFmYSAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+PiBAQCAt
MTk0LDYgKzE5NCwxNCBAQCB2b2lkIGFtZGdwdV9ib19wbGFjZW1lbnRfZnJvbV9kb21haW4oc3Ry
dWN0Cj4+IGFtZGdwdV9ibyAqYWJvLCB1MzIgZG9tYWluKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
YysrOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgK8KgwqDCoCBpZiAoZG9tYWluICYgQU1ER1BVX0dF
TV9ET01BSU5fUFJFRU1QVCkgewo+PiArwqDCoMKgwqDCoMKgwqAgcGxhY2VzW2NdLmZwZm4gPSAw
Owo+PiArwqDCoMKgwqDCoMKgwqAgcGxhY2VzW2NdLmxwZm4gPSAwOwo+PiArwqDCoMKgwqDCoMKg
wqAgcGxhY2VzW2NdLm1lbV90eXBlID0gQU1ER1BVX1BMX1BSRUVNUFQ7Cj4+ICvCoMKgwqDCoMKg
wqDCoCBwbGFjZXNbY10uZmxhZ3MgPSAwOwo+PiArwqDCoMKgwqDCoMKgwqAgYysrOwo+PiArwqDC
oMKgIH0KPj4gKwo+PiDCoMKgwqDCoMKgIGlmICghYykgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
cGxhY2VzW2NdLmZwZm4gPSAwOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGxhY2VzW2NdLmxwZm4g
PSAwOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3By
ZWVtcHRfbWdyLmMKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHJlZW1w
dF9tZ3IuYwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmI0
MTg1ZGMzYzM5NAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wcmVlbXB0X21nci5jCj4+IEBAIC0wLDAgKzEsMTkwIEBACj4+ICsvKgo+
PiArICogQ29weXJpZ2h0IDIwMTYtMjAyMSBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCj4+
ICsgKgo+PiArICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2Us
IHRvIGFueSBwZXJzb24KPj4gb2J0YWluaW5nIGEKPj4gKyAqIGNvcHkgb2YgdGhpcyBzb2Z0d2Fy
ZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUKPj4gIlNvZnR3YXJlIiks
Cj4+ICsgKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNs
dWRpbmcgd2l0aG91dAo+PiBsaW1pdGF0aW9uCj4+ICsgKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29w
eSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwKPj4gc3VibGljZW5zZSwKPj4g
KyAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVy
c29ucyB0byB3aG9tCj4+IHRoZQo+PiArICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNv
LCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKPj4gKyAqCj4+ICsgKiBUaGUg
YWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBi
ZQo+PiBpbmNsdWRlZCBpbgo+PiArICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9u
cyBvZiB0aGUgU29mdHdhcmUuCj4+ICsgKgo+PiArICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVE
ICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsCj4+IEVYUFJFU1MgT1IKPj4g
KyAqIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMg
T0YKPj4gTUVSQ0hBTlRBQklMSVRZLAo+PiArICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBV
UlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC7CoCBJTiBOTwo+PiBFVkVOVCBTSEFMTAo+PiArICog
VEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9SKFMpIEJFIExJQUJMRSBGT1IgQU5ZIENM
QUlNLAo+PiBEQU1BR0VTIE9SCj4+ICsgKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4g
QUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SCj4+IE9USEVSV0lTRSwKPj4gKyAqIEFSSVNJTkcg
RlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFCj4+
IFVTRSBPUgo+PiArICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgo+PiArICoKPj4g
KyAqIEF1dGhvcnM6IENocmlzdGlhbiBLw7ZuaWcsIEZlbGl4IEt1ZWhsaW5nCj4+ICsgKi8KPj4g
Kwo+PiArI2luY2x1ZGUgImFtZGdwdS5oIgo+PiArCj4+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBh
bWRncHVfcHJlZW1wdF9tZ3IgKgo+PiArdG9fcHJlZW1wdF9tZ3Ioc3RydWN0IHR0bV9yZXNvdXJj
ZV9tYW5hZ2VyICptYW4pCj4+ICt7Cj4+ICvCoMKgwqAgcmV0dXJuIGNvbnRhaW5lcl9vZihtYW4s
IHN0cnVjdCBhbWRncHVfcHJlZW1wdF9tZ3IsIG1hbmFnZXIpOwo+PiArfQo+PiArCj4+ICsvKioK
Pj4gKyAqIERPQzogbWVtX2luZm9fcHJlZW1wdF91c2VkCj4+ICsgKgo+PiArICogVGhlIGFtZGdw
dSBkcml2ZXIgcHJvdmlkZXMgYSBzeXNmcyBBUEkgZm9yIHJlcG9ydGluZyBjdXJyZW50Cj4+IHRv
dGFsIGFtb3VudCBvZgo+PiArICogdXNlZCBwcmVlbXB0aWJsZSBtZW1vcnkuCj4+ICsgKiBUaGUg
ZmlsZSBtZW1faW5mb19wcmVlbXB0X3VzZWQgaXMgdXNlZCBmb3IgdGhpcywgYW5kIHJldHVybnMg
dGhlCj4+IGN1cnJlbnQKPj4gKyAqIHVzZWQgc2l6ZSBvZiB0aGUgcHJlZW1wdGlibGUgYmxvY2ss
IGluIGJ5dGVzCj4+ICsgKi8KPj4gK3N0YXRpYyBzc2l6ZV90IGFtZGdwdV9tZW1faW5mb19wcmVl
bXB0X3VzZWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0
dHIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y2hhciAqYnVmKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gZGV2
X2dldF9kcnZkYXRhKGRldik7Cj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYg
PSBkcm1fdG9fYWRldihkZGV2KTsKPj4gK8KgwqDCoCBzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFn
ZXIgKm1hbjsKPj4gKwo+PiArwqDCoMKgIG1hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoJmFkZXYtPm1t
YW4uYmRldiwgQU1ER1BVX1BMX1BSRUVNUFQpOwo+PiArwqDCoMKgIHJldHVybiBzeXNmc19lbWl0
KGJ1ZiwgIiVsbHVcbiIsIGFtZGdwdV9wcmVlbXB0X21ncl91c2FnZShtYW4pKTsKPj4gK30KPj4g
Kwo+PiArc3RhdGljIERFVklDRV9BVFRSKG1lbV9pbmZvX3ByZWVtcHRfdXNlZCwgU19JUlVHTywK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X21lbV9pbmZvX3ByZWVtcHRf
dXNlZF9zaG93LCBOVUxMKTsKPj4gKwo+PiArLyoqCj4+ICsgKiBhbWRncHVfcHJlZW1wdF9tZ3Jf
bmV3IC0gYWxsb2NhdGUgYSBuZXcgbm9kZQo+PiArICoKPj4gKyAqIEBtYW46IFRUTSBtZW1vcnkg
dHlwZSBtYW5hZ2VyCj4+ICsgKiBAdGJvOiBUVE0gQk8gd2UgbmVlZCB0aGlzIHJhbmdlIGZvcgo+
PiArICogQHBsYWNlOiBwbGFjZW1lbnQgZmxhZ3MgYW5kIHJlc3RyaWN0aW9ucwo+PiArICogQG1l
bTogdGhlIHJlc3VsdGluZyBtZW0gb2JqZWN0Cj4+ICsgKgo+PiArICogRHVtbXksIGp1c3QgY291
bnQgdGhlIHNwYWNlIHVzZWQgd2l0aG91dCBhbGxvY2F0aW5nIHJlc291cmNlcyBvcgo+PiBhbnkg
bGltaXQuCj4+ICsgKi8KPj4gK3N0YXRpYyBpbnQgYW1kZ3B1X3ByZWVtcHRfbWdyX25ldyhzdHJ1
Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICp0Ym8sCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgKnBsYWNlLAo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX3Jlc291cmNl
ICptZW0pCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9wcmVlbXB0X21nciAqbWdyID0g
dG9fcHJlZW1wdF9tZ3IobWFuKTsKPj4gKwo+PiArwqDCoMKgIGF0b21pYzY0X2FkZChtZW0tPm51
bV9wYWdlcywgJm1nci0+dXNlZCk7Cj4+ICsKPj4gK8KgwqDCoCBtZW0tPm1tX25vZGUgPSBOVUxM
Owo+PiArwqDCoMKgIG1lbS0+c3RhcnQgPSBBTURHUFVfQk9fSU5WQUxJRF9PRkZTRVQ7Cj4+ICvC
oMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gKy8qKgo+PiArICogYW1kZ3B1X3ByZWVtcHRf
bWdyX2RlbCAtIGZyZWUgcmFuZ2VzCj4+ICsgKgo+PiArICogQG1hbjogVFRNIG1lbW9yeSB0eXBl
IG1hbmFnZXIKPj4gKyAqIEBtZW06IFRUTSBtZW1vcnkgb2JqZWN0Cj4+ICsgKgo+PiArICogRnJl
ZSB0aGUgYWxsb2NhdGVkIEdUVCBhZ2Fpbi4KPj4gKyAqLwo+PiArc3RhdGljIHZvaWQgYW1kZ3B1
X3ByZWVtcHRfbWdyX2RlbChzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX3Jlc291cmNlICpt
ZW0pCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9wcmVlbXB0X21nciAqbWdyID0gdG9f
cHJlZW1wdF9tZ3IobWFuKTsKPj4gKwo+PiArwqDCoMKgIGF0b21pYzY0X3N1YihtZW0tPm51bV9w
YWdlcywgJm1nci0+dXNlZCk7Cj4+ICt9Cj4+ICsKPj4gKy8qKgo+PiArICogYW1kZ3B1X3ByZWVt
cHRfbWdyX3VzYWdlIC0gcmV0dXJuIHVzYWdlIG9mIFBSRUVNUFQgZG9tYWluCj4+ICsgKgo+PiAr
ICogQG1hbjogVFRNIG1lbW9yeSB0eXBlIG1hbmFnZXIKPj4gKyAqCj4+ICsgKiBSZXR1cm4gaG93
IG1hbnkgYnl0ZXMgYXJlIHVzZWQgaW4gdGhlIEdUVCBkb21haW4KPj4gKyAqLwo+PiArdWludDY0
X3QgYW1kZ3B1X3ByZWVtcHRfbWdyX3VzYWdlKHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAq
bWFuKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfcHJlZW1wdF9tZ3IgKm1nciA9IHRv
X3ByZWVtcHRfbWdyKG1hbik7Cj4+ICvCoMKgwqAgczY0IHJlc3VsdCA9IGF0b21pYzY0X3JlYWQo
Jm1nci0+dXNlZCk7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gKHJlc3VsdCA+IDAgPyByZXN1bHQg
OiAwKSAqIFBBR0VfU0laRTsKPj4gK30KPj4gKwo+PiArLyoqCj4+ICsgKiBhbWRncHVfcHJlZW1w
dF9tZ3JfZGVidWcgLSBkdW1wIFZSQU0gdGFibGUKPj4gKyAqCj4+ICsgKiBAbWFuOiBUVE0gbWVt
b3J5IHR5cGUgbWFuYWdlcgo+PiArICogQHByaW50ZXI6IERSTSBwcmludGVyIHRvIHVzZQo+PiAr
ICoKPj4gKyAqIER1bXAgdGhlIHRhYmxlIGNvbnRlbnQgdXNpbmcgcHJpbnRrLgo+PiArICovCj4+
ICtzdGF0aWMgdm9pZCBhbWRncHVfcHJlZW1wdF9tZ3JfZGVidWcoc3RydWN0IHR0bV9yZXNvdXJj
ZV9tYW5hZ2VyICptYW4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBkcm1fcHJpbnRlciAqcHJpbnRlcikKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3Qg
YW1kZ3B1X3ByZWVtcHRfbWdyICptZ3IgPSB0b19wcmVlbXB0X21ncihtYW4pOwo+PiArCj4+ICvC
oMKgwqAgZHJtX3ByaW50ZihwcmludGVyLCAibWFuIHNpemU6JWxsdSBwYWdlcywgcHJlZW1wdCB1
c2VkOiVsbGQKPj4gcGFnZXNcbiIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYW4tPnNpemUs
ICh1NjQpYXRvbWljNjRfcmVhZCgmbWdyLT51c2VkKSk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXJfZnVuYwo+PiBhbWRncHVfcHJlZW1wdF9t
Z3JfZnVuYyA9IHsKPj4gK8KgwqDCoCAuYWxsb2MgPSBhbWRncHVfcHJlZW1wdF9tZ3JfbmV3LAo+
PiArwqDCoMKgIC5mcmVlID0gYW1kZ3B1X3ByZWVtcHRfbWdyX2RlbCwKPj4gK8KgwqDCoCAuZGVi
dWcgPSBhbWRncHVfcHJlZW1wdF9tZ3JfZGVidWcKPj4gK307Cj4+ICsKPj4gKy8qKgo+PiArICog
YW1kZ3B1X3ByZWVtcHRfbWdyX2luaXQgLSBpbml0IFBSRUVNUFQgbWFuYWdlciBhbmQgRFJNIE1N
Cj4+ICsgKgo+PiArICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+PiArICoKPj4gKyAq
IEFsbG9jYXRlIGFuZCBpbml0aWFsaXplIHRoZSBHVFQgbWFuYWdlci4KPj4gKyAqLwo+PiAraW50
IGFtZGdwdV9wcmVlbXB0X21ncl9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiAr
ewo+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfcHJlZW1wdF9tZ3IgKm1nciA9ICZhZGV2LT5tbWFu
LnByZWVtcHRfbWdyOwo+PiArwqDCoMKgIHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFu
ID0gJm1nci0+bWFuYWdlcjsKPj4gK8KgwqDCoCBpbnQgcmV0Owo+PiArCj4+ICvCoMKgwqAgbWFu
LT51c2VfdHQgPSB0cnVlOwo+PiArwqDCoMKgIG1hbi0+ZnVuYyA9ICZhbWRncHVfcHJlZW1wdF9t
Z3JfZnVuYzsKPj4gKwo+PiArwqDCoMKgIHR0bV9yZXNvdXJjZV9tYW5hZ2VyX2luaXQobWFuLCAo
MSA8PCAzMCkpOwo+PiArCj4+ICvCoMKgwqAgYXRvbWljNjRfc2V0KCZtZ3ItPnVzZWQsIDApOwo+
PiArCj4+ICvCoMKgwqAgcmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYtPmRldiwKPj4gJmRl
dl9hdHRyX21lbV9pbmZvX3ByZWVtcHRfdXNlZCk7Cj4+ICvCoMKgwqAgaWYgKHJldCkgewo+PiAr
wqDCoMKgwqDCoMKgwqAgRFJNX0VSUk9SKCJGYWlsZWQgdG8gY3JlYXRlIGRldmljZSBmaWxlCj4+
IG1lbV9pbmZvX3ByZWVtcHRfdXNlZFxuIik7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0
Owo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHR0bV9zZXRfZHJpdmVyX21hbmFnZXIoJmFk
ZXYtPm1tYW4uYmRldiwgQU1ER1BVX1BMX1BSRUVNUFQsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgJm1nci0+bWFuYWdlcik7Cj4+ICvCoMKgwqAgdHRtX3Jlc291cmNl
X21hbmFnZXJfc2V0X3VzZWQobWFuLCB0cnVlKTsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gK30K
Pj4gKwo+PiArLyoqCj4+ICsgKiBhbWRncHVfcHJlZW1wdF9tZ3JfZmluaSAtIGZyZWUgYW5kIGRl
c3Ryb3kgR1RUIG1hbmFnZXIKPj4gKyAqCj4+ICsgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2lu
dGVyCj4+ICsgKgo+PiArICogRGVzdHJveSBhbmQgZnJlZSB0aGUgR1RUIG1hbmFnZXIsIHJldHVy
bnMgLUVCVVNZIGlmIHJhbmdlcyBhcmUgc3RpbGwKPj4gKyAqIGFsbG9jYXRlZCBpbnNpZGUgaXQu
Cj4+ICsgKi8KPj4gK3ZvaWQgYW1kZ3B1X3ByZWVtcHRfbWdyX2Zpbmkoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9wcmVlbXB0X21nciAq
bWdyID0gJmFkZXYtPm1tYW4ucHJlZW1wdF9tZ3I7Cj4+ICvCoMKgwqAgc3RydWN0IHR0bV9yZXNv
dXJjZV9tYW5hZ2VyICptYW4gPSAmbWdyLT5tYW5hZ2VyOwo+PiArwqDCoMKgIGludCByZXQ7Cj4+
ICsKPj4gK8KgwqDCoCB0dG1fcmVzb3VyY2VfbWFuYWdlcl9zZXRfdXNlZChtYW4sIGZhbHNlKTsK
Pj4gKwo+PiArwqDCoMKgIHJldCA9IHR0bV9yZXNvdXJjZV9tYW5hZ2VyX2V2aWN0X2FsbCgmYWRl
di0+bW1hbi5iZGV2LCBtYW4pOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm47Cj4+ICsKPj4gK8KgwqDCoCBkZXZpY2VfcmVtb3ZlX2ZpbGUoYWRldi0+ZGV2LCAm
ZGV2X2F0dHJfbWVtX2luZm9fcHJlZW1wdF91c2VkKTsKPj4gKwo+PiArwqDCoMKgIHR0bV9yZXNv
dXJjZV9tYW5hZ2VyX2NsZWFudXAobWFuKTsKPj4gK8KgwqDCoCB0dG1fc2V0X2RyaXZlcl9tYW5h
Z2VyKCZhZGV2LT5tbWFuLmJkZXYsIEFNREdQVV9QTF9QUkVFTVBULCBOVUxMKTsKPj4gK30KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+PiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+PiBpbmRleCBkODU2YjIw
NGNkMTIuLmM2ZWI2ZjFjNzA4MiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYwo+PiBAQCAtMTU4LDYgKzE1OCw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9ldmlj
dF9mbGFncyhzdHJ1Y3QKPj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgfQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDCoMKgwqAgY2FzZSBU
VE1fUExfVFQ6Cj4+ICvCoMKgwqAgY2FzZSBBTURHUFVfUExfUFJFRU1QVDoKPj4gwqDCoMKgwqDC
oCBkZWZhdWx0Ogo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X2JvX3BsYWNlbWVudF9mcm9t
X2RvbWFpbihhYm8sIEFNREdQVV9HRU1fRE9NQUlOX0NQVSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBicmVhazsKPj4gQEAgLTIxNyw2ICsyMTgsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV90dG1fbWFw
X2J1ZmZlcihzdHJ1Y3QKPj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiDCoCDCoMKgwqDCoMKg
IEJVR19PTihhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jcy0+Y29weV9tYXhfYnl0ZXMgPAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgQU1ER1BVX0dUVF9NQVhfVFJBTlNGRVJfU0laRSAqIDgpOwo+
PiArwqDCoMKgIEJVR19PTihtZW0tPm1lbV90eXBlID09IEFNREdQVV9QTF9QUkVFTVBUKTsKPj4g
wqAgwqDCoMKgwqDCoCAvKiBNYXAgb25seSB3aGF0IGNhbid0IGJlIGFjY2Vzc2VkIGRpcmVjdGx5
ICovCj4+IMKgwqDCoMKgwqAgaWYgKCF0bXogJiYgbWVtLT5zdGFydCAhPSBBTURHUFVfQk9fSU5W
QUxJRF9PRkZTRVQpIHsKPj4gQEAgLTQ4MCw3ICs0ODIsOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9i
b19tb3ZlKHN0cnVjdAo+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCj4+IMKg
wqDCoMKgwqAgc3RydWN0IHR0bV9yZXNvdXJjZSAqb2xkX21lbSA9ICZiby0+bWVtOwo+PiDCoMKg
wqDCoMKgIGludCByOwo+PiDCoCAtwqDCoMKgIGlmIChuZXdfbWVtLT5tZW1fdHlwZSA9PSBUVE1f
UExfVFQpIHsKPj4gK8KgwqDCoCBpZiAobmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RUIHx8
Cj4+ICvCoMKgwqDCoMKgwqDCoCBuZXdfbWVtLT5tZW1fdHlwZSA9PSBBTURHUFVfUExfUFJFRU1Q
VCkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IGFtZGdwdV90dG1fYmFja2VuZF9iaW5kKGJv
LT5iZGV2LCBiby0+dHRtLCBuZXdfbWVtKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyKQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcjsKPj4gQEAgLTQ5OCwxMSArNTAx
LDEzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2JvX21vdmUoc3RydWN0Cj4+IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywgYm9vbCBldmljdCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+PiDC
oMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCBpZiAob2xkX21lbS0+bWVtX3R5cGUgPT0gVFRNX1BM
X1NZU1RFTSAmJgo+PiAtwqDCoMKgwqDCoMKgwqAgbmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BM
X1RUKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAobmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RU
IHx8Cj4+ICvCoMKgwqDCoMKgwqDCoMKgIG5ld19tZW0tPm1lbV90eXBlID09IEFNREdQVV9QTF9Q
UkVFTVBUKSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdHRtX2JvX21vdmVfbnVsbChibywgbmV3
X21lbSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4gwqDCoMKgwqDCoCB9Cj4+
IC3CoMKgwqAgaWYgKG9sZF9tZW0tPm1lbV90eXBlID09IFRUTV9QTF9UVCAmJgo+PiArwqDCoMKg
IGlmICgob2xkX21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RUIHx8Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgIG9sZF9tZW0tPm1lbV90eXBlID09IEFNREdQVV9QTF9QUkVFTVBUKSAmJgo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgbmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSkgewo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgciA9IHR0bV9ib193YWl0X2N0eChibywgY3R4KTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChyKQo+PiBAQCAtNTg3LDYgKzU5Miw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QKPj4gdHRtX2RldmljZSAqYmRldiwKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIC8qIHN5c3RlbSBtZW1vcnkgKi8KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAwOwo+PiDCoMKgwqDCoMKgIGNhc2UgVFRNX1BMX1RUOgo+PiArwqDCoMKgIGNhc2UgQU1E
R1BVX1BMX1BSRUVNUFQ6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gwqDCoMKgwqDC
oCBjYXNlIFRUTV9QTF9WUkFNOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtLT5idXMub2Zmc2V0
ID0gbWVtLT5zdGFydCA8PCBQQUdFX1NISUZUOwo+PiBAQCAtMTI5Myw3ICsxMjk5LDggQEAgdWlu
dDY0X3QgYW1kZ3B1X3R0bV90dF9wZGVfZmxhZ3Moc3RydWN0IHR0bV90dAo+PiAqdHRtLCBzdHJ1
Y3QgdHRtX3Jlc291cmNlICptZW0pCj4+IMKgwqDCoMKgwqAgaWYgKG1lbSAmJiBtZW0tPm1lbV90
eXBlICE9IFRUTV9QTF9TWVNURU0pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBmbGFncyB8PSBBTURH
UFVfUFRFX1ZBTElEOwo+PiDCoCAtwqDCoMKgIGlmIChtZW0gJiYgbWVtLT5tZW1fdHlwZSA9PSBU
VE1fUExfVFQpIHsKPj4gK8KgwqDCoCBpZiAobWVtICYmIChtZW0tPm1lbV90eXBlID09IFRUTV9Q
TF9UVCB8fAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW0tPm1lbV90eXBlID09IEFNREdQ
VV9QTF9QUkVFTVBUKSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZmxhZ3MgfD0gQU1ER1BVX1BU
RV9TWVNURU07Cj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAodHRtLT5jYWNoaW5nID09IHR0
bV9jYWNoZWQpCj4+IEBAIC0xMzY3LDYgKzEzNzQsMTUgQEAgc3RhdGljIGJvb2wKPj4gYW1kZ3B1
X3R0bV9ib19ldmljdGlvbl92YWx1YWJsZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+
PiDCoMKgwqDCoMKgIH0KPj4gwqAgwqDCoMKgwqDCoCBzd2l0Y2ggKGJvLT5tZW0ubWVtX3R5cGUp
IHsKPj4gK8KgwqDCoCBjYXNlIEFNREdQVV9QTF9QUkVFTVBUOgo+PiArwqDCoMKgwqDCoMKgwqAg
LyogUHJlZW1wdGlibGUgQk9zIGRvbid0IG93biBzeXN0ZW0gcmVzb3VyY2VzIG1hbmFnZWQgYnkg
dGhlCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogZHJpdmVyIChwYWdlcywgVlJBTSwgR0FSVCBzcGFj
ZSkuIFRoZXkgcG9pbnQgdG8gcmVzb3VyY2VzCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogb3duZWQg
Ynkgc29tZW9uZSBlbHNlIChlLmcuIHBhZ2VhYmxlIG1lbW9yeSBpbiB1c2VyIG1vZGUKPj4gK8Kg
wqDCoMKgwqDCoMKgwqAgKiBvciBhIERNQUJ1ZikuIFRoZXkgYXJlIHVzZWQgaW4gYSBwcmVlbXB0
aWJsZSBjb250ZXh0IHNvIHdlCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogY2FuIGd1YXJhbnRlZSBu
byBkZWFkbG9ja3MgYW5kIGdvb2QgUW9TIGluIGNhc2Ugb2YgTU1VCj4+ICvCoMKgwqDCoMKgwqDC
oMKgICogbm90aWZpZXJzIG9yIERNQUJ1ZiBtb3ZlIG5vdGlmaWVycyBmcm9tIHRoZSByZXNvdXJj
ZSBvd25lci4KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biBmYWxzZTsKPj4gwqDCoMKgwqDCoCBjYXNlIFRUTV9QTF9UVDoKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChhbWRncHVfYm9faXNfYW1kZ3B1X2JvKGJvKSAmJgo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBhbWRncHVfYm9fZW5jcnlwdGVkKHR0bV90b19hbWRncHVfYm8oYm8pKSkKPj4g
QEAgLTE3NDgsNiArMTc2NCwxMyBAQCBpbnQgYW1kZ3B1X3R0bV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQo+PiDCoMKgwqDCoMKgIERSTV9JTkZPKCJhbWRncHU6ICV1TSBvZiBHVFQg
bWVtb3J5IHJlYWR5LlxuIiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHVuc2lnbmVkKShndHRf
c2l6ZSAvICgxMDI0ICogMTAyNCkpKTsKPj4gwqAgK8KgwqDCoCAvKiBJbml0aWFsaXplIHByZWVt
cHRpYmxlIG1lbW9yeSBwb29sICovCj4+ICvCoMKgwqAgciA9IGFtZGdwdV9wcmVlbXB0X21ncl9p
bml0KGFkZXYpOwo+PiArwqDCoMKgIGlmIChyKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBEUk1fRVJS
T1IoIkZhaWxlZCBpbml0aWFsaXppbmcgUFJFRU1QVCBoZWFwLlxuIik7Cj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gcjsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gwqDCoMKgwqDCoCAvKiBJbml0aWFs
aXplIHZhcmlvdXMgb24tY2hpcCBtZW1vcnkgcG9vbHMgKi8KPj4gwqDCoMKgwqDCoCByID0gYW1k
Z3B1X3R0bV9pbml0X29uX2NoaXAoYWRldiwgQU1ER1BVX1BMX0dEUywKPj4gYWRldi0+Z2RzLmdk
c19zaXplKTsKPj4gwqDCoMKgwqDCoCBpZiAocikgewo+PiBAQCAtMTc5Miw2ICsxODE1LDcgQEAg
dm9pZCBhbWRncHVfdHRtX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+IMKgIMKg
wqDCoMKgwqAgYW1kZ3B1X3ZyYW1fbWdyX2ZpbmkoYWRldik7Cj4+IMKgwqDCoMKgwqAgYW1kZ3B1
X2d0dF9tZ3JfZmluaShhZGV2KTsKPj4gK8KgwqDCoCBhbWRncHVfcHJlZW1wdF9tZ3JfZmluaShh
ZGV2KTsKPj4gwqDCoMKgwqDCoCB0dG1fcmFuZ2VfbWFuX2ZpbmkoJmFkZXYtPm1tYW4uYmRldiwg
QU1ER1BVX1BMX0dEUyk7Cj4+IMKgwqDCoMKgwqAgdHRtX3JhbmdlX21hbl9maW5pKCZhZGV2LT5t
bWFuLmJkZXYsIEFNREdQVV9QTF9HV1MpOwo+PiDCoMKgwqDCoMKgIHR0bV9yYW5nZV9tYW5fZmlu
aSgmYWRldi0+bW1hbi5iZGV2LCBBTURHUFVfUExfT0EpOwo+PiBAQCAtMTk4Niw2ICsyMDEwLDEx
IEBAIGludCBhbWRncHVfZmlsbF9idWZmZXIoc3RydWN0IGFtZGdwdV9ibyAqYm8sCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgICvCoMKg
wqAgaWYgKGJvLT50Ym8ubWVtLm1lbV90eXBlID09IEFNREdQVV9QTF9QUkVFTVBUKSB7Cj4+ICvC
oMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoIlRyeWluZyB0byBjbGVhciBwcmVlbXB0aWJsZSBtZW1v
cnkuXG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiArwqDCoMKgIH0K
Pj4gKwo+PiDCoMKgwqDCoMKgIGlmIChiby0+dGJvLm1lbS5tZW1fdHlwZSA9PSBUVE1fUExfVFQp
IHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHIgPSBhbWRncHVfdHRtX2FsbG9jX2dhcnQoJmJvLT50
Ym8pOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHIpCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmgKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmgKPj4gaW5kZXggZWI4NGE2OWM0Yjc0Li4yODc3YTkyNDA4NmYg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaAo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmgKPj4gQEAgLTMx
LDYgKzMxLDcgQEAKPj4gwqAgI2RlZmluZSBBTURHUFVfUExfR0RTwqDCoMKgwqDCoMKgwqAgKFRU
TV9QTF9QUklWICsgMCkKPj4gwqAgI2RlZmluZSBBTURHUFVfUExfR1dTwqDCoMKgwqDCoMKgwqAg
KFRUTV9QTF9QUklWICsgMSkKPj4gwqAgI2RlZmluZSBBTURHUFVfUExfT0HCoMKgwqDCoMKgwqDC
oCAoVFRNX1BMX1BSSVYgKyAyKQo+PiArI2RlZmluZSBBTURHUFVfUExfUFJFRU1QVMKgwqDCoCAo
VFRNX1BMX1BSSVYgKyAzKQo+PiDCoCDCoCAjZGVmaW5lIEFNREdQVV9HVFRfTUFYX1RSQU5TRkVS
X1NJWkXCoMKgwqAgNTEyCj4+IMKgICNkZWZpbmUgQU1ER1BVX0dUVF9OVU1fVFJBTlNGRVJfV0lO
RE9XU8KgwqDCoCAyCj4+IEBAIC01NCw2ICs1NSwxMSBAQCBzdHJ1Y3QgYW1kZ3B1X2d0dF9tZ3Ig
ewo+PiDCoMKgwqDCoMKgIGF0b21pYzY0X3QgYXZhaWxhYmxlOwo+PiDCoCB9Owo+PiDCoCArc3Ry
dWN0IGFtZGdwdV9wcmVlbXB0X21nciB7Cj4+ICvCoMKgwqAgc3RydWN0IHR0bV9yZXNvdXJjZV9t
YW5hZ2VyIG1hbmFnZXI7Cj4+ICvCoMKgwqAgYXRvbWljNjRfdCB1c2VkOwo+PiArfTsKPj4gKwo+
PiDCoCBzdHJ1Y3QgYW1kZ3B1X21tYW4gewo+PiDCoMKgwqDCoMKgIHN0cnVjdCB0dG1fZGV2aWNl
wqDCoMKgwqDCoMKgwqAgYmRldjsKPj4gwqDCoMKgwqDCoCBib29swqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGluaXRpYWxpemVkOwo+PiBAQCAtNzAsNiArNzYsNyBAQCBzdHJ1Y3QgYW1k
Z3B1X21tYW4gewo+PiDCoCDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfdnJhbV9tZ3IgdnJhbV9t
Z3I7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9ndHRfbWdyIGd0dF9tZ3I7Cj4+ICvCoMKg
wqAgc3RydWN0IGFtZGdwdV9wcmVlbXB0X21nciBwcmVlbXB0X21ncjsKPj4gwqAgwqDCoMKgwqDC
oCB1aW50NjRfdMKgwqDCoMKgwqDCoMKgIHN0b2xlbl92Z2Ffc2l6ZTsKPj4gwqDCoMKgwqDCoCBz
dHJ1Y3QgYW1kZ3B1X2JvwqDCoMKgICpzdG9sZW5fdmdhX21lbW9yeTsKPj4gQEAgLTk3LDYgKzEw
NCw4IEBAIHN0cnVjdCBhbWRncHVfY29weV9tZW0gewo+PiDCoCDCoCBpbnQgYW1kZ3B1X2d0dF9t
Z3JfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDY0X3QKPj4gZ3R0X3NpemUp
Owo+PiDCoCB2b2lkIGFtZGdwdV9ndHRfbWdyX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpOwo+PiAraW50IGFtZGdwdV9wcmVlbXB0X21ncl9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KTsKPj4gK3ZvaWQgYW1kZ3B1X3ByZWVtcHRfbWdyX2Zpbmkoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpOwo+PiDCoCBpbnQgYW1kZ3B1X3ZyYW1fbWdyX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpOwo+PiDCoCB2b2lkIGFtZGdwdV92cmFtX21ncl9maW5pKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KTsKPj4gwqAgQEAgLTEwNCw2ICsxMTMsOCBAQCBib29sIGFtZGdw
dV9ndHRfbWdyX2hhc19nYXJ0X2FkZHIoc3RydWN0Cj4+IHR0bV9yZXNvdXJjZSAqbWVtKTsKPj4g
wqAgdWludDY0X3QgYW1kZ3B1X2d0dF9tZ3JfdXNhZ2Uoc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5h
Z2VyICptYW4pOwo+PiDCoCBpbnQgYW1kZ3B1X2d0dF9tZ3JfcmVjb3ZlcihzdHJ1Y3QgdHRtX3Jl
c291cmNlX21hbmFnZXIgKm1hbik7Cj4+IMKgICt1aW50NjRfdCBhbWRncHVfcHJlZW1wdF9tZ3Jf
dXNhZ2Uoc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4pOwo+PiArCj4+IMKgIHU2NCBh
bWRncHVfdnJhbV9tZ3JfYm9fdmlzaWJsZV9zaXplKHN0cnVjdCBhbWRncHVfYm8gKmJvKTsKPj4g
wqAgaW50IGFtZGdwdV92cmFtX21ncl9hbGxvY19zZ3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB0dG1f
cmVzb3VyY2UgKm1lbSwKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5jCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMK
Pj4gaW5kZXggNTU5OTFmMzkzNDgxLi5kYTE1NWMyNzZjNTEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4+IEBAIC0xODE3LDcgKzE4MTcsOCBAQCBpbnQgYW1k
Z3B1X3ZtX2JvX3VwZGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZQo+PiAqYWRldiwgc3RydWN0IGFt
ZGdwdV9ib192YSAqYm9fdmEsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Ym8gPSBnZW1fdG9fYW1kZ3B1X2JvKGdvYmopOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgbWVtID0gJmJvLT50Ym8ubWVtOwo+PiAtwqDCoMKgwqDCoMKgwqAg
aWYgKG1lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RUKQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKG1l
bS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RUIHx8Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1l
bS0+bWVtX3R5cGUgPT0gQU1ER1BVX1BMX1BSRUVNUFQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHBhZ2VzX2FkZHIgPSBiby0+dGJvLnR0bS0+ZG1hX2FkZHJlc3M7Cj4+IMKgwqDCoMKg
wqAgfQo+PiDCoCBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKPj4g
Yi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAo+PiBpbmRleCA5MTY5ZGY3ZmFkZWUuLjRl
NDQyMmJjNTRlYSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgK
Pj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKPj4gQEAgLTk3LDYgKzk3LDkg
QEAgZXh0ZXJuICJDIiB7Cj4+IMKgwqAgKgo+PiDCoMKgICogJUFNREdQVV9HRU1fRE9NQUlOX09B
wqDCoMKgIE9yZGVyZWQgYXBwZW5kLCB1c2VkIGJ5IDNEIG9yIENvbXB1dGUKPj4gZW5naW5lcwo+
PiDCoMKgICogZm9yIGFwcGVuZGluZyBkYXRhLgo+PiArICoKPj4gKyAqICVBTURHUFVfR0VNX0RP
TUFJTl9QUkVFTVBUwqDCoMKgIFVzZXJwdHJzIGFuZCBETUFidWYgaW1wb3J0cyBpbgo+PiBwcmVl
bXB0aWJsZQo+PiArICogY29udGV4dHMsIHdoaWNoIGFsbG93IG1lbW9yeSB0byBiZSBldmljdGVk
IHdpdGhvdXQgd2FpdGluZyBmb3IKPj4gZmVuY2VzLgo+PiDCoMKgICovCj4+IMKgICNkZWZpbmUg
QU1ER1BVX0dFTV9ET01BSU5fQ1BVwqDCoMKgwqDCoMKgwqAgMHgxCj4+IMKgICNkZWZpbmUgQU1E
R1BVX0dFTV9ET01BSU5fR1RUwqDCoMKgwqDCoMKgwqAgMHgyCj4+IEBAIC0xMDQsMTIgKzEwNywx
NCBAQCBleHRlcm4gIkMiIHsKPj4gwqAgI2RlZmluZSBBTURHUFVfR0VNX0RPTUFJTl9HRFPCoMKg
wqDCoMKgwqDCoCAweDgKPj4gwqAgI2RlZmluZSBBTURHUFVfR0VNX0RPTUFJTl9HV1PCoMKgwqDC
oMKgwqDCoCAweDEwCj4+IMKgICNkZWZpbmUgQU1ER1BVX0dFTV9ET01BSU5fT0HCoMKgwqDCoMKg
wqDCoCAweDIwCj4+ICsjZGVmaW5lIEFNREdQVV9HRU1fRE9NQUlOX1BSRUVNUFTCoMKgwqAgMHg0
MAo+PiDCoCAjZGVmaW5lIEFNREdQVV9HRU1fRE9NQUlOX01BU0vCoMKgwqDCoMKgwqDCoCAoQU1E
R1BVX0dFTV9ET01BSU5fQ1BVIHwgXAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBBTURHUFVfR0VNX0RPTUFJTl9HVFQgfCBcCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0gfCBc
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFNREdQVV9H
RU1fRE9NQUlOX0dEUyB8IFwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgQU1ER1BVX0dFTV9ET01BSU5fR1dTIHwgXAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBTURHUFVfR0VNX0RPTUFJTl9PQSkKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQU1ER1BVX0dFTV9ET01BSU5fT0EgfCBc
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFNREdQVV9HRU1f
RE9NQUlOX1BSRUVNUFQpCj4+IMKgIMKgIC8qIEZsYWcgdGhhdCBDUFUgYWNjZXNzIHdpbGwgYmUg
cmVxdWlyZWQgZm9yIHRoZSBjYXNlIG9mIFZSQU0KPj4gZG9tYWluICovCj4+IMKgICNkZWZpbmUg
QU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0FDQ0VTU19SRVFVSVJFRMKgwqDCoCAoMSA8PCAwKQo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=

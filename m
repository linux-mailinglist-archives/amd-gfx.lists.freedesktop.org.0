Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F6B35F7C9
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Apr 2021 17:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269306E951;
	Wed, 14 Apr 2021 15:46:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CB76E950;
 Wed, 14 Apr 2021 15:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDd+WF06OmwBrrX7VIi84l+Mn8tsBUXEnGOJrnN7nlAfsYUfqYZZpfYuLQqfusY9Y+L+nBgD6T+n6hUcneNLt94AzWQD4Ki099JagQEGozMA7nDDwtfT44eML7RwiYzAU+/ientE+uIV+O2QphW58iDQ5NPJnMjWja0TDt+Q0Ax4/X5pxHmI7fCZUfiuFLoUlawsNlH9ygzc26VZEw6Q71a7zB/fCidAqmiIbV9dxHtkbSXkuUeELdla1nQBFwLj8mVmNbHGLmhIk37BFGyVyLZxNKomzc0YL+IM+4qRxQa15rVT7kiqOU811MtUb3A/qt4mSYRubmRz2+P2NeVKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbi3v13wjns/H9Y9dyWHP+NfckQ+1etK+z3kycoN4R4=;
 b=EkwTIxmP+0K36XKBjmMZ85baOsxL1VJO4WUwtH7cj0UVFeyHXfkpRDhhk15Qvi0waMxYlDSasyVImMSdGRPI2t0aqBa25hyGvumR8HxXM5g9KdBTkUzDlm6uAs7AhXj+PPOvjI6mz0TaQZa1ugrVQ/EaSUhU4TL7TfXOq94gg4tivbJVJ0VuYqh0XlEa+URDyLFWk3Y1iYE/howWE6/WXYgb6Ju1sqX1n1zazELs7Qqorve2bfbWDnolvRrJxuz5ZxDAQ5mhd3SmOuM1LxDSVJYfQC9/Iji0ivVM/ffyeLbqNh/qQdwjfezOQkbEeSEBYc/+L1Si3Q4keTHUpeyrpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbi3v13wjns/H9Y9dyWHP+NfckQ+1etK+z3kycoN4R4=;
 b=KdEazRzWBYzpk5ahIvXuomgFRIXk3zC9HtBYJ+f7jfoqJQyFwH/5ntlZ00fJ6inMeS4tQawhQ4xmgKi7YhQZQkSlrlJ6ZBxNVCJaPUaWFGlaME9EKnRwa5KCERBEz4b3TJXOWEHCCyQh733X5uLS7hLHw0QK2Mqtt+32hgDzOc4=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4552.namprd12.prod.outlook.com (2603:10b6:208:24f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 15:46:54 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 15:46:51 +0000
Subject: Re: [PATCH 3/4] drm/amdkfd: Allow access for mmapping KFD BOs
To: philip yang <yangp@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210407231259.1787-1-Felix.Kuehling@amd.com>
 <20210407231259.1787-3-Felix.Kuehling@amd.com>
 <2557c4ab-0b7d-b7f7-044a-2c0a3c9ed78f@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <c3981584-bef3-b4c2-d17f-18934eeef5ed@amd.com>
Date: Wed, 14 Apr 2021 11:46:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <2557c4ab-0b7d-b7f7-044a-2c0a3c9ed78f@amd.com>
Content-Language: en-US
X-Originating-IP: [142.182.180.233]
X-ClientProxiedBy: YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.180.233) by
 YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 15:46:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 590b3693-faf3-4576-e769-08d8ff5c7af4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB45527A41D9FEDEF2EFB9AB67924E9@MN2PR12MB4552.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xy1LvC+RM+hQ7Jd2FB1EHs5FPbW3ty5jGJbN/qS83vWjVXOcXBcX9gHrUrs2rKaCBHYJGuhANDsQNGgmCYwArN+TdkFaKPGs6zw8gLh6gwdqiRU9h/yQpuHCnP0j71YDZn/guXGUAi2275sX/jcjZBOP74bNP2QsJp+Iha3LYGUL0zXn5i8XFwodBa89KecYog5OHg63kjdNYIi10soes3IJgeffmPmYQy1yfXbBqsrOYlAYZ6co5t/mv1zjEveB9zhLO/7R7+gFAizCIgYV1gkMxiBKI6nuU2j5ZzRXHEChhvrZTyoYP+mGC8Y8aHVug7bgaZyjPrNIH1Tz9s/QVpm4oBykjGBRJgiJIueL83frLdInRnZCDInPmy5VokbS97BSE1IYcuwvXp5RiOZr0/0YIrsnomnFYnM/gLjoQhYdEdPK7S6xQWmJEwZ/Rg3z6ys66FD+vL0YZOLAgGg1Lw/7ha2TR0tFsR216O3dNoj3LoYuHpJgwFR2n5viecHt3zu7pBsdBHeyJOH8hZV1eUQXUtb2mc97K2AhSY4Z6sTmubQGVzwUZY9AuxNdvKccvhKAu5XIsgWCZOhRLO/MZ42IBsWrd4aCZpOFWO8DqHAjwyErMMZVkW5MAZScCBMTijcEMelM6d4sOASDJUg34oF7UArsYK4TI5/Ol2/I1B8bhXVgLaxRKLmuEL1kZxuP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(316002)(16576012)(66476007)(2616005)(38100700002)(44832011)(2906002)(31696002)(956004)(26005)(478600001)(53546011)(31686004)(66556008)(6486002)(5660300002)(16526019)(8676002)(186003)(36756003)(66946007)(86362001)(8936002)(83380400001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ejFKWFdiMWxIdUlrUTZ1TTM4U05idE9vWkVEOXFaTGd2bGVSYzVuc0tRRElX?=
 =?utf-8?B?SXM4bTF6aWoxRmF4ekNRWWhwWks4TXUwMlNrVzdRdHB4N1BPREtwY1NIekhh?=
 =?utf-8?B?QS9qakRJZ2ozQ1BDdEN1VEZLRTVTeUZHS1ZneGNFb3hwcnpud28yYVRjUEwx?=
 =?utf-8?B?bnFQdTEycksxb2pESmJBbENKTEFhbkdNYVhzNlhtVnQyakQzZHkzWnNJbURn?=
 =?utf-8?B?OFprVFRuS2dyU3h4bmduL25hMFJyNU5KcEI3Q2IrVXRRaFVOeGs1YmNFTE4w?=
 =?utf-8?B?dVN5ZWJBVkt3RUJpVGFrWklzK1R2Q2pIMWRIM281QW5qK3lUK25QTXZTRTlX?=
 =?utf-8?B?eEgzaEt1T3lnb0srT09JQ0kwM0J5Y1BjN2gxdUdoaE5tQVYydUx1djcvQjB4?=
 =?utf-8?B?czJ0L3F1aHk3TitIKzJheHRrOElQOWpqR0VUVlFUU3UyUG1JVEhDa1lyRVkx?=
 =?utf-8?B?ekJ4bTQ5SGlmRituYWJmNlJBSGlRZnVCdC8wZHJGblEzZkVJNnd6bTJBM3Fk?=
 =?utf-8?B?MVRGaWtNM0k2c2lyaWhVOURvSEp2THdnTmVZMlFTTkl6NXpaQWdBTXNMWGNh?=
 =?utf-8?B?WVNWd3owRWxLRmNmWEd6WmJLcjQ5TFJad2lCSmIzK3JOR0QwdE1DNWdMQXZ6?=
 =?utf-8?B?OHVUdnVlN3Y2UHh1OTlSVWp2d1J4M1pDTE5lbUlRZ3hQdGk4bWl3cThVQVc2?=
 =?utf-8?B?dFViTm9VNGdnWTFPcjRnNHA0UkVkamx6aFBtVkhQTFp6L0kyaWJMd2pRMFpU?=
 =?utf-8?B?VlBnak1DVDZvYnpRWGFISGJ3R00zL3o4TXVPUk04OWxKcU5rVG5Tc0phR0xo?=
 =?utf-8?B?TW1aNDk2WktNUmQwSk12bTlweFNjNG9lNktlNWIxZjNSL2xlNDk3OFg2NnF2?=
 =?utf-8?B?cXVvQi9MMnpDcm9kL3h5ck9na0FwVUZNUWxpOGpqd2U1N0NYT3NLSGF1K2p3?=
 =?utf-8?B?MTVZL055WjVoRFZZQUJpZy9ISUJFakErczFqTjJzWGFpUi9oN1RiL2ZsUk51?=
 =?utf-8?B?aWU2ZXBkN05zY0wzdWY2QjJ4K3RKL1BoSnFiSTFHNUFCcjR4U0czS0JwSjhE?=
 =?utf-8?B?R0c1YzVDczdYRFlZZENKdWx0Z1FOTUpoR1BLK1FMdG5YOVhMb1A4SGtqSFF5?=
 =?utf-8?B?VEFtdEpvNUwvT3BnMndHQ0NCaTlnVjVOenppNkRubkFUT3JYU0VwZzZyendW?=
 =?utf-8?B?dVoxWlNERHBoOVlOalBMUTk0bVlidVdHWkRVNVdRRHNCYTVRNTNPandmaUUz?=
 =?utf-8?B?dHNEMGlNWmhieU9EUlZqOHRRUXRlcHB3ek1DWlJ3bE1PZlFvaXlmc0lvMU02?=
 =?utf-8?B?ZzV6WlgyNEdUd0RBOGlXTmZjdDBRN095L2s0NGhBaXRSdHhodVNhNTZRc3ky?=
 =?utf-8?B?eUErbDE0blhBdGI0RjJqamVycUdFZExCRG9DVFRyZzdTcHllWFJ0Z1ZLRk1X?=
 =?utf-8?B?cWFZVCtsVUw2ZlozVENscWlOZDhWTDVQTDlnaEFNc1Vvc1RQRXcxZ202dXBB?=
 =?utf-8?B?SGdGWktFYTQ3eENsSTJVUW9WMXJDUWpqczhhU1daaTdCSHoxcXRVNmNBc04v?=
 =?utf-8?B?TlZlYzVGOGR5TUtRZmxkYjUycm9kS21WSjM2Q21GcUdWNVpCVkFScE5uUmM0?=
 =?utf-8?B?Wjlodld6NGVTSGpTUng3UUlOdUNBTHlWdkVrUFV6NnBQTTFoY3k1d0dUNHUw?=
 =?utf-8?B?S0FnVElWL2ZTQlRvdWpwd0poYnFYM0JOQ1FKYjhNMmFabHlza3lVTUg3YmNG?=
 =?utf-8?B?V0N1YUdrbDc3RXJ5VHJJQXBnYVNTZTVvYkVrUVh6Y2MyQWxMVGRmL1J5MWJz?=
 =?utf-8?B?NjJIMVp2bFFRUnZ1RGNQUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590b3693-faf3-4576-e769-08d8ff5c7af4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 15:46:48.2881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecI3Lk3XVXLKGzCiXHltjcPNJh0Czl5hFVASt491MiY8rVjGgnu25KG51IY+l9AyOqwPk/75V6hS7C0LqmfNxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4552
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
Cc: christian.koenig@amd.com, tzimmermann@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0xNCB1bSAxMTozNyBhLm0uIHNjaHJpZWIgcGhpbGlwIHlhbmc6Cj4KPgo+IE9u
IDIwMjEtMDQtMDcgNzoxMiBwLm0uLCBGZWxpeCBLdWVobGluZyB3cm90ZToKPj4gRFJNIGFsbG93
cyBhY2Nlc3MgYXV0b21hdGljYWxseSB3aGVuIGl0IGNyZWF0ZXMgYSBHRU0gaGFuZGxlIGZvciBh
IEJPLgo+PiBLRkQgQk9zIGRvbid0IGhhdmUgR0VNIGhhbmRsZXMsIHNvIEtGRCBuZWVkcyB0byBt
YW5hZ2UgYWNjZXNzIG1hbnVhbGx5Lgo+Cj4gQWZ0ZXIgcmVhZGluZyBkcm0gdm1hIG1hbmFnZXIs
IEkgdW5kZXJzdGFuZCBpdCB1c2VzIHJidHJlZSB0byBzdG9yZQo+IGFsbCBHUFUgZHJtIGZpbGUg
aGFuZGxlIHdoZW4gY2FsbGluZyBkcm1fdm1hX25vZGVfYWxsb3csCj4gZHJtX3ZtYV9ub2RlX2lz
X2FsbG93ZWQvZHJtX3ZtYV9ub2RlX3ZlcmlmeV9hY2Nlc3MgaXMgY2hlY2tlZCB3aGVuCj4gY3Jl
YXRpbmcgbWFwcGluZywgSSBkb24ndCB1bmRlcnN0YW5kIGhvdyBhcHBsaWNhdGlvbiB1c2VzIHRo
aXMsIGJ1dAo+IHNlZW1zIHdlIG5lZWQgY2FsbCBkcm1fdm1hX25vZGVfYWxsb3cgd2hlbgo+IGFt
ZGdwdV9hbWRrZmRfZ3B1dm1fbWFwX21lbW9yeV90b19ncHUsIHRvIGFkZCBtYXBwaW5nIEdQVXMg
ZHJtIGZpbGUKPiBoYW5kbGUgdG8gdm1hIG1hbmFnZXIuCj4KVGhlIGRybSBmaWxlIGhhbmRsZSBp
cyB1c2VkIGZvciBDUFUgbWFwcGluZyBvZiBCT3MgdXNpbmcgbW1hcCBieSB0aGUKVGh1bmsuIEl0
IHVzZXMgb24gdGhlIGZpbGUgaGFuZGxlIG9mIHRoZSBHUFUgd2hlcmUgdGhlIEJPIHdhcyBhbGxv
Y2F0ZWQuCkl0IGRvZXNuJ3QgbWF0dGVyIHdoYXQgb3RoZXIgR1BVcyBtYXAgdGhlIEJPIGluIHRo
ZWlyIGRldmljZSBwYWdlIHRhYmxlLgpUaGVyZWZvcmUgd2UgZG9uJ3QgbmVlZCB0byBjYWxsIGRy
bV92bWFfbm9kZV9hbGxvdyBpbgphbWRncHVfYW1ka2ZkX2dwdXZtX21hcF9tZW1vcnlfdG9fZ3B1
LgoKSSB3aWxsIGFkZCBhbiBleHBsYW5hdGlvbiBpbiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIGFi
b3V0IGhvdyB1c2VyIG1vZGUKZGVwZW5kcyBvbiB0aGlzIGFjY2VzcyBwZXJtaXNzaW9uLgoKUmVn
YXJkcywKwqAgRmVsaXgKCgo+IFJlZ2FyZHMsCj4KPiBQaGlsaXAKPgo+PiBTaWduZWQtb2ZmLWJ5
OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPj4gLS0tCj4+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmggICAgfCAgMyArKy0KPj4gIC4u
Li9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jICB8IDE5ICsrKysrKysr
KysrKysrKysrKy0KPj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMg
ICAgICB8ICA4ICsrKysrLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJv
Y2Vzcy5jICAgICAgfCAgNyArKysrLS0tCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkLmgKPj4gaW5kZXggMGQ1OWJlYmQ5MmFmLi43YzhjNWU0Njk3MDcgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaAo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmgKPj4gQEAgLTI0
NSw3ICsyNDUsOCBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1
KAo+PiAgCQl2b2lkICpkcm1fcHJpdiwgc3RydWN0IGtnZF9tZW0gKiptZW0sCj4+ICAJCXVpbnQ2
NF90ICpvZmZzZXQsIHVpbnQzMl90IGZsYWdzKTsKPj4gIGludCBhbWRncHVfYW1ka2ZkX2dwdXZt
X2ZyZWVfbWVtb3J5X29mX2dwdSgKPj4gLQkJc3RydWN0IGtnZF9kZXYgKmtnZCwgc3RydWN0IGtn
ZF9tZW0gKm1lbSwgdWludDY0X3QgKnNpemUpOwo+PiArCQlzdHJ1Y3Qga2dkX2RldiAqa2dkLCBz
dHJ1Y3Qga2dkX21lbSAqbWVtLCB2b2lkICpkcm1fcHJpdiwKPj4gKwkJdWludDY0X3QgKnNpemUp
Owo+PiAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fbWFwX21lbW9yeV90b19ncHUoCj4+ICAJCXN0
cnVjdCBrZ2RfZGV2ICprZ2QsIHN0cnVjdCBrZ2RfbWVtICptZW0sIHZvaWQgKmRybV9wcml2KTsK
Pj4gIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX3VubWFwX21lbW9yeV9mcm9tX2dwdSgKPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+PiBp
bmRleCA5NTQ0MmJjZDYwZmIuLmU3ZDYxZWM5NjZiNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+PiBAQCAtMTIzMiw2ICsx
MjMyLDEyIEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9ncHUoCj4+
ICAJCQkgZG9tYWluX3N0cmluZyhhbGxvY19kb21haW4pLCByZXQpOwo+PiAgCQlnb3RvIGVycl9i
b19jcmVhdGU7Cj4+ICAJfQo+PiArCXJldCA9IGRybV92bWFfbm9kZV9hbGxvdygmZ29iai0+dm1h
X25vZGUsIGRybV9wcml2KTsKPj4gKwlpZiAocmV0KSB7Cj4+ICsJCXByX2RlYnVnKCJGYWlsZWQg
dG8gYWxsb3cgdm1hIG5vZGUgYWNjZXNzLiByZXQgJWRcbiIsCj4+ICsJCQkgcmV0KTsKPgo+IHBy
X2RlYnVnKCJGYWlsZWQgdG8gYWxsb3cgdm1hIG5vZGUgYWNjZXNzLiByZXQgJWRcbiIsIHJldCk7
Cj4KPiBJdCdzIHdpdGhpbiA4MCBjb2x1bW5zLgo+Cj4gUGhpbGlwCj4KPj4gKwkJZ290byBlcnJf
bm9kZV9hbGxvdzsKPj4gKwl9Cj4+ICAJYm8gPSBnZW1fdG9fYW1kZ3B1X2JvKGdvYmopOwo+PiAg
CWlmIChib190eXBlID09IHR0bV9ib190eXBlX3NnKSB7Cj4+ICAJCWJvLT50Ym8uc2cgPSBzZzsK
Pj4gQEAgLTEyNjEsNiArMTI2Nyw4IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21l
bW9yeV9vZl9ncHUoCj4+ICAKPj4gIGFsbG9jYXRlX2luaXRfdXNlcl9wYWdlc19mYWlsZWQ6Cj4+
ICAJcmVtb3ZlX2tnZF9tZW1fZnJvbV9rZmRfYm9fbGlzdCgqbWVtLCBhdm0tPnByb2Nlc3NfaW5m
byk7Cj4+ICsJZHJtX3ZtYV9ub2RlX3Jldm9rZSgmZ29iai0+dm1hX25vZGUsIGRybV9wcml2KTsK
Pj4gK2Vycl9ub2RlX2FsbG93Ogo+PiAgCWFtZGdwdV9ib191bnJlZigmYm8pOwo+PiAgCS8qIERv
bid0IHVucmVzZXJ2ZSBzeXN0ZW0gbWVtIGxpbWl0IHR3aWNlICovCj4+ICAJZ290byBlcnJfcmVz
ZXJ2ZV9saW1pdDsKPj4gQEAgLTEyNzgsNyArMTI4Niw4IEBAIGludCBhbWRncHVfYW1ka2ZkX2dw
dXZtX2FsbG9jX21lbW9yeV9vZl9ncHUoCj4+ICB9Cj4+ICAKPj4gIGludCBhbWRncHVfYW1ka2Zk
X2dwdXZtX2ZyZWVfbWVtb3J5X29mX2dwdSgKPj4gLQkJc3RydWN0IGtnZF9kZXYgKmtnZCwgc3Ry
dWN0IGtnZF9tZW0gKm1lbSwgdWludDY0X3QgKnNpemUpCj4+ICsJCXN0cnVjdCBrZ2RfZGV2ICpr
Z2QsIHN0cnVjdCBrZ2RfbWVtICptZW0sIHZvaWQgKmRybV9wcml2LAo+PiArCQl1aW50NjRfdCAq
c2l6ZSkKPj4gIHsKPj4gIAlzdHJ1Y3QgYW1ka2ZkX3Byb2Nlc3NfaW5mbyAqcHJvY2Vzc19pbmZv
ID0gbWVtLT5wcm9jZXNzX2luZm87Cj4+ICAJdW5zaWduZWQgbG9uZyBib19zaXplID0gbWVtLT5i
by0+dGJvLmJhc2Uuc2l6ZTsKPj4gQEAgLTEzNTUsNiArMTM2NCw3IEBAIGludCBhbWRncHVfYW1k
a2ZkX2dwdXZtX2ZyZWVfbWVtb3J5X29mX2dwdSgKPj4gIAl9Cj4+ICAKPj4gIAkvKiBGcmVlIHRo
ZSBCTyovCj4+ICsJZHJtX3ZtYV9ub2RlX3Jldm9rZSgmbWVtLT5iby0+dGJvLmJhc2Uudm1hX25v
ZGUsIGRybV9wcml2KTsKPj4gIAlkcm1fZ2VtX29iamVjdF9wdXQoJm1lbS0+Ym8tPnRiby5iYXNl
KTsKPj4gIAltdXRleF9kZXN0cm95KCZtZW0tPmxvY2spOwo+PiAgCWtmcmVlKG1lbSk7Cj4+IEBA
IC0xNjY2LDYgKzE2NzYsNyBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9pbXBvcnRfZG1hYnVm
KHN0cnVjdCBrZ2RfZGV2ICprZ2QsCj4+ICAJc3RydWN0IGFtZGdwdV92bSAqYXZtID0gZHJtX3By
aXZfdG9fdm0oZHJtX3ByaXYpOwo+PiAgCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOwo+PiAg
CXN0cnVjdCBhbWRncHVfYm8gKmJvOwo+PiArCWludCByZXQ7Cj4+ICAKPj4gIAlpZiAoZG1hX2J1
Zi0+b3BzICE9ICZhbWRncHVfZG1hYnVmX29wcykKPj4gIAkJLyogQ2FuJ3QgaGFuZGxlIG5vbi1n
cmFwaGljcyBidWZmZXJzICovCj4+IEBAIC0xNjg2LDYgKzE2OTcsMTIgQEAgaW50IGFtZGdwdV9h
bWRrZmRfZ3B1dm1faW1wb3J0X2RtYWJ1ZihzdHJ1Y3Qga2dkX2RldiAqa2dkLAo+PiAgCWlmICgh
Km1lbSkKPj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4+ICAKPj4gKwlyZXQgPSBkcm1fdm1hX25vZGVf
YWxsb3coJm9iai0+dm1hX25vZGUsIGRybV9wcml2KTsKPj4gKwlpZiAocmV0KSB7Cj4+ICsJCWtm
cmVlKG1lbSk7Cj4+ICsJCXJldHVybiByZXQ7Cj4+ICsJfQo+PiArCj4+ICAJaWYgKHNpemUpCj4+
ICAJCSpzaXplID0gYW1kZ3B1X2JvX3NpemUoYm8pOwo+PiAgCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2NoYXJkZXYuYwo+PiBpbmRleCA0M2RlMjYwYjIyMzAuLjhmYzE4ZGU3Y2Zm
NCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYu
Ywo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jCj4+IEBA
IC0xMzI4LDcgKzEzMjgsOCBAQCBzdGF0aWMgaW50IGtmZF9pb2N0bF9hbGxvY19tZW1vcnlfb2Zf
Z3B1KHN0cnVjdCBmaWxlICpmaWxlcCwKPj4gIAlyZXR1cm4gMDsKPj4gIAo+PiAgZXJyX2ZyZWU6
Cj4+IC0JYW1kZ3B1X2FtZGtmZF9ncHV2bV9mcmVlX21lbW9yeV9vZl9ncHUoZGV2LT5rZ2QsIChz
dHJ1Y3Qga2dkX21lbSAqKW1lbSwgTlVMTCk7Cj4+ICsJYW1kZ3B1X2FtZGtmZF9ncHV2bV9mcmVl
X21lbW9yeV9vZl9ncHUoZGV2LT5rZ2QsIChzdHJ1Y3Qga2dkX21lbSAqKW1lbSwKPj4gKwkJCQkJ
ICAgICAgIHBkZC0+dm0sIE5VTEwpOwo+PiAgZXJyX3VubG9jazoKPj4gIAltdXRleF91bmxvY2so
JnAtPm11dGV4KTsKPj4gIAlyZXR1cm4gZXJyOwo+PiBAQCAtMTM2NSw3ICsxMzY2LDcgQEAgc3Rh
dGljIGludCBrZmRfaW9jdGxfZnJlZV9tZW1vcnlfb2ZfZ3B1KHN0cnVjdCBmaWxlICpmaWxlcCwK
Pj4gIAl9Cj4+ICAKPj4gIAlyZXQgPSBhbWRncHVfYW1ka2ZkX2dwdXZtX2ZyZWVfbWVtb3J5X29m
X2dwdShkZXYtPmtnZCwKPj4gLQkJCQkJCShzdHJ1Y3Qga2dkX21lbSAqKW1lbSwgJnNpemUpOwo+
PiArCQkJCQkoc3RydWN0IGtnZF9tZW0gKiltZW0sIHBkZC0+dm0sICZzaXplKTsKPj4gIAo+PiAg
CS8qIElmIGZyZWVpbmcgdGhlIGJ1ZmZlciBmYWlsZWQsIGxlYXZlIHRoZSBoYW5kbGUgaW4gcGxh
Y2UgZm9yCj4+ICAJICogY2xlYW4tdXAgZHVyaW5nIHByb2Nlc3MgdGVhci1kb3duLgo+PiBAQCAt
MTcyMSw3ICsxNzIyLDggQEAgc3RhdGljIGludCBrZmRfaW9jdGxfaW1wb3J0X2RtYWJ1ZihzdHJ1
Y3QgZmlsZSAqZmlsZXAsCj4+ICAJcmV0dXJuIDA7Cj4+ICAKPj4gIGVycl9mcmVlOgo+PiAtCWFt
ZGdwdV9hbWRrZmRfZ3B1dm1fZnJlZV9tZW1vcnlfb2ZfZ3B1KGRldi0+a2dkLCAoc3RydWN0IGtn
ZF9tZW0gKiltZW0sIE5VTEwpOwo+PiArCWFtZGdwdV9hbWRrZmRfZ3B1dm1fZnJlZV9tZW1vcnlf
b2ZfZ3B1KGRldi0+a2dkLCAoc3RydWN0IGtnZF9tZW0gKiltZW0sCj4+ICsJCQkJCSAgICAgICBw
ZGQtPnZtLCBOVUxMKTsKPj4gIGVycl91bmxvY2s6Cj4+ICAJbXV0ZXhfdW5sb2NrKCZwLT5tdXRl
eCk7Cj4+ICAJZG1hX2J1Zl9wdXQoZG1hYnVmKTsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfcHJvY2Vzcy5jCj4+IGluZGV4IGJhZDBlY2Q2ZWY4Ny4uZGE0NTI0MDdjNGU1IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMKPj4gQEAgLTY0OCw3
ICs2NDgsNyBAQCBzdGF0aWMgdm9pZCBrZmRfcHJvY2Vzc19mcmVlX2dwdXZtKHN0cnVjdCBrZ2Rf
bWVtICptZW0sCj4+ICAJc3RydWN0IGtmZF9kZXYgKmRldiA9IHBkZC0+ZGV2Owo+PiAgCj4+ICAJ
YW1kZ3B1X2FtZGtmZF9ncHV2bV91bm1hcF9tZW1vcnlfZnJvbV9ncHUoZGV2LT5rZ2QsIG1lbSwg
cGRkLT52bSk7Cj4+IC0JYW1kZ3B1X2FtZGtmZF9ncHV2bV9mcmVlX21lbW9yeV9vZl9ncHUoZGV2
LT5rZ2QsIG1lbSwgTlVMTCk7Cj4+ICsJYW1kZ3B1X2FtZGtmZF9ncHV2bV9mcmVlX21lbW9yeV9v
Zl9ncHUoZGV2LT5rZ2QsIG1lbSwgcGRkLT52bSwgTlVMTCk7Cj4+ICB9Cj4+ICAKPj4gIC8qIGtm
ZF9wcm9jZXNzX2FsbG9jX2dwdXZtIC0gQWxsb2NhdGUgR1BVIFZNIGZvciB0aGUgS0ZEIHByb2Nl
c3MKPj4gQEAgLTcxMiw3ICs3MTIsNyBAQCBzdGF0aWMgaW50IGtmZF9wcm9jZXNzX2FsbG9jX2dw
dXZtKHN0cnVjdCBrZmRfcHJvY2Vzc19kZXZpY2UgKnBkZCwKPj4gIAlyZXR1cm4gZXJyOwo+PiAg
Cj4+ICBlcnJfbWFwX21lbToKPj4gLQlhbWRncHVfYW1ka2ZkX2dwdXZtX2ZyZWVfbWVtb3J5X29m
X2dwdShrZGV2LT5rZ2QsIG1lbSwgTlVMTCk7Cj4+ICsJYW1kZ3B1X2FtZGtmZF9ncHV2bV9mcmVl
X21lbW9yeV9vZl9ncHUoa2Rldi0+a2dkLCBtZW0sIHBkZC0+dm0sIE5VTEwpOwo+PiAgZXJyX2Fs
bG9jX21lbToKPj4gIAkqa3B0ciA9IE5VTEw7Cj4+ICAJcmV0dXJuIGVycjsKPj4gQEAgLTkwNyw3
ICs5MDcsOCBAQCBzdGF0aWMgdm9pZCBrZmRfcHJvY2Vzc19kZXZpY2VfZnJlZV9ib3Moc3RydWN0
IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkKQo+PiAgCQkJCXBlZXJfcGRkLT5kZXYtPmtnZCwgbWVt
LCBwZWVyX3BkZC0+dm0pOwo+PiAgCQl9Cj4+ICAKPj4gLQkJYW1kZ3B1X2FtZGtmZF9ncHV2bV9m
cmVlX21lbW9yeV9vZl9ncHUocGRkLT5kZXYtPmtnZCwgbWVtLCBOVUxMKTsKPj4gKwkJYW1kZ3B1
X2FtZGtmZF9ncHV2bV9mcmVlX21lbW9yeV9vZl9ncHUocGRkLT5kZXYtPmtnZCwgbWVtLAo+PiAr
CQkJCQkJICAgICAgIHBkZC0+dm0sIE5VTEwpOwo+PiAgCQlrZmRfcHJvY2Vzc19kZXZpY2VfcmVt
b3ZlX29ial9oYW5kbGUocGRkLCBpZCk7Cj4+ICAJfQo+PiAgfQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngK

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684C230D555
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Feb 2021 09:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10BB89194;
	Wed,  3 Feb 2021 08:36:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1EC6EA16;
 Wed,  3 Feb 2021 08:36:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaNaQh1bMX3fO+haXt1zG+8atqOLxgkRILGnctDBq+4RT+MZoWXo7m26IFTwvO7Pm+XzepRjwVS6Pmyi8sSzdSIEh3qku2Z5Ssjm8+TM/Rqo6lm2CFrib4FDxZAHvepkHWWzlnp3sAK+8obmy+FXW2iuto9IRoyeMbZ79z6dkXW9ueQTX/mxVxI4UYIr55+dwTxS9uhjugBBsnZ0PNWbtTIr2Ed/tqWbx1lJ/AAeRnrWi94DtirS824u6cOGr1G8jjZtVF/44ITJmjJtYXWhO3pDOlfLct/Kp7lBQQTMklIfb2YXeU01/19FRWhhiYlVxk6uM7BT3d7APFLE2mZ9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2taqLDRtvN/1R3xPgvTbgNOgvRCBDGepU4eTv1QrPz8=;
 b=PCPPLrp4cs4q9QHlndj1OTDNmdZ75rz1kvqKzaoucullV7xwGMBYOyg9KdXguBV5HC5J79bb4oAdStFG6OeB+nq/oKci0iDpzWEmPIq6tdHR5+NNaFb3pRyqP32oTaPd6AhJxJd5IUkDdyIaZeHQss3YT6wP2gK5t491GDK8UDkvZ85vaR6hp/67t9zqtXP2zafnEU8VDVDxEaWMPqdKyAz3lLA+76ayFCCHuGDi7AtuCcE+mAf+EUS4FD/JcxV3wYa9IQRZqFHgT+h+UzWNpGI8UAT2CgdEzG2+65l+GMeyLkoewbq6Teo44wyUKUhIQj+Jms/Xl0qe1BXjPkGCoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2taqLDRtvN/1R3xPgvTbgNOgvRCBDGepU4eTv1QrPz8=;
 b=yBbo8n8aRcSzUF7EtD4wgyU1NuBBbAs4IxCOKFAJiKZ2D9t9MU1ASpK9icCBYIqHSwBqXixCQa1VPxVXgAaKvDDnmYqsp482R9xZDLg/ngKQW+jEtWVlTnW9X0Pttu4TcwNDNZ3InWx+nB/2vnATL2/KN5ZOY3JTu8zmtPkv7iU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4552.namprd12.prod.outlook.com (2603:10b6:208:24f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 08:36:45 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3805.024; Wed, 3 Feb 2021
 08:36:45 +0000
Subject: Re: [amdgpu] deadlock
To: Daniel Gomez <daniel@qtec.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <CAH1Ww+TPCSyiaC3oeoWPtsi-vDfDY=K4ByoLD37-onMvsAB5Rg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <58e41b62-b8e0-b036-c87d-a84d53f5a26e@amd.com>
Date: Wed, 3 Feb 2021 09:36:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAH1Ww+TPCSyiaC3oeoWPtsi-vDfDY=K4ByoLD37-onMvsAB5Rg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 08:36:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4efce771-bc03-4f5f-44cd-08d8c81ed6d4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4552987EF9B8A8072A38225C83B49@MN2PR12MB4552.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Po9r47subTUOhkDTB9r9z93BhSUf8zeWu7PV0J6z9CTFnAXuBnxKfHwhsSKRE59C+9SYzGjP9JvnOuvmFTSJzm++8NhZvv4gk9V9zXZA6y1TeZgZ9RzQZsdFDlvXJ0xiyA2Y5HQwFe2Hb05+v4x5Ef9rJ6a9IIlwNjSy4z1j95m7WBunHWN7U0R3XOjyOwh4u2pYrCoBLPN4fYeCmnakwuFZTdgO0KAQt0MYDfcMTKpExQpUZeb7t97fA1p2wD73+cXkLJ6DBZIOhuCShCzLc7J190Bqb6l4Mtj/AZ3R87SSkH1pOK/zJzH6KcLk/JmwuVwv+eShEAynJW6NFoociBomyo8EhLxU6UIs8bubIjolVbzqdoiP/6+AAOyzB5zA1UYsvVdWCXW9wHEhOkMNI3BQ0Y84toK9IcN3s5OYYDeXO9sgG+dsGMQfdFNeE0eAqFT9gAibz2NDZdcrKZjTtiUGFOAvv+XsitK4PAaGq/qpSkEXw7oO13Dnvzc2QmjuzeztXKyqz3//o04ddriBzrQs/UYXVDPItqqczhjDdrWiRHRUeN1FRFVn6AgT8p34p1/T0T2z5NMztO3SeRLX5H5imcggUJjXf4jr364GFSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(316002)(52116002)(6486002)(16526019)(31686004)(478600001)(6666004)(36756003)(31696002)(4326008)(5660300002)(86362001)(2906002)(186003)(8676002)(2616005)(83380400001)(66476007)(8936002)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a2plbXpVVGRhemZTU2VEVzZLTENjTEY2SS9QcVBHNThmRm5LN3BBamhZY0FW?=
 =?utf-8?B?Q1R0dGJPNUZJai9xYmhlbzZONTNWOC9OZHcxOHpnNFgvUWdCVGZ1cjdxL1Fn?=
 =?utf-8?B?RjJPUkN5N01kUnkvVnhabVdGSVNHaHNXWEl1RlNUVmJCeFRUMVBFTFhkNzJ0?=
 =?utf-8?B?WDFidXMwcVdXNktKSGk4RTJrM3N1ZlZYN21HZEV6OTB1L05Kck54UHZsY3Ey?=
 =?utf-8?B?Rks1WXFCZHpCaERlb21zQW91VXpzMDV3MEFUM1FpUnpqcWNoUUxyc3Y3K25X?=
 =?utf-8?B?RUxBRk9hNkRhdDZFN2RlNkZlME50bzBNQlpacGVWUWZYbHQ3RmZ4NkY4b3FY?=
 =?utf-8?B?MHRZRjRCK3ppbjJQSHhkQk1KN20wbE03bEtncjNUaHhZdThUR0E4QzFGOHRq?=
 =?utf-8?B?YU14ZlFaK2ZMeWZFR2lnV2kvVGM0MjBmUXErVFhkKzhTbHFUOUh5YkRTY0Ix?=
 =?utf-8?B?RGlkWDF5VVlsVCtZSElQMmErSkZyZmd2NUJWUHIwYU9zTU9vSllscXlqSURW?=
 =?utf-8?B?cHNPMERYTmtsVnpYdktUTkxjRXU2WGkrQTJnUkhrbkNWQTJoK1pMbDdxZ2Ji?=
 =?utf-8?B?alFTS1JuNHNiZkc3U3lOSUJBaU5Ba21kUkNtcEpPaE93UmQ3T1FtOExQcXFq?=
 =?utf-8?B?aFBnM0V6TFp1OFowWHBpK2JVR3IwQmxneE9ReW5kc1B6ZU5WUGdudW4rSktJ?=
 =?utf-8?B?dU5zdVE5ZUoxUVhqS2ZybUd0ekJhZ2N2R09Oay9RcENxdHRlLzdXMlVMSEcx?=
 =?utf-8?B?ajkyTjBLUVFxcDNFamtvbkxuZWVLR0pwT2FmVG5SNUxQS1N6NzI0OU15ZlJx?=
 =?utf-8?B?Ynp6enhYdW1mVDYwVEo0SHhRbWNxdHVYZnlQMitXcWtIRzlKTE9PMEY0WURI?=
 =?utf-8?B?dkp6amlISHBiNFM1SVBIZXh1L0hRVjFBd2s2L29TUi80VWlEMC9sTHY3UmZl?=
 =?utf-8?B?UWRFaVppSE1Kb2svOWtyTGM3Tkw5eWh0MHplTm0rbVY5MzF6VVBMeEVUakwz?=
 =?utf-8?B?VTFsS2Q5MmNRckoyUG54UlBVQTVQSXlONUxJNkdxa1c0R0YvSWVJL0pqMVhU?=
 =?utf-8?B?Smo3VnFCZW9QWDJUSTNQYlNuSlZxdnAyN2RZd245KzgrYjBEL2hDRGVWdGd0?=
 =?utf-8?B?MDFxajVUUTYrYUZLaTR5ay9Ka2VUbUMvM2JpWmJ3d09XaHJuQjVNTnpLM0gv?=
 =?utf-8?B?TFhEamxVcVl4UDF0b3k4WlJTRW9xOGg1T0o3N1BlaU9adVI5RFk1S09Tekxn?=
 =?utf-8?B?Y0JWNzZWMnpEZ2REcUIzNm1XTXFsMzhLM1MwaFFhelpXTUVSczNBVjh2WjRv?=
 =?utf-8?B?QXE3Ykd4VllUUEdRVUhRTHZFZVlXczJBc0l3Yk9xWVpjcklJajJMa0htU1M5?=
 =?utf-8?B?c3lQR3VyOXdKMzJPOENHU21ldlFzRVRkREk4ei80VWlUSjNtNFE3dGQ2Rkx5?=
 =?utf-8?B?RUN1UU1lNFZNVFVKTWJoWXB2RFRsWndCM2F3K2c2YWxhcVg3b05GNjQwSTVL?=
 =?utf-8?B?Nm5rK1l4Q3VYZjJyTnFDM0FRYjcvS01pcWNPSUpFRnZDNG11SS9sU21EWk1u?=
 =?utf-8?B?KzdZODdNYnVGeHBseWpwVWFFVnpYLzVzTlhJTlZsY0w2SEZhOWxWNFFjUnh2?=
 =?utf-8?B?SnFIWEhQV3haWDZkUlE0QU05cktyWitkNkNydWRvNyt2RVBncWZPZnZNYUNF?=
 =?utf-8?B?ZGw0ajd6U1FERFduaEIrOWJPL1VSTFZKRGlBNEUrWFovWER5OUZLRW9valV5?=
 =?utf-8?B?RXBDSUpRVFBXNnJXYnlYQXU1Skx6eXhveStjaXZDV0VsUk1waEVoa0JZK2Jr?=
 =?utf-8?B?NThaaEFUU0UxWTVvbzVZU0JKelpkR25hK3NIRGpPTFhpWUtQY0VNUkZiVW03?=
 =?utf-8?Q?yb5P4brCdfLhA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efce771-bc03-4f5f-44cd-08d8c81ed6d4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 08:36:45.3503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POD2S7mtVbD6yyw5W8WFonSvfwTwZj/Dq5j00tXZajeaxbGiIXUGTu/DJuo/9XQO
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
Cc: alexander.deucher@amd.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKdGhpcyBpcyBub3QgYSBkZWFkbG9jaywgYnV0IHJhdGhlciBhIGhhcmR3YXJl
IGxvY2t1cC4KCldoaWNoIE9wZW5DbCBzdGFjayBhcmUgeW91IHVzaW5nPwoKUmVnYXJkcywKQ2hy
aXN0aWFuLgoKQW0gMDMuMDIuMjEgdW0gMDk6MzMgc2NocmllYiBEYW5pZWwgR29tZXo6Cj4gSGkg
YWxsLAo+Cj4gSSBoYXZlIGEgZGVhZGxvY2sgd2l0aCB0aGUgYW1kZ3B1IG1haW5saW5lIGRyaXZl
ciB3aGVuIHJ1bm5pbmcgaW4gcGFyYWxsZWwgdHdvCj4gT3BlbkNMIGFwcGxpY2F0aW9ucy4gU28g
ZmFyLCB3ZSd2ZSBiZWVuIGFibGUgdG8gcmVwbGljYXRlIGl0IGVhc2lseSBieSBleGVjdXRpbmcK
PiBjbGluZm8gYW5kIE1hdHJpeE11bHRpcGxpY2F0aW9uIChmcm9tIEFNRCBvcGVuY2wtc2FtcGxl
cykuIEl0J3MgcXVpdGUgb2xkIHRoZQo+IG9wZW5jbC1zYW1wbGVzIHNvLCBpZiB5b3UgaGF2ZSBh
bnkgb3RoZXIgc3VnZ2VzdGlvbiBmb3IgdGVzdGluZyBJJ2QgYmUgdmVyeQo+IGhhcHB5IHRvIHRl
c3QgaXQgYXMgd2VsbC4KPgo+IEhvdyB0byByZXBsaWNhdGUgdGhlIGlzc3VlOgo+Cj4gIyB3aGls
ZSB0cnVlOyBkbyAvdXNyL2Jpbi9NYXRyaXhNdWx0aXBsaWNhdGlvbiAtLWRldmljZSBncHUgXAo+
ICAgICAgLS1kZXZpY2VJZCAwIC14IDEwMDAgLXkgMTAwMCAteiAxMDAwIC1xIC10IC1pIDUwOyBk
b25lCj4gIyB3aGlsZSB0cnVlOyBkbyBjbGluZm87IGRvbmUKPgo+IE91dHB1dDoKPgo+IEFmdGVy
IGEgbWludXRlIG9yIGxlc3MgKHNvbWV0aW1lcyBjb3VsZCBiZSBtb3JlKSBJIGNhbiBzZWUgdGhh
dAo+IE1hdHJpeE11bHRpcGxpY2F0aW9uIGFuZCBjbGluZm8gaGFuZy4gSW4gYWRkaXRpb24sIHdp
dGggcmFkZW9udG9wIHlvdSBjYW4gc2VlCj4gaG93IHRoZSBHcmFwaGljcyBwaXBlIGdvZXMgZnJv
bSB+NTAlIHRvIDEwMCUuIEFsc28gdGhlIHNoYWRlciBjbG9ja3MKPiBnb2VzIHVwIGZyb20gfjM1
JSB0byB+OTYlLgo+Cj4gY2xpbmZvIGtlZXBzIHByaW50aW5nOgo+IGlvY3RsKDcsIERSTV9JT0NU
TF9TWU5DT0JKX1dBSVQsIDB4N2ZmZTQ2ZTVmOTUwKSA9IC0xIEVUSU1FIChUaW1lciBleHBpcmVk
KQo+Cj4gQW5kIE1hdHJpeE11bHRpcGxpY2F0aW9uIHByaW50cyB0aGUgZm9sbG93aW5nIChzdHJh
Y2UpIGlmIHlvdSB0cnkgdG8KPiBraWxsIHRoZSBwcm9jZXNzOgo+Cj4gc2NoZWRfeWllbGQoKSAg
ICAgICAgICAgICAgICAgICAgICAgICAgID0gMAo+IGZ1dGV4KDB4NTU3ZTk0NTM0M2I4LCBGVVRF
WF9XQUlUX0JJVFNFVF9QUklWQVRFfEZVVEVYX0NMT0NLX1JFQUxUSU1FLCAwLAo+IE5VTEwsIEZV
VEVYX0JJVFNFVF9NQVRDSF9BTllzdHJhY2U6IFByb2Nlc3MgNjUxIGRldGFjaGVkCj4gICA8ZGV0
YWNoZWQgLi4uPgo+Cj4gQWZ0ZXIgdGhpcywgdGhlIGdwdSBpcyBub3QgZnVuY3Rpb25hbCBhdCBh
bGwgYW5kIHlvdSdkIG5lZWQgYSBwb3dlciBjeWNsZSByZXNldAo+IHRvIHJlc3RvcmUgdGhlIHN5
c3RlbS4KPgo+IEhhcmR3YXJlIGluZm86Cj4gQ1BVOiBBTUQgUnl6ZW4gRW1iZWRkZWQgVjE2MDVC
IHdpdGggUmFkZW9uIFZlZ2EgR2Z4ICg4KSBAIDIuMDAwR0h6Cj4gR1BVOiBBTUQgQVRJIFJhZGVv
biBWZWdhIFNlcmllcyAvIFJhZGVvbiBWZWdhIE1vYmlsZSBTZXJpZXMKPgo+IDAzOjAwLjAgVkdB
IGNvbXBhdGlibGUgY29udHJvbGxlcjogQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgo+IFtB
TUQvQVRJXSBSYXZlbiBSaWRnZSBbUmFkZW9uIFZlZ2EgU2VyaWVzIC8gUmFkZW9uIFZlZ2EgTW9i
aWxlIFNlcmllc10KPiAocmV2IDgzKQo+ICAgICAgRGV2aWNlTmFtZTogQnJvYWRjb20gNTc2Mgo+
ICAgICAgU3Vic3lzdGVtOiBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtBTUQvQVRJXSBS
YXZlbiBSaWRnZQo+IFtSYWRlb24gVmVnYSBTZXJpZXMgLyBSYWRlb24gVmVnYSBNb2JpbGUgU2Vy
aWVzXQo+ICAgICAgS2VybmVsIGRyaXZlciBpbiB1c2U6IGFtZGdwdQo+ICAgICAgS2VybmVsIG1v
ZHVsZXM6IGFtZGdwdQo+Cj4gTGludXgga2VybmVsIGluZm86Cj4KPiByb290QHF0NTIyMjp+IyB1
bmFtZSAtYQo+IExpbnV4IHF0NTIyMiA1LjExLjAtcmM2LXF0ZWMtc3RhbmRhcmQgIzIgU01QIFR1
ZSBGZWIgMiAwOTo0MTo0NiBVVEMKPiAyMDIxIHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9MaW51
eAo+Cj4gQnkgZW5hYmxpbmcgdGhlIGtlcm5lbCBsb2NrcyBzdGF0cyBJIGNvdWxkIHNlZSB0aGUg
TWF0cml4TXVsdGlwbGljYXRpb24gaXMKPiBoYW5nZWQgaW4gdGhlIGFtZGdwdV9tbl9pbnZhbGlk
YXRlX2dmeCBmdW5jdGlvbjoKPgo+IFsgIDczOC4zNTkyMDJdIDEgbG9jayBoZWxkIGJ5IE1hdHJp
eE11bHRpcGxpYy82NTM6Cj4gWyAgNzM4LjM1OTIwNl0gICMwOiBmZmZmODg4MTBlMzY0ZmUwCj4g
KCZhZGV2LT5ub3RpZmllcl9sb2NrKXsrLisufS17MzozfSwgYXQ6Cj4gYW1kZ3B1X21uX2ludmFs
aWRhdGVfZ2Z4KzB4MzQvMHhhMCBbYW1kZ3B1XQo+Cj4gSSBjYW4gc2VlIGluIHRoZSB0aGUgYW1k
Z3B1X21uX2ludmFsaWRhdGVfZ2Z4IGZ1bmN0aW9uOiB0aGUKPiBkbWFfcmVzdl93YWl0X3RpbWVv
dXRfcmN1IHVzZXMgd2FpdF9hbGwgKGZlbmNlcykgYW5kIE1BWF9TQ0hFRFVMRV9USU1FT1VUIHNv
LCBJCj4gZ3Vlc3MgdGhlIGNvZGUgZ2V0cyBzdHVjayB0aGVyZSB3YWl0aW5nIGZvcmV2ZXIuIEFj
Y29yZGluZyB0byB0aGUKPiBkb2N1bWVudGF0aW9uOiAiV2hlbiBzb21lYm9keSB0cmllcyB0byBp
bnZhbGlkYXRlIHRoZSBwYWdlIHRhYmxlcyB3ZSBibG9jayB0aGUKPiB1cGRhdGUgdW50aWwgYWxs
IG9wZXJhdGlvbnMgb24gdGhlIHBhZ2VzIGluIHF1ZXN0aW9uIGFyZSBjb21wbGV0ZWQsIHRoZW4g
dGhvc2UKPiBwYWdlcyBhcmUgbWFya2VkICBhcyBhY2Nlc3NlZCBhbmQgYWxzbyBkaXJ0eSBpZiBp
dCB3YXNu4oCZdCBhIHJlYWQgb25seSBhY2Nlc3MuIgo+IExvb2tzIGxpa2UgdGhlIGZlbmNlcyBh
cmUgZGVhZGxvY2tlZCBhbmQgdGhlcmVmb3JlLCBpdCBuZXZlciByZXR1cm5zLiBDb3VsZCBpdAo+
IGJlIHBvc3NpYmxlPyBhbnkgaGludCB0byB3aGVyZSBjYW4gSSBsb29rIHRvIGZpeCB0aGlzPwo+
Cj4gVGhhbmsgeW91ICBpbiBhZHZhbmNlLgo+Cj4gSGVyZSB0aGUgZnVsbCBkbWVzZyBvdXRwdXQ6
Cj4KPiBbICA3MzguMzM3NzI2XSBJTkZPOiB0YXNrIE1hdHJpeE11bHRpcGxpYzo2NTMgYmxvY2tl
ZCBmb3IgbW9yZSB0aGFuIDEyMiBzZWNvbmRzLgo+IFsgIDczOC4zNDQ5MzddICAgICAgIE5vdCB0
YWludGVkIDUuMTEuMC1yYzYtcXRlYy1zdGFuZGFyZCAjMgo+IFsgIDczOC4zNTAzODRdICJlY2hv
IDAgPiAvcHJvYy9zeXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0X3NlY3MiCj4gZGlzYWJsZXMg
dGhpcyBtZXNzYWdlLgo+IFsgIDczOC4zNTgyNDBdIHRhc2s6TWF0cml4TXVsdGlwbGljIHN0YXRl
OkQgc3RhY2s6ICAgIDAgcGlkOiAgNjUzCj4gcHBpZDogICAgIDEgZmxhZ3M6MHgwMDAwNDAwMAo+
IFsgIDczOC4zNTgyNTRdIENhbGwgVHJhY2U6Cj4gWyAgNzM4LjM1ODI2MV0gID8gZG1hX2ZlbmNl
X2RlZmF1bHRfd2FpdCsweDFlYi8weDIzMAo+IFsgIDczOC4zNTgyNzZdICBfX3NjaGVkdWxlKzB4
MzcwLzB4OTYwCj4gWyAgNzM4LjM1ODI5MV0gID8gZG1hX2ZlbmNlX2RlZmF1bHRfd2FpdCsweDEx
Ny8weDIzMAo+IFsgIDczOC4zNTgyOTddICA/IGRtYV9mZW5jZV9kZWZhdWx0X3dhaXQrMHgxZWIv
MHgyMzAKPiBbICA3MzguMzU4MzA1XSAgc2NoZWR1bGUrMHg1MS8weGMwCj4gWyAgNzM4LjM1ODMx
Ml0gIHNjaGVkdWxlX3RpbWVvdXQrMHgyNzUvMHgzODAKPiBbICA3MzguMzU4MzI0XSAgPyBkbWFf
ZmVuY2VfZGVmYXVsdF93YWl0KzB4MWViLzB4MjMwCj4gWyAgNzM4LjM1ODMzMl0gID8gbWFya19o
ZWxkX2xvY2tzKzB4NGYvMHg3MAo+IFsgIDczOC4zNTgzNDFdICA/IGRtYV9mZW5jZV9kZWZhdWx0
X3dhaXQrMHgxMTcvMHgyMzAKPiBbICA3MzguMzU4MzQ3XSAgPyBsb2NrZGVwX2hhcmRpcnFzX29u
X3ByZXBhcmUrMHhkNC8weDE4MAo+IFsgIDczOC4zNTgzNTNdICA/IF9yYXdfc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSsweDM5LzB4NDAKPiBbICA3MzguMzU4MzYyXSAgPyBkbWFfZmVuY2VfZGVmYXVs
dF93YWl0KzB4MTE3LzB4MjMwCj4gWyAgNzM4LjM1ODM3MF0gID8gZG1hX2ZlbmNlX2RlZmF1bHRf
d2FpdCsweDFlYi8weDIzMAo+IFsgIDczOC4zNTgzNzVdICBkbWFfZmVuY2VfZGVmYXVsdF93YWl0
KzB4MjE0LzB4MjMwCj4gWyAgNzM4LjM1ODM4NF0gID8gZG1hX2ZlbmNlX3JlbGVhc2UrMHgxYTAv
MHgxYTAKPiBbICA3MzguMzU4Mzk2XSAgZG1hX2ZlbmNlX3dhaXRfdGltZW91dCsweDEwNS8weDIw
MAo+IFsgIDczOC4zNTg0MDVdICBkbWFfcmVzdl93YWl0X3RpbWVvdXRfcmN1KzB4MWFhLzB4NWUw
Cj4gWyAgNzM4LjM1ODQyMV0gIGFtZGdwdV9tbl9pbnZhbGlkYXRlX2dmeCsweDU1LzB4YTAgW2Ft
ZGdwdV0KPiBbICA3MzguMzU4Njg4XSAgX19tbXVfbm90aWZpZXJfcmVsZWFzZSsweDFiYi8weDIx
MAo+IFsgIDczOC4zNTg3MTBdICBleGl0X21tYXArMHgyZi8weDFlMAo+IFsgIDczOC4zNTg3MjNd
ICA/IGZpbmRfaGVsZF9sb2NrKzB4MzQvMHhhMAo+IFsgIDczOC4zNTg3NDZdICBtbXB1dCsweDM5
LzB4ZTAKPiBbICA3MzguMzU4NzU2XSAgZG9fZXhpdCsweDVjMy8weGMwMAo+IFsgIDczOC4zNTg3
NjNdICA/IGZpbmRfaGVsZF9sb2NrKzB4MzQvMHhhMAo+IFsgIDczOC4zNTg3ODBdICBkb19ncm91
cF9leGl0KzB4NDcvMHhiMAo+IFsgIDczOC4zNTg3OTFdICBnZXRfc2lnbmFsKzB4MTViLzB4YzUw
Cj4gWyAgNzM4LjM1ODgwN10gIGFyY2hfZG9fc2lnbmFsX29yX3Jlc3RhcnQrMHhhZi8weDcxMAo+
IFsgIDczOC4zNTg4MTZdICA/IGxvY2tkZXBfaGFyZGlycXNfb25fcHJlcGFyZSsweGQ0LzB4MTgw
Cj4gWyAgNzM4LjM1ODgyMl0gID8gX3Jhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKzB4MzkvMHg0
MAo+IFsgIDczOC4zNTg4MzFdICA/IGt0aW1lX2dldF9tb25vX2Zhc3RfbnMrMHg1MC8weGEwCj4g
WyAgNzM4LjM1ODg0NF0gID8gYW1kZ3B1X2RybV9pb2N0bCsweDZiLzB4ODAgW2FtZGdwdV0KPiBb
ICA3MzguMzU5MDQ0XSAgZXhpdF90b191c2VyX21vZGVfcHJlcGFyZSsweGYyLzB4MWIwCj4gWyAg
NzM4LjM1OTA1NF0gIHN5c2NhbGxfZXhpdF90b191c2VyX21vZGUrMHgxOS8weDYwCj4gWyAgNzM4
LjM1OTA2Ml0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKPiBbICA3
MzguMzU5MDY5XSBSSVA6IDAwMzM6MHg3ZjZiODlhNTE4ODcKPiBbICA3MzguMzU5MDc2XSBSU1A6
IDAwMmI6MDAwMDdmNmI4MmI1NGIxOCBFRkxBR1M6IDAwMDAwMjQ2IE9SSUdfUkFYOgo+IDAwMDAw
MDAwMDAwMDAwMTAKPiBbICA3MzguMzU5MDg2XSBSQVg6IGZmZmZmZmZmZmZmZmZlMDAgUkJYOiAw
MDAwN2Y2YjgyYjU0YjUwIFJDWDogMDAwMDdmNmI4OWE1MTg4Nwo+IFsgIDczOC4zNTkwOTFdIFJE
WDogMDAwMDdmNmI4MmI1NGI1MCBSU0k6IDAwMDAwMDAwYzAyMDY0YzMgUkRJOiAwMDAwMDAwMDAw
MDAwMDA3Cj4gWyAgNzM4LjM1OTA5Nl0gUkJQOiAwMDAwMDAwMGMwMjA2NGMzIFIwODogMDAwMDAw
MDAwMDAwMDAwMyBSMDk6IDAwMDA3ZjZiODJiNTRiYmMKPiBbICA3MzguMzU5MTAxXSBSMTA6IDAw
MDAwMDAwMDAwMDAwMDEgUjExOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMjogMDAwMDAwMDE2NWEwYmMw
MAo+IFsgIDczOC4zNTkxMDZdIFIxMzogMDAwMDAwMDAwMDAwMDAwNyBSMTQ6IDAwMDAwMDAwMDAw
MDAwMDEgUjE1OiAwMDAwMDAwMDAwMDAwMDAwCj4gWyAgNzM4LjM1OTEyOV0KPiAgICAgICAgICAg
ICAgICAgU2hvd2luZyBhbGwgbG9ja3MgaGVsZCBpbiB0aGUgc3lzdGVtOgo+IFsgIDczOC4zNTkx
NDFdIDEgbG9jayBoZWxkIGJ5IGtodW5ndGFza2QvNTQ6Cj4gWyAgNzM4LjM1OTE0OF0gICMwOiBm
ZmZmZmZmZjgyOWY2ODQwIChyY3VfcmVhZF9sb2NrKXsuLi4ufS17MToyfSwgYXQ6Cj4gZGVidWdf
c2hvd19hbGxfbG9ja3MrMHgxNS8weDE4Mwo+IFsgIDczOC4zNTkxODddIDEgbG9jayBoZWxkIGJ5
IHN5c3RlbWQtam91cm5hbC8xNzQ6Cj4gWyAgNzM4LjM1OTIwMl0gMSBsb2NrIGhlbGQgYnkgTWF0
cml4TXVsdGlwbGljLzY1MzoKPiBbICA3MzguMzU5MjA2XSAgIzA6IGZmZmY4ODgxMGUzNjRmZTAK
PiAoJmFkZXYtPm5vdGlmaWVyX2xvY2speysuKy59LXszOjN9LCBhdDoKPiBhbWRncHVfbW5faW52
YWxpZGF0ZV9nZngrMHgzNC8weGEwIFthbWRncHVdCj4KPiBEYW5pZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C523B08BE
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Jun 2021 17:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E636E588;
	Tue, 22 Jun 2021 15:24:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CF86E588;
 Tue, 22 Jun 2021 15:24:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dize3MeG3RLJlCGvIk1XZAgoEnv2O43k/75kMLOWolDOcp3s1YY2ftmxrpzw0UVeJ831050XheyUScr0/B7+b6CVXRi/ULykIaRvVQcw6RTorx9Mx6zcsoj3xSyuF9Hi6Mb1UgK1A4INXD/nq8pqdE69sfJLIwiLu7r0Ad8m0h3Jxi3V7xqg94vWsyjYVH8dceGlcXhfWjHHZp33zU3EhsyA2ooXT3O3G3JBISD+MwoK/d38HhwEcM/E+Ch5U3cKMCjn7QBgCbtl6JYOVQlK1IaCZ+W3HWZzS6Ke7pyKZvKEaTg7dg3Y7fjPgrerolCH5mCeHr11cT+D6Ghq+H66nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcOYWBtjnwKkB7Pww19ef6qj8z1Sx4Jxwprx9erVfDc=;
 b=Yp0C9MEaw0gSZHvF//7F2k7iZABw1fv9KdLFJ115NorQLQDvOmvs75ZJtu5ebKy173W+N276vTvlb3sw1ZY19WhUf46HYiVQ6akFOteJe06hSdEGqx08BkneJwskTRiH/70Ziuv7vKyGaaXhA2KA5XbbJGwSO7kIz/BNlyzaAVI3RJuppH2SbEFjru5YcTJQz24Vqky5b1FVjQIXaNLp8yJZGUr3+RCJ4Y3O0RLakxEOnDYBJq/HolhFxZUtl1vWWflroILydTvOlM6iZ/XiKfuhK0WAVTTi26oFNU8ROUmikkqvLjUCi4gEmSL84Es4/jxOS8QWHhMFzzuqYEYcGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcOYWBtjnwKkB7Pww19ef6qj8z1Sx4Jxwprx9erVfDc=;
 b=13bd3p1BFdcxTqGIoJB48r5LWcOxc/5oJoFiEDX8XO67CiepqEXzzXObG1mLKG5Eo+nl2mbiLGfgJsLqCVN5aGClwnASXa21TXbW/iUH1VqHFxlswGQ8i9x65RVEyEtOTOBs7+RfpU1HQrEpIASOS6yKWV+AdzoniF7OzidfgBs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 22 Jun
 2021 15:24:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Tue, 22 Jun 2021
 15:24:16 +0000
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: Jason Gunthorpe <jgg@ziepe.ca>, Oded Gabbay <oded.gabbay@gmail.com>
References: <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <CAFCwf10GmBjeJAFp0uJsMLiv-8HWAR==RqV9ZdMQz+iW9XWdTA@mail.gmail.com>
 <20210622121546.GN1096940@ziepe.ca>
 <CAFCwf13BuS+U3Pko_62hFPuvZPG26HQXuu-cxPmcADNPO22g9g@mail.gmail.com>
 <20210622151142.GA2431880@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4a37216d-7c4c-081e-3325-82466f30b6eb@amd.com>
Date: Tue, 22 Jun 2021 17:24:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622151142.GA2431880@ziepe.ca>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4]
X-ClientProxiedBy: AM4PR0701CA0029.eurprd07.prod.outlook.com
 (2603:10a6:200:42::39) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4]
 (2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4) by
 AM4PR0701CA0029.eurprd07.prod.outlook.com (2603:10a6:200:42::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend
 Transport; Tue, 22 Jun 2021 15:24:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88e5d17a-42bf-4232-7713-08d93591cbd3
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4899F5C998842AE54B25FD5F83099@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IxY3pvgedkXpmjypP5gNh2FPvHQe4HdS7tqjD2RpJVqUuCXQMFooKefhrMrI32W3mzpJ3HtGeppeWJcKGtJODkToSSBvx1z593ynfNIoSVV+3zPc5OdlD+3FLREVk5ORuqoFOLf6Ac4lwdFicaBPLmUwK5Kexccwpe8/H/G0TwC7bnPgLYQtLl89urVFI53MEnYxpFpXccRfMZHr0ZXTwRbuPb6fVbbJUEBxRm7RrCwCY4Bq3Xw6Jf+8AGLvCXm9VD6jD0Nk+X/YnTBm6wFP9Yn698q99XSpVCMPIsNobSe0cl0PHBJO+7dV9eJFPZz1oqh8XlKyF1ftpSBfoS6Z1OxSjhlnzg96roVZ3AZV4RGmqwDKk977iH1o5XnehyTNM4iEhJhX+Ts96m7ywcvswaAIdDvMJ/qwMy5pTp26mNA0WgNWQ/ov3t3oCg/0B8E1eEM3bnXNZkbKpl4VcuhMY95d5IJmUCPEy6IdJZdLF8fWtZ2O0/e2CHVham7tSzrREBlk0ee3+oPuNzhUUH1lCvZfmeaVIzGBsn3Lx/t/ABTqf5iK1niEOPz4dFddeWTH5j5QNfHRVv590D+jAu/8KnTPlHiRpaddnF8YIeafiFJiyNLCMd/sJ0u4mRSgmLTW9+/ur+PrxN39wcamkFFRQxaPV42ONK2qXfzSwwve9f3U+FF2B+SO35lMVobNydW+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(66946007)(16526019)(7416002)(66476007)(66556008)(186003)(83380400001)(8676002)(31686004)(110136005)(86362001)(316002)(54906003)(6666004)(8936002)(478600001)(36756003)(6486002)(2616005)(2906002)(31696002)(38100700002)(5660300002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXduZERobXJFYUk3ZE9tT2I2ckRDT0hzRmRabVYvdytsai9ISUJSWVZ6ZFA2?=
 =?utf-8?B?eEtrY3lGNTlzWjZQNjR1bm81R1VSbXc1U0hMU2NweXRicjBFV0sxb3hUUUxw?=
 =?utf-8?B?dFBCcFpjcDFSUXNpUkNsTzNuWnB4NnRGbWIwUjFocVpTREFXUklHelhmNWVa?=
 =?utf-8?B?T0V4bkhGZnZCdDZ1aHVYUzBJRWJxSS9uYVE3V3JVWHRwTjlodmlSbHo1Ujk2?=
 =?utf-8?B?K3dzVnplTW8xWlhuUG5ZWUF2dTNxWnlvTmZndk9GbFJLdUNxR2gxYW9kVUpP?=
 =?utf-8?B?KzNVRjZjM0Y2QU9KQTNRMGNXVjI4QVBXaTBsU3ZpVkdGZFNNSmpqL1hCNzF6?=
 =?utf-8?B?aGtnY2RSdmpseXZKMEJBR0Y4aE8vcEtHdkZCNGVhL0Zrdloxd3BHb1FYQjNi?=
 =?utf-8?B?OXE1cEY5dXMwbWRpQlJ2SEQxVlRRSlZRRzcveVhUeFdtdHp4MmRmTTNCek9u?=
 =?utf-8?B?V0g0QkNyTjY3QUZCYW5zS3Y3UWZVWnZIVDhLQnlqamV3Y29KTEVZOVhHRjBS?=
 =?utf-8?B?M2U1NTJKNjhPSDI4QmtiUVI3bHF4cEp1dzRlSmxjRFhoek1NSmJKMU1VbFgr?=
 =?utf-8?B?Ry9qbUNxZm5FMithemhNUnB2VVNpS0JCR1NFaFBVQ0tuVHJ4UTQxSG9uREVl?=
 =?utf-8?B?b0piYlFidVowZ0ZyWFk4QnM2NVdpZk5Pc2pmMlR5S3ZSVVBXb2h1aTZJN0tB?=
 =?utf-8?B?WlRqYmJYMFZENUkyUmpqY0Z6bitWSlNzRElNUElMNXoxVHhGNDF0YmRscDRo?=
 =?utf-8?B?WDZKL0llSzBwTEh0cmlzaUtjS0pHeEwweGYzaDRUczNXR01DYWJEUVZ0c1Zn?=
 =?utf-8?B?QSt5WkxqNWJ4d0dXQ0c1TkFBeElySUdRMTRwZkNubXl6VWxNTXBVSTJoS1o2?=
 =?utf-8?B?dmIzcVg1cG9PMXRVOVFxSlpmanJrNUdsMzJDRVFxRGJIdGpDWmd1czRUdHMw?=
 =?utf-8?B?NktGYlRVbXB0MU9ZZ1dPVm1JNlFIelI3a0VHUXp6VWh1d0JmQVAvQ1RZanM5?=
 =?utf-8?B?bHVmZjNwU3I5RnJBT0MrWlU2bENmK3dNNzRMNml4aGtyT3A0Y2VYeXp2b2xE?=
 =?utf-8?B?dk9sMUMwZ1hkakl4V1RVbUFwYkJaRmxhT1N5Vk45TlQ5aGdtMkF4MmVtc0lu?=
 =?utf-8?B?d0c0UmlncEpJRUtFWFMrVFd1Nkl4WjlMbWhoYTJVUlhHSUtXMzFSWVlTTEF6?=
 =?utf-8?B?c3Y4RFY4YlJtQmM4OWxGdWNvdzc3VmQrY1Y0L0F0R0YzcVJGVHpqbGdiSjFp?=
 =?utf-8?B?VHBldnNicDhmUWRMZzJIRkNUQmhNbENnbnArcjc3TmpraTE3YlA2U1hLczlV?=
 =?utf-8?B?OFV6K1AxWWNwVDd6WWN5bzRmd1lVVDdXL2FveEVnYkJuRDhoanZ3djI2Mmd1?=
 =?utf-8?B?ZU9EQTZGaHp3TDJZd2QxcHk0UWpDcFhpa2pPZFVWdlR6LzR4SmhGNmhleDdy?=
 =?utf-8?B?cTM4Q1ZmUHhMRmJEK1M2Y0NVbEcyQmhIU3hjVGNTbTZSWlVTWjMwbDc0bUVk?=
 =?utf-8?B?cWt1bHVNVWVmMVFxNDhiTnlha1g2cVJaMXR2T2tzME03ZHJJcFkvZ2ZtdzJz?=
 =?utf-8?B?MFRUQUd4MHdTV1daa0xnc1h3SlhEV01MZGtWS0Q2SUN6YWFGcmFSSWpkUEIx?=
 =?utf-8?B?SjZEclY1VW1nYTI0d2hhQTBMZjFHSCtLNGVBaklKcEZkc01IK3VuYXRLSDRU?=
 =?utf-8?B?TjNKajVFK2NQeTJDRGs1bE14ODdQNkFRdzZNc1hMTzl4eWljSjFlQlV0YTcw?=
 =?utf-8?B?UXBoZXpwWW1oak9ZV05qa012eVVYWHZoVGZ4YVRyNEVnZTljSkQ3QTZLenZD?=
 =?utf-8?B?d3cvVVRKMlVXMndoYnhZVTVXNnM5ZzlrcDZSL1VLd0dTcVlRUnpUczdTdk1D?=
 =?utf-8?Q?JA51AUvTUtoCM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e5d17a-42bf-4232-7713-08d93591cbd3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:24:15.9887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTRnfMfws1KDIlEEi33QKgRjB3jZYpVKTDCQStDYivjoVNVRZhzRehjFP/RnpoV2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpBbSAyMi4wNi4yMSB1bSAxNzoxMSBzY2hyaWViIEphc29uIEd1bnRob3JwZToKPiBPbiBUdWUs
IEp1biAyMiwgMjAyMSBhdCAwNDoxMjoyNlBNICswMzAwLCBPZGVkIEdhYmJheSB3cm90ZToKPgo+
Pj4gMSkgU2V0dGluZyBzZ19wYWdlIHRvIE5VTEwKPj4+IDIpICdtYXBwaW5nJyBwYWdlcyBmb3Ig
UDJQIERNQSB3aXRob3V0IGdvaW5nIHRocm91Z2ggdGhlIGlvbW11Cj4+PiAzKSBBbGxvd2luZyBQ
MlAgRE1BIHdpdGhvdXQgdXNpbmcgdGhlIHAycCBkbWEgQVBJIHRvIHZhbGlkYXRlIHRoYXQgaXQK
Pj4+ICAgICBjYW4gd29yayBhdCBhbGwgaW4gdGhlIGZpcnN0IHBsYWNlLgo+Pj4KPj4+IEFsbCBv
ZiB0aGVzZSByZXN1bHQgaW4gZnVuY3Rpb25hbCBidWdzIGluIGNlcnRhaW4gc3lzdGVtCj4+PiBj
b25maWd1cmF0aW9ucy4KPj4+Cj4+PiBKYXNvbgo+PiBIaSBKYXNvbiwKPj4gVGhhbmtzIGZvciB0
aGUgZmVlZGJhY2suCj4+IFJlZ2FyZGluZyBwb2ludCAxLCB3aHkgaXMgdGhhdCBhIHByb2JsZW0g
aWYgd2UgZGlzYWJsZSB0aGUgb3B0aW9uIHRvCj4+IG1tYXAgdGhlIGRtYS1idWYgZnJvbSB1c2Vy
LXNwYWNlID8KPiBVc2Vyc3BhY2UgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBuZWVkaW5nIHN0cnVj
dCBwYWdlcyBvciBub3QKPgo+IFBvaW50IDEgYW5kIDIgbW9zdGx5IGdvIHRvZ2V0aGVyLCB5b3Ug
c3VwcG9ydGluZyB0aGUgaW9tbXUgaXMgbm90IG5pY2UKPiBpZiB5b3UgZG9udCBoYXZlIHN0cnVj
dCBwYWdlcy4KPgo+IFlvdSBzaG91bGQgc3R1ZHkgTG9nYW4ncyBwYXRjaGVzIEkgcG9pbnRlZCB5
b3UgYXQgYXMgdGhleSBhcmUgc29sdmluZwo+IGV4YWN0bHkgdGhpcyBwcm9ibGVtLgo+Cj4+IElu
IGFkZGl0aW9uLCBJIGRpZG4ndCBzZWUgYW55IHByb2JsZW0gd2l0aCBzZ19wYWdlIGJlaW5nIE5V
TEwgaW4gdGhlCj4+IFJETUEgcDJwIGRtYS1idWYgY29kZS4gRGlkIEkgbWlzcyBzb21ldGhpbmcg
aGVyZSA/Cj4gTm8sIHRoZSBkZXNpZ24gb2YgdGhlIGRtYWJ1ZiByZXF1aXJlcyB0aGUgZXhwb3J0
ZXIgdG8gZG8gdGhlIGRtYSBtYXBzCj4gYW5kIHNvIGl0IGlzIG9ubHkgdGhlIGV4cG9ydGVyIHRo
YXQgaXMgd3JvbmcgdG8gb21pdCBhbGwgdGhlIGlvbW11IGFuZAo+IHAycCBsb2dpYy4KPgo+IFJE
TUEgaXMgT0sgdG9kYXkgb25seSBiZWNhdXNlIG5vYm9keSBoYXMgaW1wbGVtZW50ZWQgZG1hIGJ1
ZiBzdXBwb3J0Cj4gaW4gcnhlL3NpIC0gbWFpbmx5IGJlY2F1c2UgdGhlIG9ubHkgaW1wbGVtZW50
YXRpb25zIG9mIGV4cG9ydGVycyBkb24ndAo+IHNldCB0aGUgc3RydWN0IHBhZ2UgYW5kIGFyZSB0
aHVzIGJ1Z2d5Lgo+Cj4+IEkgd2lsbCB0YWtlIHR3byBHQVVESSBkZXZpY2VzIGFuZCB1c2Ugb25l
IGFzIGFuIGV4cG9ydGVyIGFuZCBvbmUgYXMgYW4KPj4gaW1wb3J0ZXIuIEkgd2FudCB0byBzZWUg
dGhhdCB0aGUgc29sdXRpb24gd29ya3MgZW5kLXRvLWVuZCwgd2l0aCByZWFsCj4+IGRldmljZSBE
TUEgZnJvbSBpbXBvcnRlciB0byBleHBvcnRlci4KPiBJIGNhbiB0ZWxsIHlvdSBpdCBkb2Vzbid0
LiBTdHVmZmluZyBwaHlzaWNhbCBhZGRyZXNzZXMgZGlyZWN0bHkgaW50bwo+IHRoZSBzZyBsaXN0
IGRvZXNuJ3QgaW52b2x2ZSBhbnkgb2YgdGhlIElPTU1VIGNvZGUgc28gYW55IGNvbmZpZ3VyYXRp
b24KPiB0aGF0IHJlcXVpcmVzIElPTU1VIHBhZ2UgdGFibGUgc2V0dXAgd2lsbCBub3Qgd29yay4K
ClN1cmUgaXQgZG9lcy4gU2VlIGFtZGdwdV92cmFtX21ncl9hbGxvY19zZ3Q6CgogwqDCoMKgwqDC
oMKgwqAgYW1kZ3B1X3Jlc19maXJzdChyZXMsIG9mZnNldCwgbGVuZ3RoLCAmY3Vyc29yKTsKIMKg
wqDCoMKgwqDCoMKgIGZvcl9lYWNoX3NndGFibGVfc2coKCpzZ3QpLCBzZywgaSkgewogwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBoeXNfYWRkcl90IHBoeXMgPSBjdXJzb3Iuc3RhcnQg
KyBhZGV2LT5nbWMuYXBlcl9iYXNlOwogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNp
emVfdCBzaXplID0gY3Vyc29yLnNpemU7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZG1hX2FkZHJfdCBhZGRyOwoKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhZGRyID0g
ZG1hX21hcF9yZXNvdXJjZShkZXYsIHBoeXMsIHNpemUsIGRpciwKIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBETUFfQVRUUl9TS0lQX0NQVV9TWU5DKTsKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByID0gZG1hX21hcHBpbmdfZXJyb3IoZGV2LCBhZGRyKTsKIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAocikKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byBlcnJvcl91bm1hcDsKCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc2dfc2V0X3BhZ2Uoc2csIE5VTEwsIHNpemUsIDApOwogwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNnX2RtYV9hZGRyZXNzKHNnKSA9IGFkZHI7CiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc2dfZG1hX2xlbihzZykgPSBzaXplOwoKIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBhbWRncHVfcmVzX25leHQoJmN1cnNvciwgY3Vyc29yLnNpemUpOwogwqDC
oMKgwqDCoMKgwqAgfQoKZG1hX21hcF9yZXNvdXJjZSgpIGRvZXMgdGhlIElPTU1VIG1hcHBpbmcg
Zm9yIHVzLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKCj4KPiBKYXNvbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==

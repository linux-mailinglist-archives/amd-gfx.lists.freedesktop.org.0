Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411F2810934
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Dec 2023 05:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B6510E6CF;
	Wed, 13 Dec 2023 04:43:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD1E10E6AA
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Dec 2023 04:43:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCCM5fG5h1PamENYofLkML56R8apQ0FLqtMRLWxRpV16avIsloxtwcnu6V6HvJTE7b8JlIqnVgrLjCAOjolZzYYeOs7pX1tG8N4aFHwWAJRRqFMAeim7FAOmbd/8YalH5gg99BmO80aPlanZwuAg5H6kSJLWmM1o4J+kIJ7o37HBQwxqg3j4MZ4tjAbgFegj5HFMPeQJ1t2BdgYIkPpZRh6NWaXMAajkHpJStilXmkz/UeZTJJmTVJkdMj6RTw7eg3DD4XcMyBdEaHEnh+RLL6CAuK/mr2YU/qyVZxHEnPuxFiat1YL2lDS7Z41ojONR8y8hZ05AVGp4cT1h/qMuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8u9ctJrJDU4d3Yk7Cn911HAk2DxuUCQEakjGUYc3gM=;
 b=Aoqn4Am+g9J9LYYkCytVzs0vK1oUtVNTfY8m+Lni/heuNvhQwBmaPpRGN3TWtzQeaXhza7RmqWm59baCwM2XbD6meScxKI5TfTAX53JOLvIjUXwaCWxDZndSF+Vh3yYtmpIZE/dBM4wgx7HB+rdsZ3FM51kIeqzeO2w1ZDCSMNaUMPYAHY3WWTOi7xjGsrO39rX3YAW3gnrB/pgrpEkZmizxo64M4zLNxQyQ9YUNv4wrdrJUzd1R2Yu76h2aIbgxJ9w0hHOK2UX1Q5cTtR4MDfG09w4//+diZxo5/Ja33zr+9PitA4ifxsiMZyBdkw+DgmfeOeuBa/xWLImRH1F5Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8u9ctJrJDU4d3Yk7Cn911HAk2DxuUCQEakjGUYc3gM=;
 b=vLMMyvgKYH9c3fA/F1QjlbH9aS18+1IsxytEWkCm0HbKxuGtr5PpF8hsPmEa02MHe/AuDMlx/FG64ng7ysChV/24kvRdi7JXjB/JanrzKVIEWVh+9gIKKQchtTZuIwOyzenVYMQzSAwUJtE7j86ZRE2Ze0dmP7fGPwgoPqWHE9U=
Received: from CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6)
 by IA0PR12MB7531.namprd12.prod.outlook.com (2603:10b6:208:43f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 04:43:12 +0000
Received: from CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::26b:275e:95a8:c54a]) by CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::26b:275e:95a8:c54a%3]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 04:43:11 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "Huang, JinHuiEric"
 <JinHuiEric.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process management
Thread-Topic: [PATCH] drm/amdkfd: fix mes set shader debugger process
 management
Thread-Index: AQHaLHdMy6hjSboUMEi0ErCHNB+UVrCl7iUAgAA1WACAAAHBYIAACq+AgAAAWTCAABA2gIAAAsGwgAAUqYCAAAuy8IAAN00AgAAFFeA=
Date: Wed, 13 Dec 2023 04:43:11 +0000
Message-ID: <CY8PR12MB74359AD0C19743D7DD6F6E6B858DA@CY8PR12MB7435.namprd12.prod.outlook.com>
References: <20231211211612.3109-1-Jonathan.Kim@amd.com>
 <c4fc2b14-07b1-4b27-b460-166dcb343d74@amd.com>
 <CH0PR12MB5372AA024278ED7F7F078EEFF48EA@CH0PR12MB5372.namprd12.prod.outlook.com>
 <CY8PR12MB7435E109E255C480398C0FE4858EA@CY8PR12MB7435.namprd12.prod.outlook.com>
 <CH0PR12MB5372602539AA4398F2ED5822F48EA@CH0PR12MB5372.namprd12.prod.outlook.com>
 <CY8PR12MB74359C2CC97BEEC4DF059B3C858EA@CY8PR12MB7435.namprd12.prod.outlook.com>
 <CH0PR12MB53724D1E4C95E787790DF22BF48EA@CH0PR12MB5372.namprd12.prod.outlook.com>
 <CY8PR12MB7435E7214AF1FF85B32D20B1858EA@CY8PR12MB7435.namprd12.prod.outlook.com>
 <CH0PR12MB5372DEE37C77FD4CA22B8B2FF48DA@CH0PR12MB5372.namprd12.prod.outlook.com>
 <CY8PR12MB7435882A1367094CB9150448858DA@CY8PR12MB7435.namprd12.prod.outlook.com>
 <CH0PR12MB5372A1E3E4C24B4F2C3C13BAF48DA@CH0PR12MB5372.namprd12.prod.outlook.com>
In-Reply-To: <CH0PR12MB5372A1E3E4C24B4F2C3C13BAF48DA@CH0PR12MB5372.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-12-12T21:31:14.0000000Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7435:EE_|IA0PR12MB7531:EE_
x-ms-office365-filtering-correlation-id: 38898b44-b339-4d1f-7e96-08dbfb9602bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IMr/P+Mhughq9ZLHLcQY0ckq3XLKKShc1Y12jJeNM6OhPpw1wu7/UhhiFlyQ3Vs2kXVaTbk+V9B+pW78o51ShhSiL7KFRBHZ9Jtoe1iul3QvwWozTdsjwH0xJB3fMkR7lBfRpFqmz9njlRhbatp7Jkq4sVDsWXb6CN1WKVpraCaRXqzLlz6K46uZG4aIpxrQSE0OhWELuJdcaYfe+1hfFaADOpeSnMB3rS/igKIbYnxMmfgTfUjvBAQ4+QiNOwtCPfDA7qpg7QCJ3BW5q+qPOaCtFKdkaAVeF0iSUR6v6tZPEimZJqrHRLwkne2DmOIY+veQ5pasqJnv+nVE+5fwtiGQWU7u5V6I2oN2EffYk0b8XK7d0m3eBtI/lu4UU/f8MAAyPc0urnzXcmFTgT4PeefvggG+nxT6SR0rqIPcdjmmXKasuwTRhIhKsHPWaGM2tpExAo4x3zOd4SCozu5mWeITWP5rzg+CyMzaLPvnfKJQeDurx/8iXdZWOziek5gCmql1VsjZPOdIJg/Z8J8IZzBNns9+HR+6fJAl8k9+jzYbTPPLz5cW+v/bQgEgF0Q/FNqLVqJ+R2kcmYZqAQWUrgJV0K8MxKMsUomSWVkVCbc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(346002)(366004)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(33656002)(30864003)(2906002)(4001150100001)(5660300002)(38070700009)(53546011)(9686003)(7696005)(6506007)(26005)(55016003)(71200400001)(45080400002)(86362001)(52536014)(38100700002)(83380400001)(8676002)(4326008)(8936002)(478600001)(76116006)(54906003)(166002)(66556008)(66446008)(64756008)(122000001)(110136005)(316002)(66946007)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5ZSI0bIG0D5IoIyM2R1J76zZZVVvqd1bMBD6O+Yz5yOW/0WHH7xRAyvyTEDH?=
 =?us-ascii?Q?vz+3recKk64NPS7I7UyugLC5KDukX8OYSOiidmSu2C/3UqhiKmvwwevdrVr1?=
 =?us-ascii?Q?4uNI8RzPDO0oDQ0MZZLw0j4aIgIORnD7Vg7H1t27r0ybh151n3k9WZGsTMRa?=
 =?us-ascii?Q?zLfU2xeQYEq2jt1JR+1zQ9F++U0CfWE2VLN1sNOBih9cNN5Onwe3VnFzixkS?=
 =?us-ascii?Q?DN1grAOOTGi+vrge64c61sjSrCfjfzpXY41CKqo5mxfAmXZQwcPUCzKBvhYp?=
 =?us-ascii?Q?hR1BpGgp4x57WOuT8NlE7vc7zappcshv68WwhODi1g4ZA6cIK3KUmxOXi+0j?=
 =?us-ascii?Q?hDZ1Qx3W+X4OtjlW1KAyxQXUJ00TzKW8kHGjEX1vg9xqDIXeGRdmMIdcZFaw?=
 =?us-ascii?Q?UJT6Lb0hzEpw6HvJ+cxrN1Hx74A+Z1WIq0vfH8Kn1SPtk/G3T/ONRYPrUTjd?=
 =?us-ascii?Q?mYRnLpNUe/XlY4pjvcEjFRL9+oJqqzNAWyyr6W82I3gE2SJMaEtJ5yIenpWG?=
 =?us-ascii?Q?w5pWCBkwIxyM0ztAs9Ld2gKYMQLoHw27o+d3/F6yfFHsHOOagVSkEWnijZl9?=
 =?us-ascii?Q?C+VWzsVKjryfLWDEdLrvHb7ebJoj/ti5GGMZPh3sWrQ03RT4P9kRymcVCVrr?=
 =?us-ascii?Q?URRdFVKHtw3muF8jDJJ6jnVyIyCbp6c6PLgKNAnTbPWlOkA3w6nsosAyj8R8?=
 =?us-ascii?Q?rt3IObDqS+otoLKfEIPyqRlAlaNUlMp8kGwFtyGZZGK0E+GHK+7vmZoPKwWx?=
 =?us-ascii?Q?m9L0BDoMqhmx3DUyPrdPKdQi/LtSVGMB03P+nAN1dejANUjK1WWWMU4XeprF?=
 =?us-ascii?Q?K+XwGYYxN+bj3UQUwtSarV1x8PPZFFUvfu/e7TfqI/C7OQAsge3ZXMlVeFGP?=
 =?us-ascii?Q?5HQApaYe+GlNELLEgJ/4ZczsSgQMCvLxSCVG3xq03/+68diohY5QCUw0Tkj1?=
 =?us-ascii?Q?F51y0IUqO9Ekn1DEr4/e8hpEYPmEOm3LNUPx7abwCPrpea/wmC9FFKVnJZ3p?=
 =?us-ascii?Q?z40jKW2zuYV+VnnVYE5Tu6BWJanPmh0zbuSs0C6MrVb2DK0QO3Y6920oMZI4?=
 =?us-ascii?Q?Nu3gocR58J/dHUr9o1rYEYhcm5jWwGDAnotuVn9/ARbQCdHWd8APwIkt1bF3?=
 =?us-ascii?Q?1cus/SqsK2h4f/VqQlU9/LRtFosv7TOvfyZjtj9vamFHGPvTHlPT5+FB0z09?=
 =?us-ascii?Q?ze0UdlPWLktQq4WWcxASJ9qi8aGS6SXf8vUq8L+hHuMd4Nmpxn2FgZWEjsn1?=
 =?us-ascii?Q?lPwGjmuPk7SQnAb0vrLn/T/2ZY3u/Ute26bdIqfjws5zZyowh32Idz2eJDCJ?=
 =?us-ascii?Q?o+ck5zfTa29it8PLjKTkS3SUgPse7HsnkKX6YyIYcMXvKpPWbCbFwnvnXH1w?=
 =?us-ascii?Q?VD3V7ltXE4G4dl2NMhbMPMcpYxSXa9bwO3JBRH4j2gM1Jj87W2dySAxbuda0?=
 =?us-ascii?Q?p515sH4/sQoS62RLuYVWt3B4+1IgNtw3oZq+El9Qj3x+BSSO/YB3qSewVn2V?=
 =?us-ascii?Q?1fX7aL4BMiSNdogFe64GZJqWl9LZ7AuIF66qWXoLolNiWJOWKwR63kmLnISU?=
 =?us-ascii?Q?VtPGGoWOLXXcDdniZ1Y=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CY8PR12MB74359AD0C19743D7DD6F6E6B858DACY8PR12MB7435namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38898b44-b339-4d1f-7e96-08dbfb9602bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 04:43:11.2457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ka89WjVZO3i8rR7q+rJhYkOmwtMOmAZyGPgkRnw70mWGLVf4iofDTP0g1fLtES6A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7531
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
Cc: "Wong, Alice" <Shiwei.Wong@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_CY8PR12MB74359AD0C19743D7DD6F6E6B858DACY8PR12MB7435namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Again, MES only knows to flush if there was something enqueued in the first=
 place.
SET_SHADER dictates what's on the process list.
SET_SHADER can be the last call prior to process termination with nothing e=
nqueued, hence no MES auto flush occurs.

MES doesn't block anything on the flush flag request.
The driver guarantees that flush is only done on process termination after =
device dequeue, whether there were queues or not.
MES has no idea what an invalid context is.
It just has a value stored in its linked list that's associated with a driv=
er allocated BO that no longer exists after process termination.

If you're still not sure about this solution, then this should be discussed=
 offline with the MES team.
We're not going to gain ground discussing this here.  The solution has alre=
ady been merged.
Feel free to propose a better solution if you're not satisfied with this on=
e.

Jon

From: Liu, Shaoyun <Shaoyun.Liu@amd.com>
Sent: Tuesday, December 12, 2023 11:08 PM
To: Kim, Jonathan <Jonathan.Kim@amd.com>; Huang, JinHuiEric <JinHuiEric.Hua=
ng@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Wong, Alice <Shiwei.Wong@amd.com>; Kuehling, Felix <Felix.Kuehling@amd.=
com>; Kasiviswanathan, Harish <Harish.Kasiviswanathan@amd.com>
Subject: Re: [PATCH] drm/amdkfd: fix mes set shader debugger process manage=
ment


[Public]

You try to add one new interface to inform mes about the context flush afte=
r driver side finish process termination , from my understanding, mes alrea=
dy know the process context need to be purged after all the related queues =
been removed even without this notification. What do you expect mes to do a=
bout this context flush flag ? Mes should block this process context for ne=
xt set_sched command? Mes can achieve  this by ignore the set_sched command=
 with trap disable parameter on an invalid process context .

Shaoyun.liu

Get Outlook for iOS<https://aka.ms/o0ukef>
________________________________
From: Kim, Jonathan <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com>>
Sent: Tuesday, December 12, 2023 8:19:09 PM
To: Liu, Shaoyun <Shaoyun.Liu@amd.com<mailto:Shaoyun.Liu@amd.com>>; Huang, =
JinHuiEric <JinHuiEric.Huang@amd.com<mailto:JinHuiEric.Huang@amd.com>>; amd=
-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@l=
ists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Wong, Alice <Shiwei.Wong@amd.com<mailto:Shiwei.Wong@amd.com>>; Kuehling=
, Felix <Felix.Kuehling@amd.com<mailto:Felix.Kuehling@amd.com>>; Kasiviswan=
athan, Harish <Harish.Kasiviswanathan@amd.com<mailto:Harish.Kasiviswanathan=
@amd.com>>
Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process manage=
ment

[Public]

> -----Original Message-----
> From: Liu, Shaoyun <Shaoyun.Liu@amd.com<mailto:Shaoyun.Liu@amd.com>>
> Sent: Tuesday, December 12, 2023 7:08 PM
> To: Kim, Jonathan <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com>>; Hu=
ang, JinHuiEric
> <JinHuiEric.Huang@amd.com<mailto:JinHuiEric.Huang@amd.com>>; amd-gfx@list=
s.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
> Cc: Wong, Alice <Shiwei.Wong@amd.com<mailto:Shiwei.Wong@amd.com>>; Kuehli=
ng, Felix
> <Felix.Kuehling@amd.com<mailto:Felix.Kuehling@amd.com>>; Kasiviswanathan,=
 Harish
> <Harish.Kasiviswanathan@amd.com<mailto:Harish.Kasiviswanathan@amd.com>>
> Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process
> management
>
> [Public]
>
> I see,  so the  problem is after process context , set_shader been  calle=
d with
> disable parameter,  do you know the  reason why  MES re-added the
> process context into the  list ?

Because MES has no idea what disable means.

All it knows is that without the flush flag, set_shader should update the n=
ecessary per-VMID (process) registers as requested by the driver, which req=
uires persistent per-process HW settings so that potential future waves can=
 inherit those settings i.e. ADD_QUEUE.skip_process_ctx_clear is set (why A=
DD_QUEUE auto clears the process context otherwise is another long story, b=
asically an unsolvable MES cache bug problem).

Common use case example:
add_queue -> set_shader call either transiently stalls the SPI per-VMID or =
transiently dequeues the HWS per-VMID depending on the request settings -> =
fulfils the per-VMID register write updates -> resumes process queues so th=
at potential waves on those queues inherit new debug settings.

You can't do this kind of operation at the queue level alone.

The problem that this patch solves (along with the MES FW upgrade) is an un=
fortunate quirk of having to operate between process (debug requests) and q=
ueue space (non-debug requests).
Old HWS used to operate at the per-process level via MAP_PROCESS so it was =
a lot easier to balance debug versus non-debug requests back then (but it w=
as also lot less efficient performance wise).

Jon

>
> Shaoyun.liu
>
> -----Original Message-----
> From: Kim, Jonathan <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com>>
> Sent: Tuesday, December 12, 2023 6:07 PM
> To: Liu, Shaoyun <Shaoyun.Liu@amd.com<mailto:Shaoyun.Liu@amd.com>>; Huang=
, JinHuiEric
> <JinHuiEric.Huang@amd.com<mailto:JinHuiEric.Huang@amd.com>>; amd-gfx@list=
s.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
> Cc: Wong, Alice <Shiwei.Wong@amd.com<mailto:Shiwei.Wong@amd.com>>; Kuehli=
ng, Felix
> <Felix.Kuehling@amd.com<mailto:Felix.Kuehling@amd.com>>; Kasiviswanathan,=
 Harish
> <Harish.Kasiviswanathan@amd.com<mailto:Harish.Kasiviswanathan@amd.com>>
> Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process
> management
>
> [Public]
>
> > -----Original Message-----
> > From: Liu, Shaoyun <Shaoyun.Liu@amd.com<mailto:Shaoyun.Liu@amd.com>>
> > Sent: Tuesday, December 12, 2023 5:44 PM
> > To: Kim, Jonathan <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com>>; =
Huang, JinHuiEric
> > <JinHuiEric.Huang@amd.com<mailto:JinHuiEric.Huang@amd.com>>; amd-gfx@li=
sts.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
> > Cc: Wong, Alice <Shiwei.Wong@amd.com<mailto:Shiwei.Wong@amd.com>>; Kueh=
ling, Felix
> > <Felix.Kuehling@amd.com<mailto:Felix.Kuehling@amd.com>>; Kasiviswanatha=
n, Harish
> > <Harish.Kasiviswanathan@amd.com<mailto:Harish.Kasiviswanathan@amd.com>>
> > Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process
> > management
> >
> > [Public]
> >
> > Do you mean SET_SHADER_DEBUGER can  be called before ADD_QUEUE ?
> I
> > think  even in that  situation MES should still be able to handle it
> > as long as MES already  remove the process context from its list , MES
> > will treat the process context as a new item. I still don't understand =
why
> MES haven't
> > purged the  process context from the list after process termination .  =
 Will
> > debug queue itself  also use the add/remove queue interface  and  is
> > it possible the debug queue itself from the  old process  still not be
> > removed ?
>
> SET_SHADER_DEBUGGER can be called independently from ADD_QUEUE.
> The process list is updated on either on SET_SHADER_DEBUGGER or
> ADD_QUEUE.
> e.g. runtime_enable (set_shader) -> add_queue -> remove_queue (list
> purged) -> runtime_disable (set_shader process re-added) -> process
> termination (stale list) or debug attach (set_shader) -> add_queue ->
> remove_queue (list purged) -> debug detach (set_shader process re-added) =
-
> >process termination (stale list)
>
> MES has no idea what process termination means.  The new flag is a proxy
> for this.
> There are reasons for process settings to take place prior to queue add
> (debugger, gfx11 cwsr workaround, core dump etc need this).
>
> I'm not sure what kernel/debug queues have to do with this.
> By that argument, the list should be purged.
>
> Jon
>
> >
> > Shaoyun.liu
> >
> > -----Original Message-----
> > From: Kim, Jonathan <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com>>
> > Sent: Tuesday, December 12, 2023 4:48 PM
> > To: Liu, Shaoyun <Shaoyun.Liu@amd.com<mailto:Shaoyun.Liu@amd.com>>; Hua=
ng, JinHuiEric
> > <JinHuiEric.Huang@amd.com<mailto:JinHuiEric.Huang@amd.com>>; amd-gfx@li=
sts.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
> > Cc: Wong, Alice <Shiwei.Wong@amd.com<mailto:Shiwei.Wong@amd.com>>; Kueh=
ling, Felix
> > <Felix.Kuehling@amd.com<mailto:Felix.Kuehling@amd.com>>; Kasiviswanatha=
n, Harish
> > <Harish.Kasiviswanathan@amd.com<mailto:Harish.Kasiviswanathan@amd.com>>
> > Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process
> > management
> >
> > [Public]
> >
> > > -----Original Message-----
> > > From: Liu, Shaoyun <Shaoyun.Liu@amd.com<mailto:Shaoyun.Liu@amd.com>>
> > > Sent: Tuesday, December 12, 2023 4:45 PM
> > > To: Kim, Jonathan <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com>>=
; Huang, JinHuiEric
> > > <JinHuiEric.Huang@amd.com<mailto:JinHuiEric.Huang@amd.com>>; amd-gfx@=
lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
> > > Cc: Wong, Alice <Shiwei.Wong@amd.com<mailto:Shiwei.Wong@amd.com>>; Ku=
ehling, Felix
> > > <Felix.Kuehling@amd.com<mailto:Felix.Kuehling@amd.com>>; Kasiviswanat=
han, Harish
> > > <Harish.Kasiviswanathan@amd.com<mailto:Harish.Kasiviswanathan@amd.com=
>>
> > > Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process
> > > management
> > >
> > > [Public]
> > >
> > > Shouldn't the driver side  remove all the remaining  queues for the
> > > process during  process termination ?  If all the  queues been
> > > removed for the process ,  MES should purge the  process context
> > > automatically , otherwise it's bug inside MES .
> >
> > That's only if there were queues added to begin with.
> >
> > Jon
> >
> > >
> > > Regard
> > > Sshaoyun.liu
> > >
> > > -----Original Message-----
> > > From: Kim, Jonathan <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com=
>>
> > > Sent: Tuesday, December 12, 2023 4:33 PM
> > > To: Liu, Shaoyun <Shaoyun.Liu@amd.com<mailto:Shaoyun.Liu@amd.com>>; H=
uang, JinHuiEric
> > > <JinHuiEric.Huang@amd.com<mailto:JinHuiEric.Huang@amd.com>>; amd-gfx@=
lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
> > > Cc: Wong, Alice <Shiwei.Wong@amd.com<mailto:Shiwei.Wong@amd.com>>; Ku=
ehling, Felix
> > > <Felix.Kuehling@amd.com<mailto:Felix.Kuehling@amd.com>>; Kasiviswanat=
han, Harish
> > > <Harish.Kasiviswanathan@amd.com<mailto:Harish.Kasiviswanathan@amd.com=
>>
> > > Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process
> > > management
> > >
> > > [Public]
> > >
> > > > -----Original Message-----
> > > > From: Liu, Shaoyun <Shaoyun.Liu@amd.com<mailto:Shaoyun.Liu@amd.com>=
>
> > > > Sent: Tuesday, December 12, 2023 4:00 PM
> > > > To: Huang, JinHuiEric <JinHuiEric.Huang@amd.com<mailto:JinHuiEric.H=
uang@amd.com>>; Kim, Jonathan
> > > > <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com>>; amd-gfx@lists.=
freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
> > > > Cc: Wong, Alice <Shiwei.Wong@amd.com<mailto:Shiwei.Wong@amd.com>>; =
Kuehling, Felix
> > > > <Felix.Kuehling@amd.com<mailto:Felix.Kuehling@amd.com>>; Kasiviswan=
athan, Harish
> > > > <Harish.Kasiviswanathan@amd.com<mailto:Harish.Kasiviswanathan@amd.c=
om>>
> > > > Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger
> > > > process management
> > > >
> > > > [AMD Official Use Only - General]
> > > >
> > > > Does this requires the  new MES FW for this process_ctx_flush
> > > > requirement ?  Can driver side add logic to guaranty when  call
> > > > SET_SHADER_DEBUGGER, the process address  is always valid ?
> > >
> > > Call to flush on old fw is a NOP so it's harmless in that case.
> > > Full solution will still require a new MES version as this is a
> > > workaround on corner cases and not a new feature i.e. we can't stop
> > > ROCm from running on old fw.
> > > The process address is always valid from the driver side.  It's the
> > > MES side of things that gets stale as mentioned in the description
> > > (passed value to MES is reused with new BO but MES doesn't refresh).
> > > i.e. MES auto refreshes it's process list assuming process queues
> > > were all drained but driver can't guarantee that
> SET_SHADER_DEBUGGER
> > (which
> > > adds to MES's process list) will get called after queues get added
> > > (in fact it's a requirements that it can be called at any time).
> > > We can attempt to defer calls these calls in the KFD, considering all
> cases.
> > > But that would be a large shift in debugger/runtime_enable/KFD code,
> > > which is already complicated and could get buggy plus it would not
> > > be intuitive at all as to why we're doing this.
> > > I think a single flag set to flush MES on process termination is a
> > > simpler compromise that shows the limitation in a more obvious way.
> > >
> > > Thanks,
> > >
> > > Jon
> > >
> > >
> > > >
> > > > Regards
> > > > Shaoyun.liu
> > > >
> > > >
> > > > -----Original Message-----
> > > > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx=
-bounces@lists.freedesktop.org>> On Behalf Of
> > > > Eric Huang
> > > > Sent: Tuesday, December 12, 2023 12:49 PM
> > > > To: Kim, Jonathan <Jonathan.Kim@amd.com<mailto:Jonathan.Kim@amd.com=
>>; amd-
> > > > gfx@lists.freedesktop.org<mailto:gfx@lists.freedesktop.org>
> > > > Cc: Wong, Alice <Shiwei.Wong@amd.com<mailto:Shiwei.Wong@amd.com>>; =
Kuehling, Felix
> > > > <Felix.Kuehling@amd.com<mailto:Felix.Kuehling@amd.com>>; Kasiviswan=
athan, Harish
> > > > <Harish.Kasiviswanathan@amd.com<mailto:Harish.Kasiviswanathan@amd.c=
om>>
> > > > Subject: Re: [PATCH] drm/amdkfd: fix mes set shader debugger
> > > > process management
> > > >
> > > >
> > > > On 2023-12-11 16:16, Jonathan Kim wrote:
> > > > > MES provides the driver a call to explicitly flush stale process
> > > > > memory within the MES to avoid a race condition that results in
> > > > > a fatal memory violation.
> > > > >
> > > > > When SET_SHADER_DEBUGGER is called, the driver passes a memory
> > > > address
> > > > > that represents a process context address MES uses to keep track
> > > > > of future per-process calls.
> > > > >
> > > > > Normally, MES will purge its process context list when the last
> > > > > queue has been removed.  The driver, however, can call
> > > > > SET_SHADER_DEBUGGER regardless of whether a queue has been
> > added
> > > or not.
> > > > >
> > > > > If SET_SHADER_DEBUGGER has been called with no queues as the
> > > > > last call prior to process termination, the passed process
> > > > > context address will still reside within MES.
> > > > >
> > > > > On a new process call to SET_SHADER_DEBUGGER, the driver may
> end
> > > up
> > > > > passing an identical process context address value (based on
> > > > > per-process gpu memory address) to MES but is now pointing to a
> > > > > new allocated buffer object during KFD process creation.  Since
> > > > > the MES is unaware of this, access of the passed address points
> > > > > to the stale object within MES and triggers a fatal memory violat=
ion.
> > > > >
> > > > > The solution is for KFD to explicitly flush the process context
> > > > > address from MES on process termination.
> > > > >
> > > > > Note that the flush call and the MES debugger calls use the same
> > > > > MES interface but are separated as KFD calls to avoid
> > > > > conflicting with each other.
> > > > >
> > > > > Signed-off-by: Jonathan Kim <jonathan.kim@amd.com<mailto:jonathan=
.kim@amd.com>>
> > > > > Tested-by: Alice Wong <shiwei.wong@amd.com<mailto:shiwei.wong@amd=
.com>>
> > > > Reviewed-by: Eric Huang <jinhuieric.huang@amd.com<mailto:jinhuieric=
.huang@amd.com>>
> > > > > ---
> > > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       | 31
> > > > +++++++++++++++++++
> > > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       | 10 +++---
> > > > >   .../amd/amdkfd/kfd_process_queue_manager.c    |  1 +
> > > > >   drivers/gpu/drm/amd/include/mes_v11_api_def.h |  3 +-
> > > > >   4 files changed, 40 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > > > > index e544b823abf6..e98de23250dc 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> > > > > @@ -916,6 +916,11 @@ int
> > amdgpu_mes_set_shader_debugger(struct
> > > > amdgpu_device *adev,
> > > > >       op_input.op =3D MES_MISC_OP_SET_SHADER_DEBUGGER;
> > > > >       op_input.set_shader_debugger.process_context_addr =3D
> > > > process_context_addr;
> > > > >       op_input.set_shader_debugger.flags.u32all =3D flags;
> > > > > +
> > > > > +     /* use amdgpu mes_flush_shader_debugger instead */
> > > > > +     if (op_input.set_shader_debugger.flags.process_ctx_flush)
> > > > > +             return -EINVAL;
> > > > > +
> > > > >       op_input.set_shader_debugger.spi_gdbg_per_vmid_cntl =3D
> > > > spi_gdbg_per_vmid_cntl;
> > > > >       memcpy(op_input.set_shader_debugger.tcp_watch_cntl,
> > > > tcp_watch_cntl,
> > > > >
> > > > > sizeof(op_input.set_shader_debugger.tcp_watch_cntl));
> > > > > @@ -935,6 +940,32 @@ int
> > amdgpu_mes_set_shader_debugger(struct
> > > > amdgpu_device *adev,
> > > > >       return r;
> > > > >   }
> > > > >
> > > > > +int amdgpu_mes_flush_shader_debugger(struct amdgpu_device
> > *adev,
> > > > > +                                  uint64_t process_context_addr)=
 {
> > > > > +     struct mes_misc_op_input op_input =3D {0};
> > > > > +     int r;
> > > > > +
> > > > > +     if (!adev->mes.funcs->misc_op) {
> > > > > +             DRM_ERROR("mes flush shader debugger is not
> > supported!\n");
> > > > > +             return -EINVAL;
> > > > > +     }
> > > > > +
> > > > > +     op_input.op =3D MES_MISC_OP_SET_SHADER_DEBUGGER;
> > > > > +     op_input.set_shader_debugger.process_context_addr =3D
> > > > process_context_addr;
> > > > > +     op_input.set_shader_debugger.flags.process_ctx_flush =3D
> > > > > + true;
> > > > > +
> > > > > +     amdgpu_mes_lock(&adev->mes);
> > > > > +
> > > > > +     r =3D adev->mes.funcs->misc_op(&adev->mes, &op_input);
> > > > > +     if (r)
> > > > > +             DRM_ERROR("failed to set_shader_debugger\n");
> > > > > +
> > > > > +     amdgpu_mes_unlock(&adev->mes);
> > > > > +
> > > > > +     return r;
> > > > > +}
> > > > > +
> > > > >   static void
> > > > >   amdgpu_mes_ring_to_queue_props(struct amdgpu_device *adev,
> > > > >                              struct amdgpu_ring *ring, diff
> > > > > --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> > > > > index 894b9b133000..7d4f93fea937 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
> > > > > @@ -296,9 +296,10 @@ struct mes_misc_op_input {
> > > > >                       uint64_t process_context_addr;
> > > > >                       union {
> > > > >                               struct {
> > > > > -                                     uint64_t single_memop : 1;
> > > > > -                                     uint64_t single_alu_op : 1;
> > > > > -                                     uint64_t reserved: 30;
> > > > > +                                     uint32_t single_memop : 1;
> > > > > +                                     uint32_t single_alu_op : 1;
> > > > > +                                     uint32_t reserved: 29;
> > > > > +                                     uint32_t process_ctx_flush:
> > > > > + 1;
> > > > >                               };
> > > > >                               uint32_t u32all;
> > > > >                       } flags;
> > > > > @@ -374,7 +375,8 @@ int
> amdgpu_mes_set_shader_debugger(struct
> > > > amdgpu_device *adev,
> > > > >                               const uint32_t *tcp_watch_cntl,
> > > > >                               uint32_t flags,
> > > > >                               bool trap_en);
> > > > > -
> > > > > +int amdgpu_mes_flush_shader_debugger(struct amdgpu_device
> > *adev,
> > > > > +                             uint64_t process_context_addr);
> > > > >   int amdgpu_mes_add_ring(struct amdgpu_device *adev, int
> gang_id,
> > > > >                       int queue_type, int idx,
> > > > >                       struct amdgpu_mes_ctx_data *ctx_data, diff
> > > > > --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> > > > > b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> > > > > index 77f493262e05..8e55e78fce4e 100644
> > > > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> > > > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> > > > > @@ -87,6 +87,7 @@ void kfd_process_dequeue_from_device(struct
> > > > kfd_process_device *pdd)
> > > > >               return;
> > > > >
> > > > >       dev->dqm->ops.process_termination(dev->dqm, &pdd->qpd);
> > > > > +     amdgpu_mes_flush_shader_debugger(dev->adev, pdd-
> > > > >proc_ctx_gpu_addr);
> > > > >       pdd->already_dequeued =3D true;
> > > > >   }
> > > > >
> > > > > diff --git a/drivers/gpu/drm/amd/include/mes_v11_api_def.h
> > > > > b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
> > > > > index 1fbfd1aa987e..ec5b9ab67c5e 100644
> > > > > --- a/drivers/gpu/drm/amd/include/mes_v11_api_def.h
> > > > > +++ b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
> > > > > @@ -572,7 +572,8 @@ struct SET_SHADER_DEBUGGER {
> > > > >               struct {
> > > > >                       uint32_t single_memop : 1;  /*
> > > > > SQ_DEBUG.single_memop
> > > */
> > > > >                       uint32_t single_alu_op : 1; /* SQ_DEBUG.sin=
gle_alu_op
> */
> > > > > -                     uint32_t reserved : 30;
> > > > > +                     uint32_t reserved : 29;
> > > > > +                     uint32_t process_ctx_flush : 1;
> > > > >               };
> > > > >               uint32_t u32all;
> > > > >       } flags;
> > > >
> > >
> > >
> >
> >
>
>

--_000_CY8PR12MB74359AD0C19743D7DD6F6E6B858DACY8PR12MB7435namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Malgun Gothic";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:"\@Malgun Gothic";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;font=
-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Again, MES only knows to flush if there was somethin=
g enqueued in the first place.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal">SET_SHADER dictates what&#8217;s on the process list=
.&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">SET_SHADER can be the last call prior to process ter=
mination with nothing enqueued, hence no MES auto flush occurs.<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">MES doesn&#8217;t block anything on the flush flag r=
equest.&nbsp; <o:p>
</o:p></p>
<p class=3D"MsoNormal">The driver guarantees that flush is only done on pro=
cess termination after device dequeue, whether there were queues or not.<o:=
p></o:p></p>
<p class=3D"MsoNormal">MES has no idea what an invalid context is.&nbsp; <o=
:p></o:p></p>
<p class=3D"MsoNormal">It just has a value stored in its linked list that&#=
8217;s associated with a driver allocated BO that no longer exists after pr=
ocess termination.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If you&#8217;re still not sure about this solution, =
then this should be discussed offline with the MES team.<o:p></o:p></p>
<p class=3D"MsoNormal">We&#8217;re not going to gain ground discussing this=
 here.&nbsp; The solution has already been merged.<o:p></o:p></p>
<p class=3D"MsoNormal">Feel free to propose a better solution if you&#8217;=
re not satisfied with this one.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Jon<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Liu, Shaoyun &lt;Shaoyun.Liu@amd.com&gt=
; <br>
<b>Sent:</b> Tuesday, December 12, 2023 11:08 PM<br>
<b>To:</b> Kim, Jonathan &lt;Jonathan.Kim@amd.com&gt;; Huang, JinHuiEric &l=
t;JinHuiEric.Huang@amd.com&gt;; amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Wong, Alice &lt;Shiwei.Wong@amd.com&gt;; Kuehling, Felix &lt;Fel=
ix.Kuehling@amd.com&gt;; Kasiviswanathan, Harish &lt;Harish.Kasiviswanathan=
@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdkfd: fix mes set shader debugger process=
 management<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:15.0pt"><span style=3D"font-size:10.0pt;font-family:&quo=
t;Arial&quot;,sans-serif;color:green">[Public]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">You try to add one new interface to inform mes about=
 the context flush after driver side finish process termination , from my u=
nderstanding, mes already know the process context need to be purged after =
all the related queues been removed
 even without this notification. What do you expect mes to do about this co=
ntext flush flag ? Mes should block this process context for next set_sched=
 command? Mes can achieve &nbsp;this by ignore the set_sched command with t=
rap disable parameter on an invalid process
 context .<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Shaoyun.liu<o:p></o:p></p>
</div>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">Get <a href=3D"https://aka.ms/o0ukef">Outlook for iO=
S</a><o:p></o:p></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Kim, Jonathan &lt;<a href=3D"mailto:Jonathan.Kim@am=
d.com">Jonathan.Kim@amd.com</a>&gt;<br>
<b>Sent:</b> Tuesday, December 12, 2023 8:19:09 PM<br>
<b>To:</b> Liu, Shaoyun &lt;<a href=3D"mailto:Shaoyun.Liu@amd.com">Shaoyun.=
Liu@amd.com</a>&gt;; Huang, JinHuiEric &lt;<a href=3D"mailto:JinHuiEric.Hua=
ng@amd.com">JinHuiEric.Huang@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Cc:</b> Wong, Alice &lt;<a href=3D"mailto:Shiwei.Wong@amd.com">Shiwei.Wo=
ng@amd.com</a>&gt;; Kuehling, Felix &lt;<a href=3D"mailto:Felix.Kuehling@am=
d.com">Felix.Kuehling@amd.com</a>&gt;; Kasiviswanathan, Harish &lt;<a href=
=3D"mailto:Harish.Kasiviswanathan@amd.com">Harish.Kasiviswanathan@amd.com</=
a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdkfd: fix mes set shader debugger process=
 management</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><a name=3D"BM_BEGIN">=
</a><span style=3D"font-family:&quot;Times New Roman&quot;,serif">[Public]<=
br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Liu, Shaoyun &lt;<a href=3D"mailto:Shaoyun.Liu@amd.com">Shaoyun.=
Liu@amd.com</a>&gt;<br>
&gt; Sent: Tuesday, December 12, 2023 7:08 PM<br>
&gt; To: Kim, Jonathan &lt;<a href=3D"mailto:Jonathan.Kim@amd.com">Jonathan=
.Kim@amd.com</a>&gt;; Huang, JinHuiEric<br>
&gt; &lt;<a href=3D"mailto:JinHuiEric.Huang@amd.com">JinHuiEric.Huang@amd.c=
om</a>&gt;; <a href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
&gt; Cc: Wong, Alice &lt;<a href=3D"mailto:Shiwei.Wong@amd.com">Shiwei.Wong=
@amd.com</a>&gt;; Kuehling, Felix<br>
&gt; &lt;<a href=3D"mailto:Felix.Kuehling@amd.com">Felix.Kuehling@amd.com</=
a>&gt;; Kasiviswanathan, Harish<br>
&gt; &lt;<a href=3D"mailto:Harish.Kasiviswanathan@amd.com">Harish.Kasiviswa=
nathan@amd.com</a>&gt;<br>
&gt; Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process<b=
r>
&gt; management<br>
&gt;<br>
&gt; [Public]<br>
&gt;<br>
&gt; I see,&nbsp; so the&nbsp; problem is after process context , set_shade=
r been&nbsp; called with<br>
&gt; disable parameter,&nbsp; do you know the&nbsp; reason why&nbsp; MES re=
-added the<br>
&gt; process context into the&nbsp; list ?<br>
<br>
Because MES has no idea what disable means.<br>
<br>
All it knows is that without the flush flag, set_shader should update the n=
ecessary per-VMID (process) registers as requested by the driver, which req=
uires persistent per-process HW settings so that potential future waves can=
 inherit those settings i.e. ADD_QUEUE.skip_process_ctx_clear
 is set (why ADD_QUEUE auto clears the process context otherwise is another=
 long story, basically an unsolvable MES cache bug problem).<br>
<br>
Common use case example:<br>
add_queue -&gt; set_shader call either transiently stalls the SPI per-VMID =
or transiently dequeues the HWS per-VMID depending on the request settings =
-&gt; fulfils the per-VMID register write updates -&gt; resumes process que=
ues so that potential waves on those queues
 inherit new debug settings.<br>
<br>
You can't do this kind of operation at the queue level alone.<br>
<br>
The problem that this patch solves (along with the MES FW upgrade) is an un=
fortunate quirk of having to operate between process (debug requests) and q=
ueue space (non-debug requests).<br>
Old HWS used to operate at the per-process level via MAP_PROCESS so it was =
a lot easier to balance debug versus non-debug requests back then (but it w=
as also lot less efficient performance wise).<br>
<br>
Jon<br>
<br>
&gt;<br>
&gt; Shaoyun.liu<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: Kim, Jonathan &lt;<a href=3D"mailto:Jonathan.Kim@amd.com">Jonath=
an.Kim@amd.com</a>&gt;<br>
&gt; Sent: Tuesday, December 12, 2023 6:07 PM<br>
&gt; To: Liu, Shaoyun &lt;<a href=3D"mailto:Shaoyun.Liu@amd.com">Shaoyun.Li=
u@amd.com</a>&gt;; Huang, JinHuiEric<br>
&gt; &lt;<a href=3D"mailto:JinHuiEric.Huang@amd.com">JinHuiEric.Huang@amd.c=
om</a>&gt;; <a href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
&gt; Cc: Wong, Alice &lt;<a href=3D"mailto:Shiwei.Wong@amd.com">Shiwei.Wong=
@amd.com</a>&gt;; Kuehling, Felix<br>
&gt; &lt;<a href=3D"mailto:Felix.Kuehling@amd.com">Felix.Kuehling@amd.com</=
a>&gt;; Kasiviswanathan, Harish<br>
&gt; &lt;<a href=3D"mailto:Harish.Kasiviswanathan@amd.com">Harish.Kasiviswa=
nathan@amd.com</a>&gt;<br>
&gt; Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process<b=
r>
&gt; management<br>
&gt;<br>
&gt; [Public]<br>
&gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Liu, Shaoyun &lt;<a href=3D"mailto:Shaoyun.Liu@amd.com">Sha=
oyun.Liu@amd.com</a>&gt;<br>
&gt; &gt; Sent: Tuesday, December 12, 2023 5:44 PM<br>
&gt; &gt; To: Kim, Jonathan &lt;<a href=3D"mailto:Jonathan.Kim@amd.com">Jon=
athan.Kim@amd.com</a>&gt;; Huang, JinHuiEric<br>
&gt; &gt; &lt;<a href=3D"mailto:JinHuiEric.Huang@amd.com">JinHuiEric.Huang@=
amd.com</a>&gt;; <a href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
&gt; &gt; Cc: Wong, Alice &lt;<a href=3D"mailto:Shiwei.Wong@amd.com">Shiwei=
.Wong@amd.com</a>&gt;; Kuehling, Felix<br>
&gt; &gt; &lt;<a href=3D"mailto:Felix.Kuehling@amd.com">Felix.Kuehling@amd.=
com</a>&gt;; Kasiviswanathan, Harish<br>
&gt; &gt; &lt;<a href=3D"mailto:Harish.Kasiviswanathan@amd.com">Harish.Kasi=
viswanathan@amd.com</a>&gt;<br>
&gt; &gt; Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger proc=
ess<br>
&gt; &gt; management<br>
&gt; &gt;<br>
&gt; &gt; [Public]<br>
&gt; &gt;<br>
&gt; &gt; Do you mean SET_SHADER_DEBUGER can&nbsp; be called before ADD_QUE=
UE ?<br>
&gt; I<br>
&gt; &gt; think&nbsp; even in that&nbsp; situation MES should still be able=
 to handle it<br>
&gt; &gt; as long as MES already&nbsp; remove the process context from its =
list , MES<br>
&gt; &gt; will treat the process context as a new item. I still don't under=
stand why<br>
&gt; MES haven't<br>
&gt; &gt; purged the&nbsp; process context from the list after process term=
ination .&nbsp;&nbsp; Will<br>
&gt; &gt; debug queue itself&nbsp; also use the add/remove queue interface&=
nbsp; and&nbsp; is<br>
&gt; &gt; it possible the debug queue itself from the&nbsp; old process&nbs=
p; still not be<br>
&gt; &gt; removed ?<br>
&gt;<br>
&gt; SET_SHADER_DEBUGGER can be called independently from ADD_QUEUE.<br>
&gt; The process list is updated on either on SET_SHADER_DEBUGGER or<br>
&gt; ADD_QUEUE.<br>
&gt; e.g. runtime_enable (set_shader) -&gt; add_queue -&gt; remove_queue (l=
ist<br>
&gt; purged) -&gt; runtime_disable (set_shader process re-added) -&gt; proc=
ess<br>
&gt; termination (stale list) or debug attach (set_shader) -&gt; add_queue =
-&gt;<br>
&gt; remove_queue (list purged) -&gt; debug detach (set_shader process re-a=
dded) -<br>
&gt; &gt;process termination (stale list)<br>
&gt;<br>
&gt; MES has no idea what process termination means.&nbsp; The new flag is =
a proxy<br>
&gt; for this.<br>
&gt; There are reasons for process settings to take place prior to queue ad=
d<br>
&gt; (debugger, gfx11 cwsr workaround, core dump etc need this).<br>
&gt;<br>
&gt; I'm not sure what kernel/debug queues have to do with this.<br>
&gt; By that argument, the list should be purged.<br>
&gt;<br>
&gt; Jon<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Shaoyun.liu<br>
&gt; &gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Kim, Jonathan &lt;<a href=3D"mailto:Jonathan.Kim@amd.com">J=
onathan.Kim@amd.com</a>&gt;<br>
&gt; &gt; Sent: Tuesday, December 12, 2023 4:48 PM<br>
&gt; &gt; To: Liu, Shaoyun &lt;<a href=3D"mailto:Shaoyun.Liu@amd.com">Shaoy=
un.Liu@amd.com</a>&gt;; Huang, JinHuiEric<br>
&gt; &gt; &lt;<a href=3D"mailto:JinHuiEric.Huang@amd.com">JinHuiEric.Huang@=
amd.com</a>&gt;; <a href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
&gt; &gt; Cc: Wong, Alice &lt;<a href=3D"mailto:Shiwei.Wong@amd.com">Shiwei=
.Wong@amd.com</a>&gt;; Kuehling, Felix<br>
&gt; &gt; &lt;<a href=3D"mailto:Felix.Kuehling@amd.com">Felix.Kuehling@amd.=
com</a>&gt;; Kasiviswanathan, Harish<br>
&gt; &gt; &lt;<a href=3D"mailto:Harish.Kasiviswanathan@amd.com">Harish.Kasi=
viswanathan@amd.com</a>&gt;<br>
&gt; &gt; Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger proc=
ess<br>
&gt; &gt; management<br>
&gt; &gt;<br>
&gt; &gt; [Public]<br>
&gt; &gt;<br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From: Liu, Shaoyun &lt;<a href=3D"mailto:Shaoyun.Liu@amd.com=
">Shaoyun.Liu@amd.com</a>&gt;<br>
&gt; &gt; &gt; Sent: Tuesday, December 12, 2023 4:45 PM<br>
&gt; &gt; &gt; To: Kim, Jonathan &lt;<a href=3D"mailto:Jonathan.Kim@amd.com=
">Jonathan.Kim@amd.com</a>&gt;; Huang, JinHuiEric<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:JinHuiEric.Huang@amd.com">JinHuiEric.H=
uang@amd.com</a>&gt;; <a href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
&gt; &gt; &gt; Cc: Wong, Alice &lt;<a href=3D"mailto:Shiwei.Wong@amd.com">S=
hiwei.Wong@amd.com</a>&gt;; Kuehling, Felix<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:Felix.Kuehling@amd.com">Felix.Kuehling=
@amd.com</a>&gt;; Kasiviswanathan, Harish<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:Harish.Kasiviswanathan@amd.com">Harish=
.Kasiviswanathan@amd.com</a>&gt;<br>
&gt; &gt; &gt; Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger=
 process<br>
&gt; &gt; &gt; management<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [Public]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Shouldn't the driver side&nbsp; remove all the remaining&nbs=
p; queues for the<br>
&gt; &gt; &gt; process during&nbsp; process termination ?&nbsp; If all the&=
nbsp; queues been<br>
&gt; &gt; &gt; removed for the process ,&nbsp; MES should purge the&nbsp; p=
rocess context<br>
&gt; &gt; &gt; automatically , otherwise it's bug inside MES .<br>
&gt; &gt;<br>
&gt; &gt; That's only if there were queues added to begin with.<br>
&gt; &gt;<br>
&gt; &gt; Jon<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Regard<br>
&gt; &gt; &gt; Sshaoyun.liu<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From: Kim, Jonathan &lt;<a href=3D"mailto:Jonathan.Kim@amd.c=
om">Jonathan.Kim@amd.com</a>&gt;<br>
&gt; &gt; &gt; Sent: Tuesday, December 12, 2023 4:33 PM<br>
&gt; &gt; &gt; To: Liu, Shaoyun &lt;<a href=3D"mailto:Shaoyun.Liu@amd.com">=
Shaoyun.Liu@amd.com</a>&gt;; Huang, JinHuiEric<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:JinHuiEric.Huang@amd.com">JinHuiEric.H=
uang@amd.com</a>&gt;; <a href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
&gt; &gt; &gt; Cc: Wong, Alice &lt;<a href=3D"mailto:Shiwei.Wong@amd.com">S=
hiwei.Wong@amd.com</a>&gt;; Kuehling, Felix<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:Felix.Kuehling@amd.com">Felix.Kuehling=
@amd.com</a>&gt;; Kasiviswanathan, Harish<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:Harish.Kasiviswanathan@amd.com">Harish=
.Kasiviswanathan@amd.com</a>&gt;<br>
&gt; &gt; &gt; Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger=
 process<br>
&gt; &gt; &gt; management<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [Public]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; &gt; From: Liu, Shaoyun &lt;<a href=3D"mailto:Shaoyun.Liu@am=
d.com">Shaoyun.Liu@amd.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Sent: Tuesday, December 12, 2023 4:00 PM<br>
&gt; &gt; &gt; &gt; To: Huang, JinHuiEric &lt;<a href=3D"mailto:JinHuiEric.=
Huang@amd.com">JinHuiEric.Huang@amd.com</a>&gt;; Kim, Jonathan<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:Jonathan.Kim@amd.com">Jonathan.Ki=
m@amd.com</a>&gt;; <a href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
&gt; &gt; &gt; &gt; Cc: Wong, Alice &lt;<a href=3D"mailto:Shiwei.Wong@amd.c=
om">Shiwei.Wong@amd.com</a>&gt;; Kuehling, Felix<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:Felix.Kuehling@amd.com">Felix.Kue=
hling@amd.com</a>&gt;; Kasiviswanathan, Harish<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:Harish.Kasiviswanathan@amd.com">H=
arish.Kasiviswanathan@amd.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Subject: RE: [PATCH] drm/amdkfd: fix mes set shader deb=
ugger<br>
&gt; &gt; &gt; &gt; process management<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; [AMD Official Use Only - General]<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Does this requires the&nbsp; new MES FW for this proces=
s_ctx_flush<br>
&gt; &gt; &gt; &gt; requirement ?&nbsp; Can driver side add logic to guaran=
ty when&nbsp; call<br>
&gt; &gt; &gt; &gt; SET_SHADER_DEBUGGER, the process address&nbsp; is alway=
s valid ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Call to flush on old fw is a NOP so it's harmless in that ca=
se.<br>
&gt; &gt; &gt; Full solution will still require a new MES version as this i=
s a<br>
&gt; &gt; &gt; workaround on corner cases and not a new feature i.e. we can=
't stop<br>
&gt; &gt; &gt; ROCm from running on old fw.<br>
&gt; &gt; &gt; The process address is always valid from the driver side.&nb=
sp; It's the<br>
&gt; &gt; &gt; MES side of things that gets stale as mentioned in the descr=
iption<br>
&gt; &gt; &gt; (passed value to MES is reused with new BO but MES doesn't r=
efresh).<br>
&gt; &gt; &gt; i.e. MES auto refreshes it's process list assuming process q=
ueues<br>
&gt; &gt; &gt; were all drained but driver can't guarantee that<br>
&gt; SET_SHADER_DEBUGGER<br>
&gt; &gt; (which<br>
&gt; &gt; &gt; adds to MES's process list) will get called after queues get=
 added<br>
&gt; &gt; &gt; (in fact it's a requirements that it can be called at any ti=
me).<br>
&gt; &gt; &gt; We can attempt to defer calls these calls in the KFD, consid=
ering all<br>
&gt; cases.<br>
&gt; &gt; &gt; But that would be a large shift in debugger/runtime_enable/K=
FD code,<br>
&gt; &gt; &gt; which is already complicated and could get buggy plus it wou=
ld not<br>
&gt; &gt; &gt; be intuitive at all as to why we're doing this.<br>
&gt; &gt; &gt; I think a single flag set to flush MES on process terminatio=
n is a<br>
&gt; &gt; &gt; simpler compromise that shows the limitation in a more obvio=
us way.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Jon<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Regards<br>
&gt; &gt; &gt; &gt; Shaoyun.liu<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; &gt; From: amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lis=
ts.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; On Behalf=
 Of<br>
&gt; &gt; &gt; &gt; Eric Huang<br>
&gt; &gt; &gt; &gt; Sent: Tuesday, December 12, 2023 12:49 PM<br>
&gt; &gt; &gt; &gt; To: Kim, Jonathan &lt;<a href=3D"mailto:Jonathan.Kim@am=
d.com">Jonathan.Kim@amd.com</a>&gt;; amd-<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:gfx@lists.freedesktop.org">gfx@lists.=
freedesktop.org</a><br>
&gt; &gt; &gt; &gt; Cc: Wong, Alice &lt;<a href=3D"mailto:Shiwei.Wong@amd.c=
om">Shiwei.Wong@amd.com</a>&gt;; Kuehling, Felix<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:Felix.Kuehling@amd.com">Felix.Kue=
hling@amd.com</a>&gt;; Kasiviswanathan, Harish<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:Harish.Kasiviswanathan@amd.com">H=
arish.Kasiviswanathan@amd.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Subject: Re: [PATCH] drm/amdkfd: fix mes set shader deb=
ugger<br>
&gt; &gt; &gt; &gt; process management<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On 2023-12-11 16:16, Jonathan Kim wrote:<br>
&gt; &gt; &gt; &gt; &gt; MES provides the driver a call to explicitly flush=
 stale process<br>
&gt; &gt; &gt; &gt; &gt; memory within the MES to avoid a race condition th=
at results in<br>
&gt; &gt; &gt; &gt; &gt; a fatal memory violation.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; When SET_SHADER_DEBUGGER is called, the driver pas=
ses a memory<br>
&gt; &gt; &gt; &gt; address<br>
&gt; &gt; &gt; &gt; &gt; that represents a process context address MES uses=
 to keep track<br>
&gt; &gt; &gt; &gt; &gt; of future per-process calls.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Normally, MES will purge its process context list =
when the last<br>
&gt; &gt; &gt; &gt; &gt; queue has been removed.&nbsp; The driver, however,=
 can call<br>
&gt; &gt; &gt; &gt; &gt; SET_SHADER_DEBUGGER regardless of whether a queue =
has been<br>
&gt; &gt; added<br>
&gt; &gt; &gt; or not.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; If SET_SHADER_DEBUGGER has been called with no que=
ues as the<br>
&gt; &gt; &gt; &gt; &gt; last call prior to process termination, the passed=
 process<br>
&gt; &gt; &gt; &gt; &gt; context address will still reside within MES.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On a new process call to SET_SHADER_DEBUGGER, the =
driver may<br>
&gt; end<br>
&gt; &gt; &gt; up<br>
&gt; &gt; &gt; &gt; &gt; passing an identical process context address value=
 (based on<br>
&gt; &gt; &gt; &gt; &gt; per-process gpu memory address) to MES but is now =
pointing to a<br>
&gt; &gt; &gt; &gt; &gt; new allocated buffer object during KFD process cre=
ation.&nbsp; Since<br>
&gt; &gt; &gt; &gt; &gt; the MES is unaware of this, access of the passed a=
ddress points<br>
&gt; &gt; &gt; &gt; &gt; to the stale object within MES and triggers a fata=
l memory violation.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; The solution is for KFD to explicitly flush the pr=
ocess context<br>
&gt; &gt; &gt; &gt; &gt; address from MES on process termination.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Note that the flush call and the MES debugger call=
s use the same<br>
&gt; &gt; &gt; &gt; &gt; MES interface but are separated as KFD calls to av=
oid<br>
&gt; &gt; &gt; &gt; &gt; conflicting with each other.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Jonathan Kim &lt;<a href=3D"mailto:=
jonathan.kim@amd.com">jonathan.kim@amd.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; Tested-by: Alice Wong &lt;<a href=3D"mailto:shiwei=
.wong@amd.com">shiwei.wong@amd.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Reviewed-by: Eric Huang &lt;<a href=3D"mailto:jinhuieri=
c.huang@amd.com">jinhuieric.huang@amd.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_mes.=
c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 31<br>
&gt; &gt; &gt; &gt; +++++++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_mes.=
h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 10 +++---<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp; .../amd/amdkfd/kfd_process_queue_manag=
er.c&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/amd/include/mes_v11_ap=
i_def.h |&nbsp; 3 +-<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp; 4 files changed, 40 insertions(+), 5 d=
eletions(-)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes=
.c<br>
&gt; &gt; &gt; &gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c<br>
&gt; &gt; &gt; &gt; &gt; index e544b823abf6..e98de23250dc 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c<br>
&gt; &gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -916,6 +916,11 @@ int<br>
&gt; &gt; amdgpu_mes_set_shader_debugger(struct<br>
&gt; &gt; &gt; &gt; amdgpu_device *adev,<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; op_input.op =
=3D MES_MISC_OP_SET_SHADER_DEBUGGER;<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; op_input.set_s=
hader_debugger.process_context_addr =3D<br>
&gt; &gt; &gt; &gt; process_context_addr;<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; op_input.set_s=
hader_debugger.flags.u32all =3D flags;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* use amdgpu mes_flush_=
shader_debugger instead */<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op_input.set_shader_=
debugger.flags.process_ctx_flush)<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; op_input.set_s=
hader_debugger.spi_gdbg_per_vmid_cntl =3D<br>
&gt; &gt; &gt; &gt; spi_gdbg_per_vmid_cntl;<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(op_inpu=
t.set_shader_debugger.tcp_watch_cntl,<br>
&gt; &gt; &gt; &gt; tcp_watch_cntl,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; sizeof(op_input.set_shader_debugger.tcp_watch_cntl=
));<br>
&gt; &gt; &gt; &gt; &gt; @@ -935,6 +940,32 @@ int<br>
&gt; &gt; amdgpu_mes_set_shader_debugger(struct<br>
&gt; &gt; &gt; &gt; amdgpu_device *adev,<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +int amdgpu_mes_flush_shader_debugger(struct amdgp=
u_device<br>
&gt; &gt; *adev,<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
uint64_t process_context_addr) {<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct mes_misc_op_input=
 op_input =3D {0};<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;mes.funcs-=
&gt;misc_op) {<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;mes flush shader debugger is not<br=
>
&gt; &gt; supported!\n&quot;);<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; op_input.op =3D MES_MISC=
_OP_SET_SHADER_DEBUGGER;<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; op_input.set_shader_debu=
gger.process_context_addr =3D<br>
&gt; &gt; &gt; &gt; process_context_addr;<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; op_input.set_shader_debu=
gger.flags.process_ctx_flush =3D<br>
&gt; &gt; &gt; &gt; &gt; + true;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_mes_lock(&amp;ade=
v-&gt;mes);<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D adev-&gt;mes.funcs=
-&gt;misc_op(&amp;adev-&gt;mes, &amp;op_input);<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;failed to set_shader_debugger\n&quo=
t;);<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_mes_unlock(&amp;a=
dev-&gt;mes);<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp; static void<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp; amdgpu_mes_ring_to_queue_props(struct =
amdgpu_device *adev,<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring *ring, =
diff<br>
&gt; &gt; &gt; &gt; &gt; --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h<br=
>
&gt; &gt; &gt; &gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h<br>
&gt; &gt; &gt; &gt; &gt; index 894b9b133000..7d4f93fea937 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h<br>
&gt; &gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h<br>
&gt; &gt; &gt; &gt; &gt; @@ -296,9 +296,10 @@ struct mes_misc_op_input {<br=
>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; uint64_t process_context_addr;<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; union {<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
&gt; &gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; uint64_t single_memop : 1;<br>
&gt; &gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; uint64_t single_alu_op : 1;<br>
&gt; &gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; uint64_t reserved: 30;<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; uint32_t single_memop : 1;<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; uint32_t single_alu_op : 1;<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; uint32_t reserved: 29;<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; uint32_t process_ctx_flush:<br>
&gt; &gt; &gt; &gt; &gt; + 1;<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t u32all;<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; } flags;<br>
&gt; &gt; &gt; &gt; &gt; @@ -374,7 +375,8 @@ int<br>
&gt; amdgpu_mes_set_shader_debugger(struct<br>
&gt; &gt; &gt; &gt; amdgpu_device *adev,<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const uint32_t *tcp_=
watch_cntl,<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t flags,<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool trap_en);<br>
&gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; +int amdgpu_mes_flush_shader_debugger(struct amdgp=
u_device<br>
&gt; &gt; *adev,<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t process_context_addr)=
;<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp; int amdgpu_mes_add_ring(struct amdgpu_=
device *adev, int<br>
&gt; gang_id,<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; int queue_type, int idx,<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; struct amdgpu_mes_ctx_data *ctx_data, diff<br>
&gt; &gt; &gt; &gt; &gt; --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_que=
ue_manager.c<br>
&gt; &gt; &gt; &gt; &gt; b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_man=
ager.c<br>
&gt; &gt; &gt; &gt; &gt; index 77f493262e05..8e55e78fce4e 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue=
_manager.c<br>
&gt; &gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue=
_manager.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -87,6 +87,7 @@ void kfd_process_dequeue_from_de=
vice(struct<br>
&gt; &gt; &gt; &gt; kfd_process_device *pdd)<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev-&gt;dqm-&g=
t;ops.process_termination(dev-&gt;dqm, &amp;pdd-&gt;qpd);<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_mes_flush_shader_=
debugger(dev-&gt;adev, pdd-<br>
&gt; &gt; &gt; &gt; &gt;proc_ctx_gpu_addr);<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pdd-&gt;alread=
y_dequeued =3D true;<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/drivers/gpu/drm/amd/include/mes_v11_a=
pi_def.h<br>
&gt; &gt; &gt; &gt; &gt; b/drivers/gpu/drm/amd/include/mes_v11_api_def.h<br=
>
&gt; &gt; &gt; &gt; &gt; index 1fbfd1aa987e..ec5b9ab67c5e 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/drivers/gpu/drm/amd/include/mes_v11_api_def.=
h<br>
&gt; &gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/amd/include/mes_v11_api_def.=
h<br>
&gt; &gt; &gt; &gt; &gt; @@ -572,7 +572,8 @@ struct SET_SHADER_DEBUGGER {<b=
r>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; uint32_t single_memop : 1;&nbsp; /*<br>
&gt; &gt; &gt; &gt; &gt; SQ_DEBUG.single_memop<br>
&gt; &gt; &gt; */<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; uint32_t single_alu_op : 1; /* SQ_DEBUG.single_alu_op<br>
&gt; */<br>
&gt; &gt; &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uin=
t32_t reserved : 30;<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uin=
t32_t reserved : 29;<br>
&gt; &gt; &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uin=
t32_t process_ctx_flush : 1;<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t u32all;<br>
&gt; &gt; &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } flags;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;</span><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roma=
n&quot;,serif"><o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CY8PR12MB74359AD0C19743D7DD6F6E6B858DACY8PR12MB7435namp_--

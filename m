Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6637D432B65
	for <lists+amd-gfx@lfdr.de>; Tue, 19 Oct 2021 03:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF54E6EACD;
	Tue, 19 Oct 2021 01:06:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FD36E125
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Oct 2021 01:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9KSqlr26hfchF223CluRxqGl6m61lYdMrwgY5gPy3sTxQzDvk7yRZlBQqJK3PvXnygs2EcFpuauooEms5vAHO942XsiqpMWujKGDhJnOFX8E+LAnirnBiwJyEHdHFzzSwX71JSH3LJq/NBmm1hym9tSMLMRDI4bl+Fo8E+F/XHY2zxuySYFA/uVAUg5wEqjBbuBxWVw+NHnSn3x9JVDG2wMYUI8pxkYvnpehwyGUHoKHmqyXo8BWKy2yoBdlSM5TdCwM2Nr813t3HqkhuWmcavUiiGz0qfibW67D6vUjp1iuB7K3RNMftBLUph4hevVtP9/B+60AmwXiTPdLAj25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+QMxiXLei7mZQ+RGXLdJmLASFl6CTWebI0OCADBcS4=;
 b=FkuaCD9Yq4WPC7ov2xgwvyoy++kGFyvBRpDDAAYO7MqFLAYxj4fCL8Owii1V7i2yqJZPszKlsOz+7U2yX2iuuLsjaug3+Mxzl1mj+75HfZxq3iKz5i6RBbEE+0d3vX21dzqkzo+1bthic/wXfDS1WOE7hpF/QFlkOcreegHvvry0PFJS4EQVDqZxJ93g5sr8dV8S7TGJJbXBQtFZ8bdSUqvPzQepKG5CFwi7VsF/i7VDo512GJR2ViM+mtWNb929F12gF5WCutBpgnZFfkC4r5hfGaStaHWwzsOyzmfFG/9Kxyp9CmQ09kiQYgq7HKYtzsqvHbDYjhKWLtOIsEz3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+QMxiXLei7mZQ+RGXLdJmLASFl6CTWebI0OCADBcS4=;
 b=s/PrfFXJyisaxTw7Wx4E3uxMeyfrADOphSnolPZzO/87zp6MLkzvdIumr5bAj08tGbpbq/ZytIIJkyIDGZl3IGEoE25p7W4WnJx0aWLHnBxQ7ElhSnOlEBpnOeM1JHL6rRHNwqPHg9GfW++HmFnZY1vIalFD7ER2BfELJvWOuAg=
Received: from DM6PR12MB3324.namprd12.prod.outlook.com (2603:10b6:5:11e::26)
 by DM6PR12MB2844.namprd12.prod.outlook.com (2603:10b6:5:45::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 01:06:16 +0000
Received: from DM6PR12MB3324.namprd12.prod.outlook.com
 ([fe80::545:e133:60d8:d646]) by DM6PR12MB3324.namprd12.prod.outlook.com
 ([fe80::545:e133:60d8:d646%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 01:06:16 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "Tuikov, Luben"
 <Luben.Tuikov@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
Subject: RE: [PATCH 0/5] 0 MHz is not a valid current frequency
Thread-Topic: [PATCH 0/5] 0 MHz is not a valid current frequency
Thread-Index: AQHXv9/4JcAOE/SCekOaHpPFBC2rB6vQUc0AgADLY4CAAAx0gIACLlUAgAXjEoCAAAL8AIAATLbwgAAAQGA=
Date: Tue, 19 Oct 2021 01:06:15 +0000
Message-ID: <DM6PR12MB3324C490C0CF191F6F34602C85BD9@DM6PR12MB3324.namprd12.prod.outlook.com>
References: <20211013031042.53540-1-luben.tuikov@amd.com>
 <858da53c-7937-3ebf-360d-f20f30f825d9@amd.com>
 <e3d94e8a-ea9b-85cc-8e85-2ee2e6725f2f@amd.com>
 <DM6PR12MB39307EA02DE72479774D8FF297B79@DM6PR12MB3930.namprd12.prod.outlook.com>
 <DM6PR12MB26196111DA43A1EE11266558E4B99@DM6PR12MB2619.namprd12.prod.outlook.com>
 <BL1PR12MB51443E4EA64480401839E135F7BC9@BL1PR12MB5144.namprd12.prod.outlook.com>
 <091c6805-a72c-a286-f7fb-9d5d5da344d3@amd.com>
 <DM6PR12MB3324CDCA68D04483A57C150985BD9@DM6PR12MB3324.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB3324CDCA68D04483A57C150985BD9@DM6PR12MB3324.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-10-19T01:06:12Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=82b41623-7f99-470f-84e5-57bcf36809df;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a5707c8-0f92-4675-4b34-08d9929ca6c3
x-ms-traffictypediagnostic: DM6PR12MB2844:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB28440A7A4D688B0EC5236CEF85BD9@DM6PR12MB2844.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7bpyd3/W4lgkkb7TXoEQjSNUh9glMor2ZAI0WEgrThkVuPGWxgM7bLlNdLh7SNqMrLrLxXPTdB5MxcwsX80Q42n8Yal2FTOoH4UXo0a/s+OX4Cia8kzzdA8KVRtaKuxJr+nFSDq9Sw5usIDC6gPAdRX2v0KI/sVzrnExjJx1/t5piXTRENCU3wueXpuVGni7fye1MgwvaVtzRr0e5kzzLww/7Xk2fd//A9vEssPT3XCk9tOFYXziLPVlXm3cqbht7WanTKAPhoFnRSVmF3W69t+dRwBEYCijMhApJc4boc/SWeiwZA9iiPImyE+Vtp1Ex2evT4FHgzznzsAmDLFDVW+6WfOE4XG41MKf6ZLWFLr1cS1+FeBqy6NzbJuuTMCt2pT92uDGOrtQAaS3hl/rMCUXK+34yQhkfSEf2iClFAzuXE7K1JD1rWP46IzJrvUiDnzguDrQKXvJwdax/qFbnv3ddGGQrdqFSiJucLlaxA02QG2heW4qeRFGjrldevNj5tLdrSvQ6TtO5MBbizfuYSl6zYOE4+YKeRj3xy97wPmcWNTpQkRVpWHgmuTB9I+vCp82c+vdPeYOLCmDNiNZqWQlsiv3AwfDYo+CvHCqhWhDJT2zVdenT/D+filFIR4xO+5kECTV0DckpUTUOe5vu8ZFKE+48HVLR5mHksRlVBVSs8QfabRwKphq0sBTt3wBOeMK7fQd7D6DwiJb6F+Z0lBTwA6tBjKa7yqiBhySgoY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3324.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(66476007)(76116006)(64756008)(66556008)(122000001)(66946007)(71200400001)(4001150100001)(38100700002)(6506007)(86362001)(33656002)(2906002)(53546011)(508600001)(5660300002)(2940100002)(8936002)(110136005)(7696005)(55016002)(83380400001)(9686003)(8676002)(316002)(4326008)(921005)(38070700005)(52536014)(186003)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?89DpnTeHkq0a5UBD9VxcXf8SIn9f7HMYUUdPityXYpfA8HBUUpdkThratnSB?=
 =?us-ascii?Q?SDgQVi/2MvtzfNQWuzTMCqsv8orpY4rvk+V8hAJQSwg4QRQvmGf1tIhSYFB1?=
 =?us-ascii?Q?OffmrXLzM6oa96Q761XIxHDYSNoUjg2inELgxvRTsm1nERvpeAZa499LGXH9?=
 =?us-ascii?Q?RVjYjK+1yhKtw69FBUCf2aB7aXzsVZY7aAX2tuLi+b7mGLHT5h28S5Vv3HiK?=
 =?us-ascii?Q?7kmnt5uc5kUt3YE7t/+HbY3y7P9cr+i1lbKO5ilBd5sYzZk/ZgIxVnXAlDNr?=
 =?us-ascii?Q?CqESmAfFZITW6h8PhfYID9oxWPYjbun4HQst2Vq2bcdEJmG83ewL1fEON+9V?=
 =?us-ascii?Q?fLkgZa3sX9isQYhFBTCTI6cF7sRa89HJRTMcrCWfd0O7UblklUeiBtZiFuV1?=
 =?us-ascii?Q?oZnkQm1/Hhu4Kb2uZzoGNTAfs7844rEEJ5SnpJ1Prs/SMSwpOq/pITMjLM7F?=
 =?us-ascii?Q?KjBpajKJIhCE8PxLOZ0lWTQHjkIcT1TPaK3I4fX0rC/Idd/NgR3oTb8iXK0u?=
 =?us-ascii?Q?9f0k6IMCiNd1ZXgtX07cFHN0+V5/kK23L7oxZ1Kh9DgjvanazytH7TaM8CwN?=
 =?us-ascii?Q?fjUARwTo5d9BneSbtdxxUkp4B3khblP4I4jcvJkjdoJ8u1kbyKCu7lp2ASHu?=
 =?us-ascii?Q?/5KaiDSqHt/iXQR1LBYgh3Mu0nptGTR2j0unaQqkR9Pp3mw92uUIy4TMkCJb?=
 =?us-ascii?Q?pcQ6B82bWJjyej2R5mxya796Fy0YssizRe7sG4O2r8B1Veu+y5BNeaW5QeR2?=
 =?us-ascii?Q?xk40UAh2VaPWBooH+gnlkKKrPAEZAxbScddoq85ukuiZb+pu3/05xWAYNbpu?=
 =?us-ascii?Q?lb6c1mO7caxZ4S10Z6QgaIXrt9YUhxVI0+locXuyxcYHedz/U1dQirIJXYlY?=
 =?us-ascii?Q?D2muri7dYYkFAZoXIVZMJuWOOFKoogla9NE31MOof0GFvC/AleiRfhwg5Y47?=
 =?us-ascii?Q?WXcQ41k2HUKGYMOzW1MfuOVVXgOuUOIBcqWwfpH+VREDh5V/2sEBDgMiYZ/3?=
 =?us-ascii?Q?93cJzGS0qjQ/QxZXQMvFdkIiq5skCyxj5dDRP5l0pAEZ72sI1J86MEfI9Ic6?=
 =?us-ascii?Q?Iqf9mJYjqQ4PoWsEe1AUCw33mpW3QkKRZz5dNoRiw3Lwgo1cB01N5IWcKVZl?=
 =?us-ascii?Q?cSVuLh9t8DoK8y6JX+h05vT9SFbDhiVBuAh9PK6L2c/MbHlg6KT07Fxy8NpS?=
 =?us-ascii?Q?yuPGXnXNMaulcuXFJHXdbFkWHIPS46wMQSHOKW7ZnDZSoiW6a8xtoWIqL8Hh?=
 =?us-ascii?Q?tNVxlqfdESSLJAGxqvoETrJsNyfceqfEM27DowrGxcyl5v6gA9QseY7KBAtx?=
 =?us-ascii?Q?ZoWAGmN2JmQHVoO26ZfThvG03jQ1WxFCNDCCacb2F9CX2qnM6MMHAnNlu7CW?=
 =?us-ascii?Q?1M/aSNmAHoFzms5ku0YL4duZhAC/?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR12MB3324C490C0CF191F6F34602C85BD9DM6PR12MB3324namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3324.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5707c8-0f92-4675-4b34-08d9929ca6c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 01:06:15.9396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E6eeQxZvdAiLOhzA6tx0yzZDw4tqeK04FjnIyAoptl5TRptAzMWjHQuaAsvbmm765HcD+eQfpChF4dQLvvY13g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2844
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_DM6PR12MB3324C490C0CF191F6F34602C85BD9DM6PR12MB3324namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

The * is required for the rocm-smi's functionality for showing what the cur=
rent clocks are. We had a bug before where the * was removed, then the SMI =
died fantastically. Work could be done to try to handle that type of situat=
ion, but the SMI has a "show current clocks" and uses the * to determine wh=
ich one is active

Kent

From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Russell,=
 Kent
Sent: Monday, October 18, 2021 9:05 PM
To: Tuikov, Luben <Luben.Tuikov@amd.com>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.=
com>; amd-gfx@lists.freedesktop.org
Cc: Kasiviswanathan, Harish <Harish.Kasiviswanathan@amd.com>
Subject: RE: [PATCH 0/5] 0 MHz is not a valid current frequency


[AMD Official Use Only]

+Harish, rocm-smi falls under his purview now.

Kent

From: Tuikov, Luben <Luben.Tuikov@amd.com<mailto:Luben.Tuikov@amd.com>>
Sent: Monday, October 18, 2021 4:30 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@=
amd.com>>; Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; Lazar,=
 Lijo <Lijo.Lazar@amd.com<mailto:Lijo.Lazar@amd.com>>; amd-gfx@lists.freede=
sktop.org<mailto:amd-gfx@lists.freedesktop.org>; Russell, Kent <Kent.Russel=
l@amd.com<mailto:Kent.Russell@amd.com>>
Subject: Re: [PATCH 0/5] 0 MHz is not a valid current frequency

I think Kent is already seen these patches as he did comment on 1/5 patch.

The v3 version of the patch, posted last week, removes the asterisk to repo=
rt the lowest frequency as the current frequency, when the current frequenc=
y is 0, i.e. when the block is in low power state. Does the tool rely on th=
e asterisk? If this information is necessary could it not use amdgpu_pm_inf=
o?

Regards,
Luben

On 2021-10-18 16:19, Deucher, Alexander wrote:

[Public]

We the current behavior (0 for clock) already crashes the tool, so I don't =
think we can really make things worse.

Alex

________________________________
From: Quan, Evan <Evan.Quan@amd.com><mailto:Evan.Quan@amd.com>
Sent: Thursday, October 14, 2021 10:25 PM
To: Lazar, Lijo <Lijo.Lazar@amd.com><mailto:Lijo.Lazar@amd.com>; Tuikov, Lu=
ben <Luben.Tuikov@amd.com><mailto:Luben.Tuikov@amd.com>; amd-gfx@lists.free=
desktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freedeskto=
p.org><mailto:amd-gfx@lists.freedesktop.org>; Russell, Kent <Kent.Russell@a=
md.com><mailto:Kent.Russell@amd.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com><mailto:Alexander.Deucher=
@amd.com>
Subject: RE: [PATCH 0/5] 0 MHz is not a valid current frequency


[AMD Official Use Only]



+Kent who maintains the Rocm tool



From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org><mailto:amd-gfx-bounce=
s@lists.freedesktop.org> On Behalf Of Lazar, Lijo
Sent: Thursday, October 14, 2021 1:07 AM
To: Tuikov, Luben <Luben.Tuikov@amd.com><mailto:Luben.Tuikov@amd.com>; amd-=
gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com><mailto:Alexander.Deucher=
@amd.com>
Subject: Re: [PATCH 0/5] 0 MHz is not a valid current frequency



[AMD Official Use Only]



[AMD Official Use Only]



>Or maybe just a list without default hint, i.e. no asterisk?



I think this is also fine meaning we are having trouble in determining the =
current frequency or DPM level. Evan/Alex? Don't know if this will crash th=
e tools.



Thanks,
Lijo

________________________________

From: Tuikov, Luben <Luben.Tuikov@amd.com<mailto:Luben.Tuikov@amd.com>>
Sent: Wednesday, October 13, 2021 9:52:09 PM
To: Lazar, Lijo <Lijo.Lazar@amd.com<mailto:Lijo.Lazar@amd.com>>; amd-gfx@li=
sts.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@lists.fr=
eedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@=
amd.com>>
Subject: Re: [PATCH 0/5] 0 MHz is not a valid current frequency



On 2021-10-13 00:14, Lazar, Lijo wrote:
>
> On 10/13/2021 8:40 AM, Luben Tuikov wrote:
>> Some ASIC support low-power functionality for the whole ASIC or just
>> an IP block. When in such low-power mode, some sysfs interfaces would
>> report a frequency of 0, e.g.,
>>
>> $cat /sys/class/drm/card0/device/pp_dpm_sclk
>> 0: 500Mhz
>> 1: 0Mhz *
>> 2: 2200Mhz
>> $_
>>
>> An operating frequency of 0 MHz doesn't make sense, and this interface
>> is designed to report only operating clock frequencies, i.e. non-zero,
>> and possibly the current one.
>>
>> When in this low-power state, round to the smallest
>> operating frequency, for this interface, as follows,
>>
> Would rather avoid this -
>
> 1) It is manipulating FW reported value. If at all there is an uncaught
> issue in FW reporting of frequency values, that is masked here.
> 2) Otherwise, if 0MHz is described as GFX power gated case, this
> provides a convenient interface to check if GFX is power gated.
>
> If seeing a '0' is not pleasing, consider changing to something like
>        "NA" - not available (frequency cannot be fetched at the moment).

There's a ROCm tool which literally asserts if the values are not ordered i=
n increasing order. Now since 0 < 550, but 0 is listed as the second entry,=
 the tool simply asserts and crashes.

It is not clear what you'd rather see here:

$cat /sys/class/drm/card0/device/pp_dpm_sclk
0: 550Mhz
1: N/A *
2: 2200MHz
$_

Is this what you want to see? (That'll crash other tools which expect %uMhz=
.)

Or maybe just a list without default hint, i.e. no asterisk?

$cat /sys/class/drm/card0/device/pp_dpm_sclk
0: 550Mhz
1: 2200MHz
$_

What should the output be?

We want to avoid showing 0, but still show numbers.

Regards,
Luben

>
> Thanks,
> Lijo
>
>> $cat /sys/class/drm/card0/device/pp_dpm_sclk
>> 0: 500Mhz *
>> 1: 2200Mhz
>> $_
>>
>> Luben Tuikov (5):
>>    drm/amd/pm: Slight function rename
>>    drm/amd/pm: Rename cur_value to curr_value
>>    drm/amd/pm: Rename freq_values --> freq_value
>>    dpm/amd/pm: Sienna: 0 MHz is not a current clock frequency
>>    dpm/amd/pm: Navi10: 0 MHz is not a current clock frequency
>>
>>   .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   | 60 +++++++++------
>>   .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   | 73 ++++++++++++-------
>>   2 files changed, 86 insertions(+), 47 deletions(-)
>>


--_000_DM6PR12MB3324C490C0CF191F6F34602C85BD9DM6PR12MB3324namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"ProgId" content=3D"Word.Document">
<meta name=3D"Generator" content=3D"Microsoft Word 15">
<meta name=3D"Originator" content=3D"Microsoft Word 15">
<link rel=3D"File-List" href=3D"cid:filelist.xml@01D7C463.FB79F840"><link r=
el=3D"Edit-Time-Data" href=3D"cid:editdata.mso"><!--[if !mso]><style>v\:* {=
behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><!--[if gte mso 9]><xml>
<o:OfficeDocumentSettings>
<o:AllowPNG/>
</o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:WordDocument>
<w:DocumentKind>DocumentEmail</w:DocumentKind>
<w:TrackMoves/>
<w:TrackFormatting/>
<w:EnvelopeVis/>
<w:ValidateAgainstSchemas/>
<w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
<w:IgnoreMixedContent>false</w:IgnoreMixedContent>
<w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
<w:DoNotPromoteQF/>
<w:LidThemeOther>EN-US</w:LidThemeOther>
<w:LidThemeAsian>X-NONE</w:LidThemeAsian>
<w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
<w:Compatibility>
<w:DoNotExpandShiftReturn/>
<w:BreakWrappedTables/>
<w:SnapToGridInCell/>
<w:WrapTextWithPunct/>
<w:UseAsianBreakRules/>
<w:DontGrowAutofit/>
<w:SplitPgBreakAndParaMark/>
<w:EnableOpenTypeKerning/>
<w:DontFlipMirrorIndents/>
<w:OverrideTableStyleHps/>
</w:Compatibility>
<w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
<m:mathPr>
<m:mathFont m:val=3D"Cambria Math"/>
<m:brkBin m:val=3D"before"/>
<m:brkBinSub m:val=3D"&#45;-"/>
<m:smallFrac m:val=3D"off"/>
<m:dispDef/>
<m:lMargin m:val=3D"0"/>
<m:rMargin m:val=3D"0"/>
<m:defJc m:val=3D"centerGroup"/>
<m:wrapIndent m:val=3D"1440"/>
<m:intLim m:val=3D"subSup"/>
<m:naryLim m:val=3D"undOvr"/>
</m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:LatentStyles DefLockedState=3D"false" DefUnhideWhenUsed=3D"false" DefSem=
iHidden=3D"false" DefQFormat=3D"false" DefPriority=3D"99" LatentStyleCount=
=3D"376">
<w:LsdException Locked=3D"false" Priority=3D"0" QFormat=3D"true" Name=3D"No=
rmal"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=3D"he=
ading 1"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 2"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 3"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 5"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 6"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 7"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 8"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 9"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 9"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 1"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 2"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 3"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 4"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 5"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 6"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 7"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 8"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 9"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Normal Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"footnote text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"annotation text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"header"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"footer"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index heading"/>
<w:LsdException Locked=3D"false" Priority=3D"35" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" QFormat=3D"true" Name=3D"caption"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"table of figures"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"envelope address"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"envelope return"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"footnote reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"annotation reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"line number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"page number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"endnote reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"endnote text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"table of authorities"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"macro"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"toa heading"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Bullet"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Bullet 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Bullet 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Bullet 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Bullet 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Number 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Number 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Number 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Number 5"/>
<w:LsdException Locked=3D"false" Priority=3D"10" QFormat=3D"true" Name=3D"T=
itle"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Closing"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Signature"/>
<w:LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" Name=3D"Default Paragraph Font"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Continue"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Continue 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Continue 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Continue 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Continue 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Message Header"/>
<w:LsdException Locked=3D"false" Priority=3D"11" QFormat=3D"true" Name=3D"S=
ubtitle"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Salutation"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Date"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text First Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text First Indent 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Note Heading"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text Indent 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text Indent 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Block Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Hyperlink"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"FollowedHyperlink"/>
<w:LsdException Locked=3D"false" Priority=3D"22" QFormat=3D"true" Name=3D"S=
trong"/>
<w:LsdException Locked=3D"false" Priority=3D"20" QFormat=3D"true" Name=3D"E=
mphasis"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Document Map"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Plain Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"E-mail Signature"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Top of Form"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Bottom of Form"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Normal (Web)"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Acronym"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Address"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Cite"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Code"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Definition"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Keyboard"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Preformatted"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Sample"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Typewriter"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Variable"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Normal Table"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"annotation subject"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"No List"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Outline List 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Outline List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Outline List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Simple 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Simple 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Simple 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Classic 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Classic 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Classic 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Classic 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Colorful 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Colorful 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Colorful 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Columns 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Columns 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Columns 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Columns 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Columns 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table 3D effects 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table 3D effects 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table 3D effects 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Contemporary"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Elegant"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Professional"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Subtle 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Subtle 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Web 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Web 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Web 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Balloon Text"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"Table Grid"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Theme"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Placeholder Te=
xt"/>
<w:LsdException Locked=3D"false" Priority=3D"1" QFormat=3D"true" Name=3D"No=
 Spacing"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1"/=
>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2"/=
>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading"/=
>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 A=
ccent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Acce=
nt 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Revision"/>
<w:LsdException Locked=3D"false" Priority=3D"34" QFormat=3D"true" Name=3D"L=
ist Paragraph"/>
<w:LsdException Locked=3D"false" Priority=3D"29" QFormat=3D"true" Name=3D"Q=
uote"/>
<w:LsdException Locked=3D"false" Priority=3D"30" QFormat=3D"true" Name=3D"I=
ntense Quote"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 1=
"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading A=
ccent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 A=
ccent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 2=
"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading A=
ccent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent =
3"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent =
3"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 A=
ccent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 3=
"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading A=
ccent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent =
4"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent =
4"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 A=
ccent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 4=
"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading A=
ccent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent =
5"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent =
5"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 A=
ccent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 5=
"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading A=
ccent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent =
6"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent =
6"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 A=
ccent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 6=
"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading A=
ccent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"19" QFormat=3D"true" Name=3D"S=
ubtle Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"21" QFormat=3D"true" Name=3D"I=
ntense Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"31" QFormat=3D"true" Name=3D"S=
ubtle Reference"/>
<w:LsdException Locked=3D"false" Priority=3D"32" QFormat=3D"true" Name=3D"I=
ntense Reference"/>
<w:LsdException Locked=3D"false" Priority=3D"33" QFormat=3D"true" Name=3D"B=
ook Title"/>
<w:LsdException Locked=3D"false" Priority=3D"37" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"Bibliography"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" QFormat=3D"true" Name=3D"TOC Heading"/>
<w:LsdException Locked=3D"false" Priority=3D"41" Name=3D"Plain Table 1"/>
<w:LsdException Locked=3D"false" Priority=3D"42" Name=3D"Plain Table 2"/>
<w:LsdException Locked=3D"false" Priority=3D"43" Name=3D"Plain Table 3"/>
<w:LsdException Locked=3D"false" Priority=3D"44" Name=3D"Plain Table 4"/>
<w:LsdException Locked=3D"false" Priority=3D"45" Name=3D"Plain Table 5"/>
<w:LsdException Locked=3D"false" Priority=3D"40" Name=3D"Grid Table Light"/=
>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark"=
/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accen=
t 1"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 1"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 1"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accen=
t 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 2"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 2"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accen=
t 3"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 3"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accen=
t 4"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 4"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accen=
t 5"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 5"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 5"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accen=
t 6"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 6"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 6"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark"=
/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accen=
t 1"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accen=
t 1"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 1"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accen=
t 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accen=
t 2"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 2"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accen=
t 3"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accen=
t 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 3"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accen=
t 4"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accen=
t 4"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accen=
t 5"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accen=
t 5"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 5"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accen=
t 6"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accen=
t 6"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 6"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful Accent 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Mention"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Smart Hyperlink"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Hashtag"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Unresolved Mention"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Smart Link"/>
</w:LatentStyles>
</xml><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-536869121 1107305727 33554432 0 415 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-469750017 -1073732485 9 0 511 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin:0in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
a:link, span.MsoHyperlink
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:purple;
	text-decoration:underline;
	text-underline:single;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-style-unhide:no;
	margin:0in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	mso-style-unhide:no;
	margin:0in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
p.xmsipheadera4477989, li.xmsipheadera4477989, div.xmsipheadera4477989
	{mso-style-name:x_msipheadera4477989;
	mso-style-unhide:no;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
p.xmsochpdefault, li.xmsochpdefault, div.xmsochpdefault
	{mso-style-name:x_msochpdefault;
	mso-style-unhide:no;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
p.msipheader9f8d35bc, li.msipheader9f8d35bc, div.msipheader9f8d35bc
	{mso-style-name:msipheader9f8d35bc;
	mso-style-unhide:no;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
span.xmsohyperlink
	{mso-style-name:x_msohyperlink;
	mso-style-unhide:no;
	color:#0563C1;
	text-decoration:underline;
	text-underline:single;}
span.xemailstyle18
	{mso-style-name:x_emailstyle18;
	mso-style-unhide:no;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:Calibri;
	color:windowtext;}
span.EmailStyle24
	{mso-style-type:personal;
	mso-style-noshow:yes;
	mso-style-unhide:no;
	mso-ansi-font-size:11.0pt;
	mso-bidi-font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";
	color:windowtext;}
span.EmailStyle25
	{mso-style-type:personal-reply;
	mso-style-noshow:yes;
	mso-style-unhide:no;
	mso-ansi-font-size:11.0pt;
	mso-bidi-font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	font-size:10.0pt;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 10]><style>/* Style Definitions */
table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman",serif;}
</style><![endif]--><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"purple" style=3D"tab-interva=
l:.5in;word-wrap:break-word">
<div class=3D"WordSection1">
<p class=3D"msipheader9f8d35bc" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD Officia=
l Use Only]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-font-family:&quot;Times N=
ew Roman&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bidi-font-family:&quot;Times New =
Roman&quot;">The * is required for the rocm-smi&#8217;s functionality for s=
howing what the current clocks are. We had a bug before where the * was rem=
oved, then the SMI died fantastically. Work could be
 done to try to handle that type of situation, but the SMI has a &#8220;sho=
w current clocks&#8221; and uses the * to determine which one is active<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bidi-font-family:&quot;Times New =
Roman&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bidi-font-family:&quot;Times New =
Roman&quot;">Kent<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bidi-font-family:&quot;Times New =
Roman&quot;"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"mso-fareast-font-family:&quot;Time=
s New Roman&quot;">From:</span></b><span style=3D"mso-fareast-font-family:&=
quot;Times New Roman&quot;"> amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.=
org&gt;
<b>On Behalf Of </b>Russell, Kent<br>
<b>Sent:</b> Monday, October 18, 2021 9:05 PM<br>
<b>To:</b> Tuikov, Luben &lt;Luben.Tuikov@amd.com&gt;; Deucher, Alexander &=
lt;Alexander.Deucher@amd.com&gt;; Quan, Evan &lt;Evan.Quan@amd.com&gt;; Laz=
ar, Lijo &lt;Lijo.Lazar@amd.com&gt;; amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Kasiviswanathan, Harish &lt;Harish.Kasiviswanathan@amd.com&gt;<b=
r>
<b>Subject:</b> RE: [PATCH 0/5] 0 MHz is not a valid current frequency<o:p>=
</o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"msipheader9f8d35bc" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD Officia=
l Use Only]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-font-family:&quot;Times N=
ew Roman&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bidi-font-family:&quot;Times New =
Roman&quot;">+Harish, rocm-smi falls under his purview now.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"mso-bidi-font-family:&quot;Times New =
Roman&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bidi-font-family:&quot;Times New =
Roman&quot;">Kent<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bidi-font-family:&quot;Times New =
Roman&quot;"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"mso-outline-level:1"><b><span style=3D"mso-=
fareast-font-family:&quot;Times New Roman&quot;">From:</span></b><span styl=
e=3D"mso-fareast-font-family:&quot;Times New Roman&quot;"> Tuikov, Luben &l=
t;<a href=3D"mailto:Luben.Tuikov@amd.com">Luben.Tuikov@amd.com</a>&gt;
<br>
<b>Sent:</b> Monday, October 18, 2021 4:30 PM<br>
<b>To:</b> Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.c=
om">Alexander.Deucher@amd.com</a>&gt;; Quan, Evan &lt;<a href=3D"mailto:Eva=
n.Quan@amd.com">Evan.Quan@amd.com</a>&gt;; Lazar, Lijo &lt;<a href=3D"mailt=
o:Lijo.Lazar@amd.com">Lijo.Lazar@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>; Russell, Kent &lt;<a href=3D"mailto:Kent.Russell@amd.com">Kent.Rus=
sell@amd.com</a>&gt;<br>
<b>Subject:</b> Re: [PATCH 0/5] 0 MHz is not a valid current frequency<o:p>=
</o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-font-family:&quot;Times N=
ew Roman&quot;">I think Kent is already seen these patches as he did commen=
t on 1/5 patch.<br>
<br>
The v3 version of the patch, posted last week, removes the asterisk to repo=
rt the lowest frequency as the current frequency, when the current frequenc=
y is 0, i.e. when the block is in low power state. Does the tool rely on th=
e asterisk? If this information
 is necessary could it not use amdgpu_pm_info?<br>
<br>
Regards,<br>
Luben<br>
<br>
On 2021-10-18 16:19, Deucher, Alexander wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p style=3D"margin:15.0pt"><span style=3D"font-size:10.0pt;font-family:&quo=
t;Arial&quot;,sans-serif;color:green">[Public]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-font-family:&quot;Times N=
ew Roman&quot;"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;mso-fareast-font-fam=
ily:&quot;Times New Roman&quot;;color:black">We the current behavior (0 for=
 clock) already crashes the tool, so I don't think we can really make thing=
s worse.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;mso-fareast-font-fam=
ily:&quot;Times New Roman&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;mso-fareast-font-fam=
ily:&quot;Times New Roman&quot;;color:black">Alex<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;mso-fareast-font-fam=
ily:&quot;Times New Roman&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 style=3D"mso-fareast-font-family:&quot;Times New Roman&quot;">
<hr size=3D"1" width=3D"98%" align=3D"center">
</span></div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal" style=3D"mso-outline-level:1"><b><span style=3D"mso-=
fareast-font-family:&quot;Times New Roman&quot;;color:black">From:</span></=
b><span style=3D"mso-fareast-font-family:&quot;Times New Roman&quot;;color:=
black"> Quan, Evan
<a href=3D"mailto:Evan.Quan@amd.com">&lt;Evan.Quan@amd.com&gt;</a><br>
<b>Sent:</b> Thursday, October 14, 2021 10:25 PM<br>
<b>To:</b> Lazar, Lijo <a href=3D"mailto:Lijo.Lazar@amd.com">&lt;Lijo.Lazar=
@amd.com&gt;</a>; Tuikov, Luben
<a href=3D"mailto:Luben.Tuikov@amd.com">&lt;Luben.Tuikov@amd.com&gt;</a>; <=
a href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a> <a href=3D"mailto:amd-gfx@lists.freedeskt=
op.org">
&lt;amd-gfx@lists.freedesktop.org&gt;</a>; Russell, Kent <a href=3D"mailto:=
Kent.Russell@amd.com">
&lt;Kent.Russell@amd.com&gt;</a><br>
<b>Cc:</b> Deucher, Alexander <a href=3D"mailto:Alexander.Deucher@amd.com">=
&lt;Alexander.Deucher@amd.com&gt;</a><br>
<b>Subject:</b> RE: [PATCH 0/5] 0 MHz is not a valid current frequency</spa=
n><span style=3D"mso-fareast-font-family:&quot;Times New Roman&quot;">
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-font-family:&quot;Times N=
ew Roman&quot;">&nbsp;<o:p></o:p></span></p>
</div>
</div>
<div>
<div>
<p class=3D"xmsipheadera4477989" style=3D"margin:0in"><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD Offici=
al Use Only]</span><o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">+Kent who maintains the Rocm tool<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"xmsonormal" style=3D"mso-outline-level:1"><b>From:</b> amd-gfx =
<a href=3D"mailto:amd-gfx-bounces@lists.freedesktop.org">
&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> <b>On Behalf Of </b>Lazar=
, Lijo<br>
<b>Sent:</b> Thursday, October 14, 2021 1:07 AM<br>
<b>To:</b> Tuikov, Luben <a href=3D"mailto:Luben.Tuikov@amd.com">&lt;Luben.=
Tuikov@amd.com&gt;</a>;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Cc:</b> Deucher, Alexander <a href=3D"mailto:Alexander.Deucher@amd.com">=
&lt;Alexander.Deucher@amd.com&gt;</a><br>
<b>Subject:</b> Re: [PATCH 0/5] 0 MHz is not a valid current frequency<o:p>=
</o:p></p>
</div>
</div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p style=3D"margin:5.0pt"><span style=3D"font-size:10.0pt;font-family:&quot=
;Arial&quot;,sans-serif;color:blue">[AMD Official Use Only]</span><o:p></o:=
p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<div>
<p style=3D"margin:5.0pt"><span style=3D"font-size:10.0pt;font-family:&quot=
;Arial&quot;,sans-serif;color:blue">[AMD Official Use Only]</span><o:p></o:=
p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<div>
<div>
<p class=3D"xmsonormal" style=3D"background:white"><span style=3D"color:#21=
2121">&gt;Or maybe just a list without default hint, i.e. no asterisk?</spa=
n><o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal" style=3D"background:white"><span style=3D"color:#21=
2121">&nbsp;</span><o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal" style=3D"background:white"><span style=3D"color:#21=
2121">I think this is also fine meaning we are having trouble in determinin=
g the current frequency or DPM level. Evan/Alex? Don't know if this will cr=
ash the tools.</span><o:p></o:p></p>
</div>
<div id=3D"x_ms-outlook-mobile-signature">
<div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
</div>
<p class=3D"xmsonormal">Thanks,<br>
Lijo<o:p></o:p></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 style=3D"mso-fareast-font-family:&quot;Times New Roman&quot;">
<hr size=3D"1" width=3D"98%" align=3D"center">
</span></div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"xmsonormal" style=3D"mso-outline-level:1"><b><span style=3D"col=
or:black">From:</span></b><span style=3D"color:black"> Tuikov, Luben &lt;<a=
 href=3D"mailto:Luben.Tuikov@amd.com">Luben.Tuikov@amd.com</a>&gt;<br>
<b>Sent:</b> Wednesday, October 13, 2021 9:52:09 PM<br>
<b>To:</b> Lazar, Lijo &lt;<a href=3D"mailto:Lijo.Lazar@amd.com">Lijo.Lazar=
@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.c=
om">Alexander.Deucher@amd.com</a>&gt;<br>
<b>Subject:</b> Re: [PATCH 0/5] 0 MHz is not a valid current frequency</spa=
n> <o:p>
</o:p></p>
<div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"xmsonormal" style=3D"margin-bottom:12.0pt">On 2021-10-13 00:14,=
 Lazar, Lijo wrote:<br>
&gt;<br>
&gt; On 10/13/2021 8:40 AM, Luben Tuikov wrote:<br>
&gt;&gt; Some ASIC support low-power functionality for the whole ASIC or ju=
st<br>
&gt;&gt; an IP block. When in such low-power mode, some sysfs interfaces wo=
uld<br>
&gt;&gt; report a frequency of 0, e.g.,<br>
&gt;&gt;<br>
&gt;&gt; $cat /sys/class/drm/card0/device/pp_dpm_sclk<br>
&gt;&gt; 0: 500Mhz<br>
&gt;&gt; 1: 0Mhz *<br>
&gt;&gt; 2: 2200Mhz<br>
&gt;&gt; $_<br>
&gt;&gt;<br>
&gt;&gt; An operating frequency of 0 MHz doesn't make sense, and this inter=
face<br>
&gt;&gt; is designed to report only operating clock frequencies, i.e. non-z=
ero,<br>
&gt;&gt; and possibly the current one.<br>
&gt;&gt;<br>
&gt;&gt; When in this low-power state, round to the smallest<br>
&gt;&gt; operating frequency, for this interface, as follows,<br>
&gt;&gt;<br>
&gt; Would rather avoid this -<br>
&gt;<br>
&gt; 1) It is manipulating FW reported value. If at all there is an uncaugh=
t <br>
&gt; issue in FW reporting of frequency values, that is masked here.<br>
&gt; 2) Otherwise, if 0MHz is described as GFX power gated case, this <br>
&gt; provides a convenient interface to check if GFX is power gated.<br>
&gt;<br>
&gt; If seeing a '0' is not pleasing, consider changing to something like<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;NA&quot; - not availab=
le (frequency cannot be fetched at the moment).<br>
<br>
There's a ROCm tool which literally asserts if the values are not ordered i=
n increasing order. Now since 0 &lt; 550, but 0 is listed as the second ent=
ry, the tool simply asserts and crashes.<br>
<br>
It is not clear what you'd rather see here:<br>
<br>
$cat /sys/class/drm/card0/device/pp_dpm_sclk<br>
0: 550Mhz<br>
1: N/A *<br>
2: 2200MHz<br>
$_<br>
<br>
Is this what you want to see? (That'll crash other tools which expect %uMhz=
.)<br>
<br>
Or maybe just a list without default hint, i.e. no asterisk?<br>
<br>
$cat /sys/class/drm/card0/device/pp_dpm_sclk<br>
0: 550Mhz<br>
1: 2200MHz<br>
$_<br>
<br>
What should the output be?<br>
<br>
We want to avoid showing 0, but still show numbers.<br>
<br>
Regards,<br>
Luben<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Lijo<br>
&gt;<br>
&gt;&gt; $cat /sys/class/drm/card0/device/pp_dpm_sclk<br>
&gt;&gt; 0: 500Mhz *<br>
&gt;&gt; 1: 2200Mhz<br>
&gt;&gt; $_<br>
&gt;&gt;<br>
&gt;&gt; Luben Tuikov (5):<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; drm/amd/pm: Slight function rename<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; drm/amd/pm: Rename cur_value to curr_value<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; drm/amd/pm: Rename freq_values --&gt; freq_value=
<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; dpm/amd/pm: Sienna: 0 MHz is not a current clock=
 frequency<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; dpm/amd/pm: Navi10: 0 MHz is not a current clock=
 frequency<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp; .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c&nbsp;&nbsp=
; | 60 +++++++++------<br>
&gt;&gt;&nbsp;&nbsp; .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c&nbsp;&nbsp=
; | 73 ++++++++++++-------<br>
&gt;&gt;&nbsp;&nbsp; 2 files changed, 86 insertions(+), 47 deletions(-)<br>
&gt;&gt;<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-font-family:&quot;Times N=
ew Roman&quot;"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR12MB3324C490C0CF191F6F34602C85BD9DM6PR12MB3324namp_--

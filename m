Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4A25E7EC2
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Sep 2022 17:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB28910E49E;
	Fri, 23 Sep 2022 15:44:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738F410E49E
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Sep 2022 15:44:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMMLpGsSkzr8MIIZrVlJBdX07zAbR0lQEy6cA0UtQjtHHRoPSUilD0r4osnVgHgEMP6RiZewTJCJvM2P19urr31BLWhEC0GNYewnZSffbADsGQjC6j3B8fbH6FM9mai0Nmpf32wWLfi9NOljivO63kl09Wi1formXfe1dIXHvr5Fd0+ZUAdXkklBhDdGnrseXadpMZvy64ZwTmj2p+mHRzYhzYBwpkG788+ZeWeuGCQRgPybZIUneltmvl74V+uMG8pj0qIe2DRkQD7n6e0itBf7UY16+y1O8X0pfzNI9aadOYdSzb4rt5GRqQPqBDSEibOdjqXtxNlrnjEGXKCKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3gTxCnVnHA69J0JEcSKV3hseHWwY/9tyu8P4DGqytI=;
 b=GM0Om7qpEZA0LngEi0yGP92WjGzYXrDm2/WncyMqn0SA1RVLCKqIoH3dS3OI50mbXLtQQsgJM+1PmiHF0x1Dqr1ZBZA7MbAaOXDsRqeTuFhtBeflLIpIr9VwH2Ns0OUesXdMLREn4bhW2O8xR0A51gTCI0VQRlmHRjdYWHhjfrlA7ezF5BUnv5/lk5CHEHNSWbD9Ea75eOrbz7cQNbjCwl/ILVf4U0e5Dopg9iROoC3eH4yEkXgfen2biklqYCKx/pAQYZjMYHFEljI3FYpGVidRbI9rO/+aKPBbvH59/8JqmSRX5pzI4kKV7NmgyGhyf/UFCVB64rdujsNRYwBUIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3gTxCnVnHA69J0JEcSKV3hseHWwY/9tyu8P4DGqytI=;
 b=ThuWDfbtx6+EDxUJ3pAualobhPx3W64k9o6yWP8ZZauoD5DNXYGPgwUZRe4slRcPlWr1FFBx6yASJKxzNbYVtf+Egd2yctodbwUyXAF3paqO8SAY8D9G//EBg+MYIbwJnDWu3/6IWSm/nj2bjnTKwRoleSOX3hCiz+Ruf1yb9sk=
Received: from DS0PR12MB6534.namprd12.prod.outlook.com (2603:10b6:8:c1::19) by
 DM4PR12MB6086.namprd12.prod.outlook.com (2603:10b6:8:b2::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.16; Fri, 23 Sep 2022 15:44:21 +0000
Received: from DS0PR12MB6534.namprd12.prod.outlook.com
 ([fe80::cdf9:a98e:ade:43f7]) by DS0PR12MB6534.namprd12.prod.outlook.com
 ([fe80::cdf9:a98e:ade:43f7%9]) with mapi id 15.20.5588.014; Fri, 23 Sep 2022
 15:44:20 +0000
From: "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
To: "Dhillon, Jasdeep" <Jasdeep.Dhillon@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 00/31] DC Patches Sept 26, 2022
Thread-Topic: [PATCH 00/31] DC Patches Sept 26, 2022
Thread-Index: AQHYzhjelcrr2gQtUU6IBB61qqNmuK3tKXoQ
Date: Fri, 23 Sep 2022 15:44:20 +0000
Message-ID: <DS0PR12MB6534E6A401A9FC8853D6F2509C519@DS0PR12MB6534.namprd12.prod.outlook.com>
References: <20220922001821.320255-1-jdhillon@amd.com>
In-Reply-To: <20220922001821.320255-1-jdhillon@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=02a93385-9fbb-4273-956a-975c5bf7260c;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-09-23T15:44:18Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43e720f3-8e2b-4118-ee13-08da9d7a7b65
x-ms-traffictypediagnostic: DM4PR12MB6086:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4X2cHMvhdMp7cardaxCE9TJ1kPB0C9LOCpeiVgPzobWg7TUaHzSs8gU2QyNkTz2j0DJc2h1kO8bE/7CuHZb/qvvjDVPOxZuugxFm4W5DUGUlonPGPMhtATWm44uMGEcxS/Ne7U7t6shMWsA2S3HWie9Zlv0yz0DyKSQ3t48AUgE1T/Ao2MNZA2FuWjo08wkYZONlhCDLUD5S1o4bFP08LriC+7SclKRM9SYViLyskY2glsCVU/xDsiIBu5FnVTAv2i6e8Kn+Wd2t0DBNmtfEzh+g/ftOdzl75eSmxqt/9Ep+IFqb8eAUtXsiqQcLJfhrt9SBn5JgCU1Mtoi0HQuqgyEKEluNgE5ERAscFk/L2FH1IAadU0BDbtS6RdLHyp8Oz6jTxYVxf1mGIGZFtUG18TBYzRTppuEut8IEDjKJyM8a3+d/LD+EC5KYOO769eMGwYGxr4wxoHBg4hpQ1rv7xLDMrw0GXNelRgJq8RnRfqFgiTEfbhaO80Xlixi2NouQ11Qhd+1RD+UOHr6lfERY7/VwnHCh+3KEQRTrFwU1zDOIFcgYSwz/0FHAa2yy08MZ0zGkjndHMUFofBi1RQNop9KmRGLkKIXDnnBmSn68+oaqcQJojXISYLUgiQn+hGgraGSn9z/RVaSOoNFBJ1zErP9giOWr87TglQkUotTq1N8FIfQrRemYDe788y6UmZkJaQSTger3xX9iUnk1MHKxwcyS3aWbtEHfdTPZM51/hlY7IX447tJqFmUXq+SF72yS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6534.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199015)(110136005)(316002)(478600001)(71200400001)(54906003)(53546011)(26005)(7696005)(38070700005)(83380400001)(9686003)(52536014)(5660300002)(38100700002)(186003)(6506007)(66476007)(64756008)(2906002)(86362001)(55016003)(122000001)(4326008)(8936002)(66946007)(33656002)(8676002)(76116006)(66446008)(66556008)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rk9CcGxaanVEVXdxcFlnZlBObjh6MHZ6UFBPM2hIbmFaTm9DWURiVWp6aWhB?=
 =?utf-8?B?M3EwMVExcnBjWENjMCtCUW1LclMvUEUvdERVdk5ZQWptbDVvQXZvRHg0OUd5?=
 =?utf-8?B?aXVZK1o4YlBvMVU0RzFWNkdXejdCS09wYXExckR4OW1SSExaSFZvN3FYaHFH?=
 =?utf-8?B?dS9jUDNNMm5vWllaUXpxcWhXVk85c2liM3NBRkNRV0g4UHlnSUNLc2Fya29o?=
 =?utf-8?B?M0FGbmhkUmNKUHFMaTU5ZVZnWWM1OVVkWkNrSnZqcTZKeCtaNC9KQXZ0ZVVV?=
 =?utf-8?B?cnFxaG9QdHJNdS9pdC93Z1hIb0RuN2ZuRFk3d0c4TlBtSFZwc1YvVm11Nitr?=
 =?utf-8?B?eVlhUGtaZ0hRWnNxUmJwb0ZKSFBMeS95M2hOZ2hnWU40SS83YU5SVFdZMUxE?=
 =?utf-8?B?NVo2TUdmZUF1bExFcnduQWwyRXBVKzAwa0RDMXBuM3dXa0RZOU9SMHRDV2p3?=
 =?utf-8?B?WnJlM20yNDVWSkJBY2l0MUZCYi9PU3k2UzZhUTV0RkdscG1qeDA1ZkdoYnY5?=
 =?utf-8?B?ekZjS0ZnWllXQlN4ZmRTcTBmRWwrSzlrbGhtWldzNDR0dU5jRGFmUXFENDFy?=
 =?utf-8?B?MVoyakZOY1ZadkVpNERQTlVVNzFEY1pKcEEwTUNEOGhvVFhEZ3dHdSt0N0o1?=
 =?utf-8?B?MEpLcy9ISlFaTGVVRFEwRzJ5a29neGp5YVI0VXB3M1VkODF1cHJEKzIrUUNE?=
 =?utf-8?B?ZXlBRmJUR1cwWlFtc01XbWZib0V3aTlTZTFoYlFkSVVycDIyelhwOU5nMmgz?=
 =?utf-8?B?QXl1cUM1VFk3ZFRkcW5OeUtWMCtUUjlJWU1JSlllcm12VXhXb1phR0g1WStu?=
 =?utf-8?B?eUN4bUhDYVdtS1o1MUFSZ0lYYXkrQ0ZvM292SXRwU2tqMlpCME5VK0pMaDQ4?=
 =?utf-8?B?TFZHcklOakVkc2RWMlhZdTlKcDBISFJMRlFXbUJ0S09iWXlBZ1BmOEVLejh2?=
 =?utf-8?B?VzZnMEpGbVF4ZU1BQnE5Rnh5RkxaUG94eW5zT0pYM0JXSFRpWVNreEVtSU5Z?=
 =?utf-8?B?K3dQWm16SVVMVWZRWnVGeTY0UDdmQ25KL0p5S0t4dDh5Qm01Y0EvRmNiVkdt?=
 =?utf-8?B?UnBvSHNEc01iZmMreWtNVzJxRlRMSHN2azd4OVdXVmZiWVFHVnRMeWdyUDFk?=
 =?utf-8?B?cCs3am5QbVFXRUI4bWtXQmJEeGVxWmhieFBTRUpFOFNMQXZXbXNFcWxDOXd3?=
 =?utf-8?B?TEx4bThQeWl5WlNldVM5dXprNlNMSzBsM1VQN2NoQklFMTJtcTFrMTh5TzVU?=
 =?utf-8?B?RGl2dmsyZllnOXcyVUFNc3JMQlhOdngvM1RnVWlVYm9DTUY5YXJaTFVaZEVx?=
 =?utf-8?B?OVMxYmhPNTZrTXlNMFpKUmRlcVI3dVJ6N2oxOVVPeUxHbVNidHMydjdZSFQw?=
 =?utf-8?B?MTlaYnJhSUZGaU5OVjNiYzM5c0NNbzRtMWM1dCtjZytBK2twd2pTVGpSWld5?=
 =?utf-8?B?YXFpYmEwNW5oTkIwSFBPU212YWJ3NUFKYUpqbGMzd2l4dEgvRHo0YkpBdnpo?=
 =?utf-8?B?alZvck9yVWNJZjJ2N3VNSEpsMlRRaVV0Sy9pVlVKR25YMTg2bjZoRWFHU2ps?=
 =?utf-8?B?RjR3TFg2SHgvZHNMUTRzOStkVVNpNnIvRTZRTkhrTCtiUm1KaTRIVjBqRWI3?=
 =?utf-8?B?cmsyRTNGWHRGSjAxVlBrT3ZuWU5yd05ORjhaZ2FlNFNjRjlJZ2RwKzZlWGFx?=
 =?utf-8?B?U28rYzRGQ05UK3A5ek9EejZOdVJRZUg0QWYydFl1TjNNL3I0Ri9YRm5laHRm?=
 =?utf-8?B?WkNiRVpoMGlNck9NSDJrNXczeUpwbVJsbmY3OEJvTUtjYlRwMkxUN3FVdUJM?=
 =?utf-8?B?UjVVSHQ2YU5QWVpBWU96QzdEZjluL3YvZmZHeUJ1TGk3T3ZGbGJQUktnTW5R?=
 =?utf-8?B?cVVEaittZnB3OUJ5MS9RT0M3NFpmNk5Ob01tenFpc3FBU1o1STBlK20wOVg5?=
 =?utf-8?B?cWVhK05uYzVha0pIQ25XRTc4Z1JQTzhPWUExaDA0WnBCUXZCSFJJY0NqZDl0?=
 =?utf-8?B?aDEzY1I3YTNFNHp3dHcvNkw4MHd4YkhIczdGMjExVmhIc1pBejUvNUZ6QnF6?=
 =?utf-8?B?VjRqQ0k0RmpvMk0xdTJSL3RHZ2hrMlNpajIxSGRHa1hnT05FajZ3aXlHZU51?=
 =?utf-8?Q?BeIY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6534.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e720f3-8e2b-4118-ee13-08da9d7a7b65
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 15:44:20.8038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bOYvONXw6KG//noQjJWHD7e5M5wo3vKshj6SqWH8iUO1om9q2coHIuwHj0J3EJoq2Xz4qbjYRBtnxO3LiKywjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6086
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
Cc: "Wang, Chao-kai \(Stylon\)" <Stylon.Wang@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Zhuo,
 Qingqing \(Lillian\)" <Qingqing.Zhuo@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "Li, Roman" <Roman.Li@amd.com>, "Chiu, 
 Solomon" <Solomon.Chiu@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Lin, Wayne" <Wayne.Lin@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Gutierrez,
 Agustin" <Agustin.Gutierrez@amd.com>, "Kotarac, Pavle" <Pavle.Kotarac@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KSGkgYWxsLA0KDQpUaGlzIHdlZWsgdGhpcyBwYXRjaHNldCB3YXMgdGVzdGVk
IG9uIHRoZSBmb2xsb3dpbmcgc3lzdGVtczoNCg0KTGVub3ZvIFRoaW5rcGFkIFQxNHMgR2VuMiwg
d2l0aCBBTUQgUnl6ZW4gNSA1NjUwVQ0KUmVmZXJlbmNlIEFNRCBSWDY4MDANCkVuZ2luZWVyaW5n
IGJvYXJkIHdpdGggUnl6ZW4gOSA1OTAwSA0KDQpUaGVzZSBzeXN0ZW1zIHdlcmUgdGVzdGVkIG9u
IHRoZSBmb2xsb3dpbmcgZGlzcGxheSB0eXBlczoNCmVEUCwgKDEwODBwIDYwaHogWzQ1MDBVLCA1
NjUwVSwgNTkwMEhdKQ0KVkdBIGFuZCBEVkkgKDE2ODB4MTA1MCA2MEhaIFtEUCB0byBWR0EvRFZJ
LCBVU0ItQyB0byBEVkkvVkdBXSkNCkRQL0hETUkvVVNCLUMgKDE0NDBwIDE3MGh6LCA0ayA2MGh6
LCA0ayAxNDRoeiBbSW5jbHVkZXMgVVNCLUMgdG8gRFAvSERNSSBhZGFwdGVyc10pDQoNCk1TVCB0
ZXN0ZWQgd2l0aCBTdGFydGVjaCBNU1QxNERQMTIzRFAgYW5kIDJ4IDRrIDYwSHogZGlzcGxheXMN
CkRTQyB0ZXN0ZWQgd2l0aCBDYWJsZSBNYXR0ZXJzIDEwMTA3NSAoRFAgdG8gM3ggRFApLCBhbmQg
MjAxMzc1IChVU0ItQyB0byAzeCBEUCkgd2l0aCAzeCA0azYwIGRpc3BsYXlzDQoNClRoZSB0ZXN0
aW5nIGlzIGEgbWl4IG9mIGF1dG9tYXRlZCBhbmQgbWFudWFsIHRlc3RzLiBNYW51YWwgdGVzdGlu
ZyBpbmNsdWRlcyAoYnV0IGlzIG5vdCBsaW1pdGVkIHRvKToNCkNoYW5naW5nIGRpc3BsYXkgY29u
ZmlndXJhdGlvbnMgYW5kIHNldHRpbmdzDQpCZW5jaG1hcmsgdGVzdGluZw0KRmVhdHVyZSB0ZXN0
aW5nIChGcmVlc3luYywgZXRjLikNCg0KQXV0b21hdGVkIHRlc3RpbmcgaW5jbHVkZXMgKGJ1dCBp
cyBub3QgbGltaXRlZCB0byk6DQpTY3JpcHQgdGVzdGluZyAoc2NyaXB0cyB0byBhdXRvbWF0ZSBz
b21lIG9mIHRoZSBtYW51YWwgY2hlY2tzKQ0KSUdUIHRlc3RpbmcNCg0KVGhlIHBhdGNoc2V0IGNv
bnNpc3RzIG9mIHRoZSBhbWQtc3RhZ2luZy1kcm0tbmV4dCBicmFuY2ggKEhlYWQgY29tbWl0IC0g
NTQwNjVmYzE1MjYzODllYWM2NmZkOTBhYmM1MWZhOTdiMTJjMDE4NiAtPiBkcm0vYW1kZ3B1OiBG
aXggYW1kZ3B1X3ZtX3B0X2ZyZWUgd2FybmluZykgd2l0aCBuZXcgcGF0Y2hlcyBhZGRlZCBvbiB0
b3Agb2YgaXQuIFRoaXMgYnJhbmNoIGlzIHVzZWQgZm9yIGJvdGggVWJ1bnR1IGFuZCBDaHJvbWUg
T1MgdGVzdGluZyAoQ2hyb21lT1Mgb24gYSBiaS13ZWVrbHkgYmFzaXMpLg0KDQoNClRlc3RlZCBv
biBVYnVudHUgMjIuMDQgYW5kIENocm9tZSBPUw0KDQpUZXN0ZWQtYnk6IERhbmllbCBXaGVlbGVy
IDxkYW5pZWwud2hlZWxlckBhbWQuY29tPg0KDQoNClRoYW5rIHlvdSwNCg0KRGFuIFdoZWVsZXIN
ClNyLiBUZWNobm9sb2dpc3QgfCBBTUQNClNXIERpc3BsYXkNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KMSBDb21tZXJjZSBWYWxsZXkg
RHIgRSwgVGhvcm5oaWxsLCBPTiBMM1QgN1g2DQphbWQuY29tDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBEaGlsbG9uLCBKYXNkZWVwIDxKYXNkZWVwLkRoaWxsb25AYW1kLmNv
bT4NClNlbnQ6IFNlcHRlbWJlciAyMSwgMjAyMiA4OjE4IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCkNjOiBXZW50bGFuZCwgSGFycnkgPEhhcnJ5LldlbnRsYW5kQGFtZC5j
b20+OyBMaSwgU3VuIHBlbmcgKExlbykgPFN1bnBlbmcuTGlAYW1kLmNvbT47IExha2hhLCBCaGF3
YW5wcmVldCA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT47IFNpcXVlaXJhLCBSb2RyaWdvIDxS
b2RyaWdvLlNpcXVlaXJhQGFtZC5jb20+OyBQaWxsYWksIEF1cmFiaW5kbyA8QXVyYWJpbmRvLlBp
bGxhaUBhbWQuY29tPjsgWmh1bywgUWluZ3FpbmcgKExpbGxpYW4pIDxRaW5ncWluZy5aaHVvQGFt
ZC5jb20+OyBMaSwgUm9tYW4gPFJvbWFuLkxpQGFtZC5jb20+OyBMaW4sIFdheW5lIDxXYXluZS5M
aW5AYW1kLmNvbT47IFdhbmcsIENoYW8ta2FpIChTdHlsb24pIDxTdHlsb24uV2FuZ0BhbWQuY29t
PjsgQ2hpdSwgU29sb21vbiA8U29sb21vbi5DaGl1QGFtZC5jb20+OyBLb3RhcmFjLCBQYXZsZSA8
UGF2bGUuS290YXJhY0BhbWQuY29tPjsgR3V0aWVycmV6LCBBZ3VzdGluIDxBZ3VzdGluLkd1dGll
cnJlekBhbWQuY29tPjsgRGhpbGxvbiwgSmFzZGVlcCA8SmFzZGVlcC5EaGlsbG9uQGFtZC5jb20+
OyBXaGVlbGVyLCBEYW5pZWwgPERhbmllbC5XaGVlbGVyQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFU
Q0ggMDAvMzFdIERDIFBhdGNoZXMgU2VwdCAyNiwgMjAyMg0KDQpUaGlzIERDIHBhdGNoc2V0IGJy
aW5ncyBpbXByb3ZlbWVudHMgaW4gbXVsdGlwbGUgYXJlYXMuIEluIHN1bW1hcnksIHdlIGhhdmU6
DQoNCiAgICAtIExUVFBSIG1vZGUgY2FuIGJlIGJlIGR5bmFtaWNhbGx5IGNoYW5nZWQNCiAgICAt
IGZlYXR1cmVzIGFibGUgdG8gdXNlIHNhbWUgaW50ZXJmYWNlIHRvIHVwZGF0ZSBjdXJzb3IgaW5m
bw0KICAgIC0gZml4ZXMgZm9yIGxsdm0gY29tcGlsYXRpb24gaXNzdWVzDQogICAgLSBGaXhlcyBE
SU8gRklGTyB1bmRlcmZsb3cgYW5kIG90aGVyIEZJRk8gZXJyb3JzDQogICAgLSBQYXJ0aWFsbHkg
dmFsaWQgRURJRHMgaGFuZGxlZCBwcm9wZXJseQ0KICAgIC0gUGhhdG9tIHBpcGVzIGFyZSBza2lw
cGVkIHdoZW4gY2hlY2tpbmcgcGVuZGluZyBmbGlwDQogICAgLSBGaXhlZCBhdWRpbyBvbiBkaXNw
bGF5IGFmdGVyIHVucGx1Z2dpbmcNCg0KQ2M6IERhbmllbCBXaGVlbGVyIDxkYW5pZWwud2hlZWxl
ckBhbWQuY29tPg0KDQpBbHZpbiBMZWUgKDQpOg0KICBkcm0vYW1kL2Rpc3BsYXk6IFVwZGF0ZSBE
Q04zMiB0byB1c2UgbmV3IFNSIGxhdGVuY2llcw0KICBkcm0vYW1kL2Rpc3BsYXk6IFVwZGF0ZSBN
QUxMIFNTIE51bVdheXMgY2FsY3VsYXRpb24NCiAgZHJtL2FtZC9kaXNwbGF5OiBEaXNhYmxlIE1B
TEwgd2hlbiBUTVogc3VyZmFjZQ0KICBkcm0vYW1kL2Rpc3BsYXk6IEZpeCBDQUIgYWxsb2NhdGlv
biBjYWxjdWxhdGlvbg0KDQpBcmljIEN5ciAoMyk6DQogIGRybS9hbWQvZGlzcGxheTogUmVtb3Zl
IGludGVyZmFjZSBmb3IgcGVyaW9kaWMgaW50ZXJydXB0IDENCiAgZHJtL2FtZC9kaXNwbGF5OiBG
aXggYXVkaW8gb24gZGlzcGxheSBhZnRlciB1bnBsdWdnaW5nIGFub3RoZXINCiAgZHJtL2FtZC9k
aXNwbGF5OiAzLjIuMjA1DQoNCkF1cmFiaW5kbyBQaWxsYWkgKDIpOg0KICBkcm0vYW1kL2Rpc3Bs
YXk6IHNraXAgcGhhbnRvbSBwaXBlcyB3aGVuIGNoZWNraW5nIGZvciBwZW5kaW5nIGZsaXANCiAg
ZHJtL2FtZC9kaXNwbGF5OiBmaXggYSBkaXZpZGUgYnkgemVybyBlcnJvcg0KDQpCcmFuZG9uIFN5
dSAoMSk6DQogIEFkZCBkZWJ1ZyBvcHRpb24gZm9yIGV4aXRpbmcgaWRsZSBvcHRpbWl6YXRpb25z
IG9uIGN1cnNvciB1cGRhdGVzDQoNCkNoYXJsZW5lIExpdSAoMSk6DQogIGRybS9hbWQvZGlzcGxh
eTogYWRkIGRlYnVnIGtleXMgZm9yIG92ZXJyaWRlIGJpb3Mgc2V0dGluZ3MuDQoNCkRpbGxvbiBW
YXJvbmUgKDEpOg0KICBkcm0vYW1kL2Rpc3BsYXk6IEZpeCB2YXJpb3VzIGR5bmFtaWMgT0RNIHRy
YW5zaXRpb25zIG9uIERDTjMyDQoNCkVyaWMgQmVybnN0ZWluICgxKToNCiAgZHJtL2FtZC9kaXNw
bGF5OiBSZW1vdmUgYXNzZXJ0IGZvciBvZG0gdHJhbnNpdGlvbiBjYXNlDQoNCklhbiBDaGVuICgx
KToNCiAgQWRkIEFCTSBjb250cm9sIHRvIHBhbmVsX2NvbmZpZyBzdHJ1Y3QuDQoNCklseWEgQmFr
b3VsaW4gKDEpOg0KICBkcm0vYW1kL2Rpc3BsYXk6IENoYW5nZSBFRElEIGZhbGxiYWNrIGNvbmRp
dGlvbg0KDQpNYXggVHNlbmcgKDEpOg0KICBkcm0vYW1kL2Rpc3BsYXk6IEN1cnNvciBJbmZvIFVw
ZGF0ZSByZWZhY3Rvcg0KDQpNaWNoYWVsIFN0cmF1c3MgKDEpOg0KICBkcm0vYW1kL2Rpc3BsYXk6
IFJlZmFjdG9yIExUVFBSIG1vZGUgc2VsZWN0aW9uDQoNCk5hdGhhbiBDaGFuY2VsbG9yICgyKToN
CiAgZHJtL2FtZC9kaXNwbGF5OiBSZWR1Y2UgbnVtYmVyIG9mIGFyZ3VtZW50cyBvZiBkbWwzMTQn
cw0KICAgIENhbGN1bGF0ZVdhdGVybWFya3NBbmREUkFNU3BlZWRDaGFuZ2VTdXBwb3J0KCkNCiAg
ZHJtL2FtZC9kaXNwbGF5OiBSZWR1Y2UgbnVtYmVyIG9mIGFyZ3VtZW50cyBvZiBkbWwzMTQncw0K
ICAgIENhbGN1bGF0ZUZsaXBTY2hlZHVsZSgpDQoNCk5pY2hvbGFzIEthemxhdXNrYXMgKDMpOg0K
ICBkcm0vYW1kL2Rpc3BsYXk6IFdyYXAgT1RHIGRpc2FibGUgd29ya2Fyb3VuZCB3aXRoIEZJRk8g
Y29udHJvbA0KICBkcm0vYW1kL2Rpc3BsYXk6IEFkZCBleHBsaWNpdCBGSUZPIGRpc2FibGUgZm9y
IERQIGJsYW5rDQogIGRybS9hbWQvZGlzcGxheTogRG8gRElPIEZJRk8gZW5hYmxlIGFmdGVyIERQ
IHZpZGVvIHN0cmVhbSBlbmFibGUNCg0KU2Ftc29uIFRhbSAoMSk6DQogIGRybS9hbWQvZGlzcGxh
eTogZmlsbCBpbiBjbG9jayB2YWx1ZXMgd2hlbiBEUE0gaXMgbm90IGVuYWJsZWQNCg0KVGFpbXVy
IEhhc3NhbiAoMyk6DQogIGRybS9hbWQvZGlzcGxheTogQXZvaWQgYXZvaWQgdW5uZWNlc3Nhcnkg
cGl4ZWwgcmF0ZSBkaXZpZGVyDQogICAgcHJvZ3JhbW1pbmcNCiAgZHJtL2FtZC9kaXNwbGF5OiBG
aXggdHlwbyBpbiBnZXRfcGl4ZWxfcmF0ZV9kaXYNCiAgZHJtL2FtZC9kaXNwbGF5OiBBdm9pZCB1
bm5lY2Vzc2FyeSBwaXhlbCByYXRlIGRpdmlkZXIgcHJvZ3JhbW1pbmcNCg0KVG9tIFJpeCAoMyk6
DQogIGRybS9hbWQvZGlzcGxheTogcmVtb3ZlIHJlZHVuZGFudCBDYWxjdWxhdGVUV2FpdCdzDQog
IGRybS9hbWQvZGlzcGxheTogcmVmYWN0b3IgQ2FsY3VsYXRlV3JpdGVCYWNrRGVsYXkgdG8gdXNl
IHZiYV92YXJzX3N0DQogICAgcHRyDQogIGRybS9hbWQvZGlzcGxheTogcmVtb3ZlIHJlZHVuZGFu
dCBDYWxjdWxhdGVSZW1vdGVTdXJmYWNlRmxpcERlbGF5J3MNCg0KV2VuamluZyBMaXUgKDIpOg0K
ICBkcm0vYW1kL2Rpc3BsYXk6IGFkZCBtaXNzaW5nIG51bGwgY2hlY2sNCiAgZHJtL2FtZC9kaXNw
bGF5OiBwb2xsaW5nIHZpZCBzdHJlYW0gc3RhdHVzIGluIGhwbyBkcCBibGFuaw0KDQogLi4uL2Ry
bS9hbWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyMi5jICAgIHwgIDIxICstDQogLi4uL2Rj
L2Nsa19tZ3IvZGNuMzE0L2RjbjMxNF9jbGtfbWdyLmMgICAgICAgIHwgIDExICstDQogLi4uL2Rp
c3BsYXkvZGMvY2xrX21nci9kY24zMi9kY24zMl9jbGtfbWdyLmMgIHwgIDE0ICsNCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jICAgICAgfCAxMjcgKysrLS0NCiAuLi4v
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZGRjLmMgfCAgMTkgKyAgLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMgIHwgMzAxICsrKysrKy0tLS0t
DQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHBpYS5jICAgIHwgIDM0ICst
DQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJlYW0uYyAgIHwgICAxICsN
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCAgICAgICAgICAgfCAgIDggKy0N
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfbGluay5oICAgICAgfCAgIDcgKy0N
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfc3RyZWFtLmggICAgfCAgIDYgKy0N
CiAuLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jICAgfCAgIDYgKy0N
CiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMgfCAgMzUgKy0N
CiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmggfCAgIDMgKy0N
CiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjMwL2RjbjMwX3Jlc291cmNlLmMgfCAgIDMgKy0N
CiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNuMzAxL2RjbjMwMV9yZXNvdXJjZS5jICAgfCAgIDEgKw0K
IC4uLi9hbWQvZGlzcGxheS9kYy9kY24zMDIvZGNuMzAyX3Jlc291cmNlLmMgICB8ICAgMyArLQ0K
IC4uLi9hbWQvZGlzcGxheS9kYy9kY24zMDMvZGNuMzAzX3Jlc291cmNlLmMgICB8ICAgMSArDQog
Li4uL2RjL2RjbjMxL2RjbjMxX2hwb19kcF9zdHJlYW1fZW5jb2Rlci5jICAgIHwgICA2ICstDQog
Li4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24zMTQvZGNuMzE0X2RjY2cuYyAgIHwgIDQ3ICsrDQog
Li4uL2RjL2RjbjMxNC9kY24zMTRfZGlvX3N0cmVhbV9lbmNvZGVyLmMgICAgIHwgIDI1ICstDQog
Li4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMzIvZGNuMzJfZGNjZy5jIHwgIDUzICsrDQog
Li4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24zMi9kY24zMl9odWJidWIuYyAgIHwgIDEwICstDQog
Li4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24zMi9kY24zMl9od3NlcS5jICAgIHwgMjgwICsrKysr
Ky0tLS0NCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjMyL2RjbjMyX2h3c2VxLmggICAgfCAg
IDggKw0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjMyL2RjbjMyX2luaXQuYyB8ICAg
MiArDQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24zMi9kY24zMl9yZXNvdXJjZS5jIHwgIDI3
ICstDQogLi4uL2Rpc3BsYXkvZGMvZGNuMzIvZGNuMzJfcmVzb3VyY2VfaGVscGVycy5jIHwgICAy
ICstDQogLi4uL2FtZC9kaXNwbGF5L2RjL2RjbjMyMS9kY24zMjFfcmVzb3VyY2UuYyAgIHwgICAz
ICsNCiAuLi4vZGMvZG1sL2RjbjIwL2Rpc3BsYXlfbW9kZV92YmFfMjAuYyAgICAgICAgfCAgOTgg
Ky0tLQ0KIC4uLi9kYy9kbWwvZGNuMjAvZGlzcGxheV9tb2RlX3ZiYV8yMHYyLmMgICAgICB8IDE3
NiArLS0tLS0NCiAuLi4vZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEuYyAgICAgICAg
fCAxNzMgKy0tLS0tDQogLi4uL2RjL2RtbC9kY24zMC9kaXNwbGF5X21vZGVfdmJhXzMwLmMgICAg
ICAgIHwgIDkyICstLS0NCiAuLi4vZGMvZG1sL2RjbjMxL2Rpc3BsYXlfbW9kZV92YmFfMzEuYyAg
ICAgICAgfCAgODkgKy0tDQogLi4uL2RjL2RtbC9kY24zMTQvZGlzcGxheV9tb2RlX3ZiYV8zMTQu
YyAgICAgIHwgNTA5ICsrKystLS0tLS0tLS0tLS0tLQ0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZG1sL2RjbjMyL2RjbjMyX2ZwdS5jICB8ICA3MCArKy0NCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2Rj
L2RtbC9kY24zMi9kY24zMl9mcHUuaCAgfCAgIDIgKw0KIC4uLi9kYy9kbWwvZGNuMzIvZGlzcGxh
eV9tb2RlX3ZiYV8zMi5jICAgICAgICB8ICA0MiArLQ0KIC4uLi9kYy9kbWwvZGNuMzIvZGlzcGxh
eV9tb2RlX3ZiYV91dGlsXzMyLmMgICB8ICAzMCAtLQ0KIC4uLi9kYy9kbWwvZGNuMzIvZGlzcGxh
eV9tb2RlX3ZiYV91dGlsXzMyLmggICB8ICAxMCArLQ0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2luYy9kY19saW5rX2RwLmggICB8ICAgNSArDQogLi4uL2FtZC9kaXNwbGF5L2RjL2luYy9o
dy9jbGtfbWdyX2ludGVybmFsLmggIHwgICAyICsNCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9pbmMvaHdfc2VxdWVuY2VyLmggfCAgIDkgKy0NCiAuLi4vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3
X3NlcXVlbmNlcl9wcml2YXRlLmggfCAgIDIgKw0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rt
dWIvaW5jL2RtdWJfY21kLmggICB8ICAgNSArDQogLi4uL2FtZC9kaXNwbGF5L2luY2x1ZGUvbGlu
a19zZXJ2aWNlX3R5cGVzLmggIHwgICAxICsNCiBzY3JpcHRzL2V4dHJhY3QtY2VydCAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCBCaW4gMCAtPiAxODMyMCBieXRlcw0KIDQ3IGZpbGVzIGNoYW5n
ZWQsIDk1MiBpbnNlcnRpb25zKCspLCAxNDI3IGRlbGV0aW9ucygtKSAgY3JlYXRlIG1vZGUgMTAw
NzU1IHNjcmlwdHMvZXh0cmFjdC1jZXJ0DQoNCi0tDQoyLjI1LjENCg0K
